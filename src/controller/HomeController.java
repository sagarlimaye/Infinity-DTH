package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.ChannelDAO;
import data.PackageDAO;
import model.Channel;
import model.Package;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String option = request.getParameter("option");
		switch(option) {
			case "CreateChannel":
			{
				Channel channel = new Channel();
				ChannelDAO dao = null;
				channel.setName(request.getParameter("channelName"));
				channel.setBand(request.getParameter("channelBand"));
				channel.setVideoFreq(Float.parseFloat(request.getParameter("videoFreq")));
				channel.setAudioFreq(Float.parseFloat(request.getParameter("audioFreq")));
				channel.setChargeType(request.getParameter("chargeType"));
				channel.setTransmissionType(request.getParameter("transmissionType"));
				channel.setCharge(Integer.parseInt(request.getParameter("charge")));
				try
				{
					dao = new ChannelDAO();
					dao.addChannel(channel);
				}
				catch(Exception e)
				{
					// log other exception
					System.out.println(e.getMessage());
				}
				finally {
					if(dao != null)
						dao.close();
					getServletContext().getRequestDispatcher("/channel.jsp").forward(request, response);
				}
			}
			break;
				
			case "ChannelInformation":
			{
				HttpSession session = request.getSession();

				ChannelDAO dao = null;
				try {
					dao = new ChannelDAO();
					List<Channel> channelInfo = new ArrayList<Channel>();
					ChannelDAO channelDB = new ChannelDAO();
					channelInfo = channelDB.ChannelInformation();
					session.setAttribute("channelInf",channelInfo);
					getServletContext().getRequestDispatcher("/channel.jsp").forward(request, response);
					
				}
				catch(SQLException e) {
					
				}	
				
				finally {
					if(dao != null)
						dao.close();
				}
				
			}
				break;
			case "UpdateChannel":
			{
				Channel update = new Channel();
				ChannelDAO dao = null;
				update.setChargeType(request.getParameter("chargeType"));
				update.setTransmissionType(request.getParameter("transmissionType"));
				update.setCharge(Integer.parseInt(request.getParameter("charge")));
				update.setChannel_id(Integer.parseInt("channel_id"));
				try
				{
					dao = new ChannelDAO();
					dao.updateChannel(update);
				}
				catch(SQLException e)
				{
					// log SQL exception
					
				}
				catch(Exception e)
				{
					// log other exception
				}
				finally {
					if(dao != null)
						dao.close();
					response.sendRedirect("/dashboard.jsp");
				}
			}
			break;
			case "CreatePackage":
			{
				Package pkg = new Package();
				PackageDAO pkgDao = null;
				ChannelDAO channelDao =  null;
				pkg.setName(request.getParameter("pkgName"));
				pkg.setChargingType(request.getParameter("chargeType"));
				pkg.setTransmissionType(request.getParameter("transmissionType"));
				pkg.setCost(Integer.parseInt(request.getParameter("cost")));
				pkg.setAddedByDefault(Boolean.parseBoolean(request.getParameter("addedByDefault")));
				DateFormat df = new SimpleDateFormat("dd/mm/yyyy");
				try {
					pkg.setAvailableFrom(df.parse(request.getParameter("availableFrom")));
				} catch (ParseException e1) {
				}
				try {
					pkg.setAvailableTo(df.parse(request.getParameter("availableTo")));
				} catch (ParseException e1) {
				}
				String[] channelIds = request.getParameterValues("channels");
				
				try
				{
					pkgDao = new PackageDAO();
					channelDao = new ChannelDAO();
					Channel[] channels = null;
					ArrayList<Channel> channelList = new ArrayList<Channel>();
					for(String id : channelIds) {
						channelList.add(channelDao.getChannelById(Integer.parseInt(id)));
					}
					pkg.setChannels(channelList.toArray(channels));
					pkgDao.addPackage(pkg);
				}
				catch(Exception e)
				{
					// log other exception
					System.out.println(e.getMessage());
				}
				finally {
					if(pkgDao != null)
						pkgDao.close();
					if(channelDao != null)
						channelDao.close();
					getServletContext().getRequestDispatcher("/channel.jsp").forward(request, response);
				}
			}
			break;
			default:
				response.sendRedirect("/dashboard.jsp");
				break;
		}
		
		
	}

}

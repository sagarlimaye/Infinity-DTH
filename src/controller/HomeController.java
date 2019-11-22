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
				if (channel.getChargeType().equalsIgnoreCase("free")) {
					channel.setCharge(0);
				} else {
					channel.setCharge(Float.parseFloat(request.getParameter("charge")));
				}
				
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
					if(dao != null) dao.close();
					getServletContext().getRequestDispatcher("/HomeController?option=ChannelInformation").forward(request, response);
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
					e.printStackTrace();
				}	
				
				finally {
					if(dao != null) dao.close();
				}
			}
			break;
			case "UpdateChannel":
			{
				Channel update = new Channel();
				ChannelDAO dao = null;
				
				String id = (request.getParameter("channel_Id"));
				update.setChannel_id(Integer.parseInt(id.trim()));
				update.setName(request.getParameter("channelName"));
				update.setAudioFreq(Float.parseFloat(request.getParameter("audioFreq")));
				update.setVideoFreq(Float.parseFloat(request.getParameter("videoFreq")));
				update.setBand(request.getParameter("channelBand"));
				update.setChargeType(request.getParameter("chargeType"));
				update.setTransmissionType(request.getParameter("transmissionType"));
				if (update.getChargeType().equalsIgnoreCase("free")) {
					update.setCharge(0);
				} else {
					update.setCharge(Float.parseFloat(request.getParameter("charge")));
				}
				
				try
				{
					dao = new ChannelDAO();
					dao.updateChannel(update);
				}
				catch(SQLException e)
				{
					e.printStackTrace();
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				finally {
					if(dao != null) dao.close();
					getServletContext().getRequestDispatcher("/HomeController?option=ChannelInformation").forward(request, response);
				}
			}
			break;
			case "DeleteChannel": {
				String ID = request.getParameter("remove_id").trim();
				int removeID = Integer.parseInt(ID);
				ChannelDAO dao = null;
				try
				{
					dao = new ChannelDAO();
					dao.DeleteChannel(removeID);
				}
				catch(SQLException e)
				{
					e.printStackTrace();
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				finally {
					if(dao != null) dao.close();
					getServletContext().getRequestDispatcher("/HomeController?option=ChannelInformation").forward(request, response);
				}
				
			}
			break;
			case "PackageInfo":
			{
				HttpSession session = request.getSession();

				PackageDAO dao = null;
				try {
					dao = new PackageDAO();
					getServletContext().getRequestDispatcher("/ViewPackage.jsp").forward(request, response);
					
				}
				catch(SQLException e) {
					e.printStackTrace();
				}	
				
				finally {
					if(dao != null) dao.close();
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
				pkg.setCost(0);
				pkg.setAddedByDefault(Boolean.parseBoolean(request.getParameter("addedByDefault")));
				DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
				try {
					String afs =request.getParameter("availableFrom"); 
					String ats = request.getParameter("availableTo");
					java.util.Date af = df.parse(afs);
					java.util.Date at = df.parse(ats);
					pkg.setAvailableFrom(af);
					pkg.setAvailableTo(at);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				String[] channelIds = request.getParameterValues("channels");
				
				try
				{
					pkgDao = new PackageDAO();
					channelDao = new ChannelDAO();
					ArrayList<Channel> channelList = new ArrayList<Channel>();
					for(String id : channelIds) {
						channelList.add(channelDao.getChannelById(Integer.parseInt(id)));
					}
					Channel[] channels = channelList.toArray(new Channel[channelList.size()]);
					pkg.setChannels(channels);
					pkgDao.addPackage(pkg);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				finally {
					if(pkgDao != null) pkgDao.close();
					if(channelDao != null) channelDao.close();
					getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
				}
			}
			break;
			case "PrepareCreatePackage":
			{
				ChannelDAO channelDao =  null;
				try {
					channelDao = new ChannelDAO();
					Channel[] channels = channelDao.getUnassignedChannels();
					request.setAttribute("channels", channels);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally {
					if(channelDao != null)
						channelDao.close();
					getServletContext().getRequestDispatcher("/ChannelPackages.jsp").forward(request, response);
				}
			}
			break;
			default:
				response.sendRedirect("/ChannelPackages.jsp");
				break;
		}
	}
}

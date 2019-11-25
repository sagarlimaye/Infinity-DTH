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

import data.CategoryDAO;
import data.ChannelDAO;
import data.PackageDAO;
import data.SetTopBoxDAO;
import model.Category;
import model.Channel;
import model.Package;
import model.SetTopBox;

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
				if (channel.getChargeType().equalsIgnoreCase("fta")) {
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
					ChannelDAO channelDB = new ChannelDAO();
					Channel[] channelInfo = channelDB.ChannelInformation();
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
			case "CreatePackage":
			{
				Package pkg = new Package();
				PackageDAO pkgDao = null;
				ChannelDAO channelDao =  null;
				float cost = 0;
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
						Channel channel = channelDao.getChannelById(Integer.parseInt(id));
						cost+=channel.getCharge();
						channelList.add(channel);
					}
					Channel[] channels = channelList.toArray(new Channel[channelList.size()]);
					pkg.setChannels(channels);
					pkg.setCost(cost);
					pkgDao.addPackage(pkg);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				finally {
					if(pkgDao != null) pkgDao.close();
					if(channelDao != null) channelDao.close();
					getServletContext().getRequestDispatcher("/HomeController?option=ViewPackage").forward(request, response);
				}
			}
			break;
			
			case "CreateCategory":
			{
				Category category = new Category();
				CategoryDAO dao = null;
					
				category.setCategoryName(request.getParameter("channelName"));
				category.setMinChannels(Integer.parseInt(request.getParameter("minChannels")));
				category.setMaxChannels(Integer.parseInt(request.getParameter("maxChannels")));
				
				try
				{
					dao = new CategoryDAO();
					dao.addCategory(category);
				}
				catch(Exception e)
				{						
					// log other exception
					System.out.println(e.getMessage());
				}
				finally 
				{
					if (dao != null) 
						dao.close();				
					getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);
				}
					
			}
		
			case "PrepareCreatePackage":
			{
				ChannelDAO channelDao =  null;
				CategoryDAO dao = null;

				try {
					dao = new CategoryDAO();
					/*List<Category> names = dao.CategoryNames();
					request.setAttribute("categoryInf", names);*/

					channelDao = new ChannelDAO();
					Channel[] channels = channelDao.ChannelInformation();
					request.setAttribute("channels", channels);
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally {
					if(channelDao != null)
						channelDao.close();
					getServletContext().getRequestDispatcher("/CreatePackages.jsp").forward(request, response);
				}
			}
			break;
			case "ViewPackage":
			{

				PackageDAO dao = null;
				try {
					dao = new PackageDAO();
					List<Package> packageInfo = new ArrayList<Package>();
					packageInfo = dao.PackInformation();
					request.setAttribute("inf",packageInfo);
					getServletContext().getRequestDispatcher("/ViewPackage.jsp").forward(request, response);
					
				}
				catch(SQLException e) {
					e.printStackTrace();
				}	
				
				finally {
					if(dao != null)
						dao.close();
				}
				
			}
			break;
			case "DeletePackage": {
				String ID = request.getParameter("remove_id").trim();
				int removeID = Integer.parseInt(ID);
				PackageDAO dao = null;
				try
				{
					dao = new PackageDAO();
					dao.DeletePackage(removeID);
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
					if(dao != null)
						dao.close();
					getServletContext().getRequestDispatcher("/HomeController?option=ViewPackage").forward(request, response);
				}
				
			}
			break;
			case "UpdatePackage":
			{
				Package update = new Package();
				PackageDAO dao = null;
				
				String id = (request.getParameter("package_Id"));
				update.setPackageID(Integer.parseInt(id.trim()));
				update.setName(request.getParameter("packageName"));
				update.setChargingType((request.getParameter("chargingType")));
				update.setTransmissionType(request.getParameter("transmissionType"));
				update.setCost(Float.parseFloat(request.getParameter("chargeCost")));
				//update.setAddedByDefault(Boolean.parseBoolean(request.getParameter("addedByDef")));
				DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
				try {
					update.setAvailableFrom(df.parse(request.getParameter("availableFrom")));
					update.setAvailableTo(df.parse(request.getParameter("availableTo")));
					System.out.println("Date is "+update.getAvailableFrom());
				} catch (ParseException e1) {
					e1.printStackTrace();
				}
				try
				{
					dao = new PackageDAO();
					dao.UpdatePackage(update);
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
					if(dao != null)
						dao.close();
					getServletContext().getRequestDispatcher("/HomeController?option=ViewPackage").forward(request, response);
				}
			}
			break;					
			case "SetTopBoxInformation":
			{
				HttpSession session = request.getSession();
				SetTopBoxDAO dao = null;				
				try {
					dao = new SetTopBoxDAO();
					SetTopBoxDAO setTopBoxDB = new SetTopBoxDAO();
					SetTopBox[] setTopBoxInfo = setTopBoxDB.SetTopBoxInformation();
					session.setAttribute("setTopBoxInf", setTopBoxInfo);
					getServletContext().getRequestDispatcher("/viewSetTopBox.jsp").forward(request, response);
					
				}
				catch(SQLException e) {
					e.printStackTrace();
				}	
				
				finally {
					if(dao != null) dao.close();
				}				
			}
			break;
			default:
				response.sendRedirect("/ChannelPackages.jsp");
				break;
		}
	}
	

}

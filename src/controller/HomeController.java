package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import argo.format.JsonFormatter;
import argo.format.PrettyJsonFormatter;
import argo.jdom.JsonArrayNodeBuilder;
import argo.jdom.JsonObjectNodeBuilder;

import static argo.jdom.JsonNodeBuilders.*;

import data.CategoryDAO;
import data.ChannelDAO;
import data.FeatureDAO;
import data.PackageDAO;
import data.SetTopBoxDAO;
import model.Category;
import model.Channel;
import model.Feature;
import model.Package;
import model.SetTopBox;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/HomeController")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final JsonFormatter JSON_FORMATTER = new PrettyJsonFormatter();
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
		if (option == null) response.sendRedirect("/InfinityDTH/Admin.jsp");
		else {
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
						e.printStackTrace();
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
						Channel[] channelInfo = dao.ChannelInformation();
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
					if (update.getChargeType().equalsIgnoreCase("fta")) {
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
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
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
						if(channelIds != null && channelIds.length != 0)
						{
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
						}
						
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
						
					category.setCategoryName(request.getParameter("categoryName"));
					String min = request.getParameter("minChannels").trim();
					category.setMinChannels(Integer.parseInt(min));
					String max = request.getParameter("maxChannels").trim();
					category.setMaxChannels(Integer.parseInt(max));
					
					try
					{
						dao = new CategoryDAO();
						dao.addCategory(category);
					}
					catch(Exception e)
					{						
						e.printStackTrace();
					}
					finally 
					{
						if (dao != null) 
							dao.close();				
						getServletContext().getRequestDispatcher("/ViewCategories.jsp").forward(request, response);
					}
						
				}
				break;
				case "ViewCategory":
				{
					HttpSession session = request.getSession();
	
					CategoryDAO dao = null;
					try {
						dao = new CategoryDAO();
						List categoryInfo = new ArrayList<Category>();
						categoryInfo = dao.CategoryInformation();
						session.setAttribute("categoryInf",categoryInfo);
						getServletContext().getRequestDispatcher("/ViewCategories.jsp").forward(request, response);
						
					}
					catch(SQLException e) {
						e.printStackTrace();
					}	
					
					finally {
						if(dao != null) dao.close();
					}
				}
				break;
				
				case "PrepareCreatePackage":
				{
					ChannelDAO channelDao =  null;
					CategoryDAO dao = null;
	
					try {
						dao = new CategoryDAO();
						List<Category> names = dao.CategoryInformation();
						request.setAttribute("categoryInf", names);
	
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
					ChannelDAO channelDao = null;
					PackageDAO dao = null;
					try {
						dao = new PackageDAO();
						List<Package> packageInfo = new ArrayList<Package>();
						packageInfo = dao.PackInformation();
						request.setAttribute("inf",packageInfo);
						
						channelDao = new ChannelDAO();
						Channel[] channels = channelDao.ChannelInformation();
						request.setAttribute("channels", channels);
						
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
					ChannelDAO channelDao =  null;
					
					String id = (request.getParameter("package_Id"));
					update.setPackageID(Integer.parseInt(id.trim()));
					update.setName(request.getParameter("packageName"));
					update.setChargingType(request.getParameter("chargeType"));
					update.setTransmissionType(request.getParameter("transmissionType"));
					update.setCost(Float.parseFloat(request.getParameter("chargeCost")));
					update.setAddedByDefault(Boolean.parseBoolean(request.getParameter("addedByDefault")));
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					
					try {
						
						String afs =request.getParameter("availableFrom"); 
						String ats = request.getParameter("availableTo");
						java.util.Date af = df.parse(afs);
						java.util.Date at = df.parse(ats);
						update.setAvailableFrom(af);
						update.setAvailableTo(at);
					} catch (ParseException e1) {
						e1.printStackTrace();
					}
					String[] channelIds = request.getParameterValues("channels");
					
					try
					{
						dao = new PackageDAO();
					
						if(channelIds != null && channelIds.length != 0)
						{
							channelDao = new ChannelDAO();
							ArrayList<Channel> channelList = new ArrayList<Channel>();
							for(String channelId : channelIds) {
								Channel channel = channelDao.getChannelById(Integer.parseInt(channelId));
								channelList.add(channel);
							}
							Channel[] channels = channelList.toArray(new Channel[channelList.size()]);
							update.setChannels(channels);
						}
						
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
						if(dao != null) dao.close();
						if(channelDao != null) channelDao.close();
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
						SetTopBox[] setTopBoxInfo = dao.SetTopBoxInformation();
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
				case "PrepareCreateSetTopBox":
				{
					FeatureDAO dao = null;
					try {
						dao = new FeatureDAO();
						Feature[] features = dao.getAllFeatures();
						request.setAttribute("features", features);
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					finally {
						if(dao != null)
							dao.close();
						getServletContext().getRequestDispatcher("/SetTopBox.jsp").forward(request, response);
					}
				}
				break;
				case "CreateSetTopBox":
				{
					SetTopBox stb = new SetTopBox();
					SetTopBoxDAO stbDao = null;
					FeatureDAO featureDao =  null;
					stb.setType(request.getParameter("type"));
					stb.setDimensions(request.getParameter("dimensions"));
					stb.setPrice(Float.parseFloat(request.getParameter("price")));
					stb.setInstallation_charges(Float.parseFloat(request.getParameter("installationCharges")));
					stb.setUpgradation_charges(Float.parseFloat("upgradationCharges"));
					stb.setMac_id(request.getParameter("macId"));
					stb.setControl_asset_id(Integer.parseInt(request.getParameter("controlAssetId")));
					stb.setBilling_type(request.getParameter("billingType"));
					stb.setDiscount(Float.parseFloat(request.getParameter("discount")));
					stb.setDish_asset_id(Integer.parseInt(request.getParameter("dishAssetId")));
					stb.setRefundable_deposit(Float.parseFloat(request.getParameter("refundableDeposit")));
					stb.setStatus(Integer.parseInt(request.getParameter("status")));
					
					String[] featureIds = request.getParameterValues("features");
					
					try
					{
						stbDao = new SetTopBoxDAO();
						if(featureIds != null && featureIds.length != 0)
						{
							featureDao = new FeatureDAO();
							ArrayList<Feature> featureList = new ArrayList<Feature>();
							for(String id : featureIds) {
								Feature feature = featureDao.getFeatureById(Integer.parseInt(id));
								featureList.add(feature);
							}
							Feature[] features = featureList.toArray(new Feature[featureList.size()]);
							stb.setFeatures(features);
						}
						
						stbDao.addSetTopBox(stb);
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
					finally {
						if(stbDao != null) stbDao.close();
						if(featureDao != null) featureDao.close();
						getServletContext().getRequestDispatcher("/HomeController?option=SetTopBoxInformation").forward(request, response);
					}
				}
				break;
				case "FeatureList":
				{
					response.setContentType("application/json");
					PrintWriter out = null;
					FeatureDAO dao = null;
					try {
						dao = new FeatureDAO();
						out = response.getWriter();
						Feature[] features = dao.getAllFeatures();
						JsonArrayNodeBuilder dataBuilder = anArrayBuilder();
						JsonObjectNodeBuilder nodeBuilder = anObjectBuilder().withField("success", aTrueBuilder());
						for(int i = 0; i<features.length; i++) {
							dataBuilder.withElement(anObjectBuilder().withField("name", aStringBuilder(features[i].getName())));
						}
						out.print(JSON_FORMATTER.format(nodeBuilder.withField("data", dataBuilder).build()));
					}
					catch(Exception e) {
						e.printStackTrace();
						out.print(JSON_FORMATTER.format(anObjectBuilder().withField("success", aFalseBuilder()).build()));
					}
					finally {
						if(dao != null)
							dao.close();
						if(out != null)
							out.close();
					}
				}
				break;
				case "FeatureAdd":
				{
					response.setContentType("application/json");
					PrintWriter out = null;
					FeatureDAO dao = null;
					try {
						dao = new FeatureDAO();
						out = response.getWriter();
						Feature feature = new Feature();
						feature.setName(request.getParameter("featureName"));
						dao.addFeature(feature);
						out.print(JSON_FORMATTER.format(anObjectBuilder().withField("success", aTrueBuilder()).build()));
					}
					catch(Exception e)
					{
						e.printStackTrace();
						out.print(JSON_FORMATTER.format(anObjectBuilder().withField("success", aFalseBuilder()).build()));
					}
					finally {
						if(out != null)
							out.close();
						if(dao != null)
							dao.close();
					}
				}
				break;
				case "FeatureRemove":
				{
					response.setContentType("application/json");
					PrintWriter out = null;
					FeatureDAO dao = null;
					try {
						dao = new FeatureDAO();
						out = response.getWriter();
						int id = Integer.parseInt(request.getParameter("id"));
						dao.removeFeature(id);
						out.print(JSON_FORMATTER.format(anObjectBuilder().withField("success", aTrueBuilder()).build()));
					}
					catch(Exception e)
					{
						e.printStackTrace();
						out.print(JSON_FORMATTER.format(anObjectBuilder().withField("success", aFalseBuilder()).build()));
					}
					finally {
						if(out != null)
							out.close();
						if(dao != null)
							dao.close();
					}
				}
				break;
				default:
					response.sendRedirect("/InfinityDTH/Admin.jsp");
					break;
			}
		}
	}
}

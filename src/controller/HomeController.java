package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Channel;
import model.ChannelDAO;

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
					request.setAttribute("success", "true");
				}
				catch(Exception e)
				{
					// log other exception
					request.setAttribute("error", e.getMessage());
				}
				finally {
					dao.close();
					
					getServletContext().getRequestDispatcher("/CreateChannel.jsp").forward(request, response);
				}
				
				break;
				
			case "UpdateChannel":
				Channel update = new Channel();
				update.setChargeType(request.getParameter("chargeType"));
				update.setTransmissionType(request.getParameter("transmissionType"));
				update.setCharge(Integer.parseInt(request.getParameter("charge")));
				update.setChannel_id(Integer.parseInt("channel_id"));
				try
				{
					ChannelDAO.updateChannel(update);
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
					response.sendRedirect("dashboard.jsp");
				}
				
				
			default:
				response.sendRedirect("dashboard.jsp");
				break;
		}
		
		
	}

}

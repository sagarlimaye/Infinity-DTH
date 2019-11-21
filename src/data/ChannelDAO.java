package data;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Channel;
import util.SQLConnection;

public class ChannelDAO implements Closeable {
	
	Connection conn = null;
	
	public ChannelDAO() throws SQLException
	{
		conn = SQLConnection.getInstance().getDBConnection();
	}
	
	public void addChannel(Channel channel) throws SQLException {
	
		String query = "INSERT INTO channels(channel_name, channel_band, video_freq, audio_freq, charge_type, transmission_type, charge) "
				+ "		VALUES (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement stmt = conn.prepareStatement(query);
		
		stmt.setString(1, channel.getName());
		stmt.setString(2, channel.getBand());
		stmt.setFloat(3,  channel.getVideoFreq());
		stmt.setFloat(4,  channel.getAudioFreq());
		stmt.setString(5,  channel.getChargeType());
		stmt.setString(6,  channel.getTransmissionType());
		stmt.setFloat(7, channel.getCharge());
		stmt.executeUpdate();
		stmt.close();
		
	}
	
	public void updateChannel(Channel channel) throws SQLException{
		
		String updateQuery = "UPDATE channels SET charge_type=?, transmission_type=?, charge =? WHERE channel_id=?";

		PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
		
		updateStmt.setString(1,channel.getChargeType());
		updateStmt.setString(2,channel.getTransmissionType());
		updateStmt.setInt(3,channel.getCharge());
		updateStmt.setInt(4,channel.getChannel_id());
		updateStmt.executeUpdate();
		updateStmt.close();
	}
	
public List<Channel> ChannelInformation() throws SQLException{
		
		String selectQuery = "select * from channels";
		List<Channel> channelInf = new ArrayList<Channel>();

		//PreparedStatement selectStmt = conn.prepareStatement(selectQuery);
		
		//ResultSet rs = selectStmt.executeQuery(selectQuery);
		Statement stmt = conn.createStatement();
	        ResultSet rs = stmt.executeQuery(selectQuery);
		
		System.out.println("connection successful");
		
		
		while(rs.next()) {
			Channel channelInfo = new Channel();
			
			channelInfo.setChannel_id(rs.getInt(1));
			channelInfo.setName(rs.getString(2));	
			channelInfo.setBand(rs.getString(3));
			channelInfo.setVideoFreq(rs.getFloat(4));
			channelInfo.setAudioFreq(rs.getFloat(5));
			channelInfo.setChargeType(rs.getString(6));
			channelInfo.setTransmissionType(rs.getString(7));
			channelInfo.setCharge(rs.getInt(8));
			channelInf.add(channelInfo);			
		}
		return channelInf;
	}
	public Channel getChannelById(int id) throws SQLException
	{
		String query = "SELECT * FROM channel WHERE id = ?";
		PreparedStatement stmt = conn.prepareStatement(query);
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		Channel channel = new Channel();
		channel.setChannel_id(rs.getInt("channel_id"));
		channel.setAudioFreq(rs.getFloat("audio_freq"));
		channel.setVideoFreq(rs.getFloat("video_freq"));
		channel.setName(rs.getString("channel_name"));
		channel.setBand(rs.getString("channel_band"));
		channel.setCharge(rs.getInt("charge"));
		channel.setChargeType(rs.getString("charge_type"));
		channel.setTransmissionType(rs.getString("transmission_type"));
		return channel;
	}
	@Override
	public void close() throws IOException {
		try {
			if(conn != null)
				conn.close();
		} 
		catch (SQLException e) {
		}
		
	}
}


package model;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import util.SQLConnection;

import data.Channel;

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


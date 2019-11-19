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
	PreparedStatement stmt = null;
	String query = "INSERT INTO channels(channel_name, channel_band, video_freq, audio_freq, charge_type, transmission_type, charge) "
			+ "		VALUES (?, ?, ?, ?, ?, ?, ?)";
	
	public ChannelDAO() throws SQLException {
		conn = SQLConnection.getInstance().getDBConnection();
		stmt = conn.prepareStatement(query);
	}
	public void addChannel(Channel channel) throws SQLException {
		stmt.setString(1, channel.getName());
		stmt.setString(2, channel.getBand());
		stmt.setFloat(3,  channel.getVideoFreq());
		stmt.setFloat(4,  channel.getAudioFreq());
		stmt.setString(5,  channel.getChargeType());
		stmt.setString(6,  channel.getTransmissionType());
		stmt.setFloat(7, channel.getCharge());
		stmt.executeUpdate();
		
	}
	@Override
	public void close() throws IOException {
		try {
			if(stmt != null)
				stmt.close();
			if(conn != null)
				conn.close();
		} catch (SQLException e) {
		}
		
	}
}


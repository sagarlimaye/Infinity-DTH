package model;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import util.SQLConnection;

import data.Channel;

public class AddChannelDAO implements Closeable {
	Connection conn = null;
	PreparedStatement stmt = null;
	String query = "INSERT INTO channels(channel_name, channel_band, ) VALUES ('some')";
	
	public AddChannelDAO() throws SQLException {
		conn = SQLConnection.getInstance().getDBConnection();
		stmt = conn.prepareStatement(query);
	}
	public void addChannel(Channel channel) throws SQLException {
		stmt.setString(1, channel.getName());
		
	}
	@Override
	public void close() throws IOException {
		// TODO Auto-generated method stub
		
	}
}


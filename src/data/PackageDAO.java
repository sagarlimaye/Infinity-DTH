package data;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Channel;
import model.Package;
import util.SQLConnection;

public class PackageDAO implements Closeable {

	private Connection conn = null;
	public PackageDAO() throws SQLException {
		conn = SQLConnection.getInstance().getDBConnection();
	}
	public void addPackage(Package pkg) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int id = 0;
		try
		{
			String query = "INSERT INTO package(package_name, charging_type, transmission_type, cost, available_from, available_to, added_default) "
					+ "		VALUES (?, ?, ?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			
			stmt.setString(1, pkg.getName());
			stmt.setString(2, pkg.getChargingType());
			stmt.setString(3,  pkg.getTransmissionType());
			stmt.setFloat(4,  pkg.getCost());
			stmt.setDate(5,  new java.sql.Date(pkg.getAvailableFrom().getTime()));
			stmt.setDate(6,  new java.sql.Date(pkg.getAvailableTo().getTime()));
			stmt.setBoolean(7, pkg.isAddedByDefault());
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();
			rs.next();
			id = rs.getInt(1);
		}
		finally {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
		}
		try {
			
			String query = "UPDATE channels SET package_id = ? WHERE channel_id = ?";
			stmt = conn.prepareStatement(query);
			Channel[] channels = pkg.getChannels();
			for(Channel channel : channels)
			{
				stmt.setInt(1,  id);
				stmt.setInt(2,  channel.getChannel_id());
				stmt.executeUpdate();
			}
		}
		finally {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
		}
			
		
	}
	@Override
	public void close() throws IOException {
		try {
			if(conn != null)
				conn.close();
		}
		catch(SQLException e) {}
	}
}

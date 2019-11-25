package data;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
		try
		{
			String query = "INSERT INTO package(package_name, charging_type, transmission_type, cost, available_from, available_to, added_default) "
					+ "		VALUES (?, ?, ?, ?, ?, ?, ?)";
			stmt = conn.prepareStatement(query);
			
			stmt.setString(1, pkg.getName());
			stmt.setString(2, pkg.getChargingType());
			stmt.setString(3,  pkg.getTransmissionType());
			stmt.setFloat(4,  pkg.getCost());
			stmt.setDate(5,  new java.sql.Date(pkg.getAvailableFrom().getTime()));
			stmt.setDate(6,  new java.sql.Date(pkg.getAvailableTo().getTime()));
			stmt.setBoolean(7, pkg.isAddedByDefault());
			stmt.executeUpdate();
		}
		finally {
			if(stmt != null)
				stmt.close();
		}
		try {
			rs = stmt.getGeneratedKeys();
			rs.next();
			int id = rs.getInt("package_id");
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
		public List<Package> PackInformation() throws SQLException{
			List<Package> pack = new ArrayList<Package>();
			String selectQuery = "Select * from package";
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				stmt = conn.createStatement();
			    rs = stmt.executeQuery(selectQuery);
				
				
				
				
				while(rs.next()) {
					Package packageInfo = new Package();
					packageInfo.setPackageID(rs.getInt(1));
					packageInfo.setName(rs.getString(2));
					packageInfo.setChargingType(rs.getString(4));
					packageInfo.setTransmissionType(rs.getString(5));
					packageInfo.setCost(Float.parseFloat(rs.getString(6)));
					packageInfo.setAvailableFrom(rs.getDate(7));
					packageInfo.setAvailableTo(rs.getDate(8));
					packageInfo.setAddedByDefault((rs.getBoolean(9)));
					pack.add(packageInfo);			
				}
			}
			finally {
				if(rs != null)
					rs.close();
				if(stmt != null)
					stmt.close();
			}
			
			
			return pack;
			
		}
		public void DeletePackage(int id) throws SQLException{
			String deleteQuery = "Delete from package where package_id = ?";
			PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(deleteQuery);
				
				stmt.setInt(1,id);
				stmt.execute();
			
		}
			finally {
				if(stmt != null)
					stmt.close();
			}
		}
		public void UpdatePackage(Package pack) throws SQLException{
			
			String updateQuery = "UPDATE package SET package_name = ?, "
					+ "charging_type = ?, transmission_type=?, cost =? "
					+ "available_from = ?, available_to = ? WHERE package_id=?";

			PreparedStatement updateStmt = null;
			
			try {
				updateStmt = conn.prepareStatement(updateQuery);
				updateStmt.setString(1,pack.getName());
				updateStmt.setString(2,pack.getChargingType());
				updateStmt.setString(3,pack.getTransmissionType());
				updateStmt.setFloat(4,pack.getCost());
				updateStmt.setDate(5,new java.sql.Date(pack.getAvailableFrom().getTime()));
				updateStmt.setDate(6,new java.sql.Date(pack.getAvailableTo().getTime()));
				//updateStmt.setBoolean(5,pack.isAddedByDefault());
				updateStmt.setInt(7,pack.getPackageID());
				updateStmt.executeUpdate();
			}
			finally {
				if(updateStmt != null)
					updateStmt.close();
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

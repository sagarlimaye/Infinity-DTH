package data;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Feature;
import util.SQLConnection;

public class FeatureDAO implements Closeable {
	private Connection conn;
	
	public FeatureDAO() {
		conn = SQLConnection.getInstance().getDBConnection();
	}
	public Feature[] getAllFeatures() throws SQLException {
		String query = "SELECT * FROM feature";
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Feature> list = new ArrayList<>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				Feature feature = new Feature();
				feature.setId(rs.getInt("id"));
				feature.setName(rs.getString("feature_name"));
				list.add(feature);
			}
		}
		finally {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
		}
		return list.toArray(new Feature[list.size()]);
	}
	public void addFeature(Feature feature) throws SQLException {
		String query = "INSERT INTO feature (feature_name) VALUES (?)";
		PreparedStatement stmt = null;
		
		try {
			stmt = conn.prepareStatement(query);
			stmt.setString(1, feature.getName());
			stmt.executeUpdate();
		}
		finally {
			if(stmt != null)
				stmt.close();
		}
	}
	public void removeFeature(int id) throws SQLException {
		String query = "DELETE FROM feature WHERE id = ?";
		PreparedStatement stmt = null;
		
		try {
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, id);
			stmt.executeUpdate();
		}
		finally {
			if(stmt != null)
				stmt.close();
		}
		// MySQL will take care of deleting references to set top boxes so we don't need to remove it here
	}
	public Feature getFeatureById(int id) throws SQLException {
		String query = "SELECT * FROM feature WHERE id = ?";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Feature feature = null;
		try {
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			feature = new Feature();
			rs.next();
			feature.setId(rs.getInt("id"));
			feature.setName(rs.getString("feature_name"));
		}
		finally {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
		}
		return feature;
	}
	@Override
	public void close() throws IOException {
		// TODO Auto-generated method stub
		try {
			if(conn != null)
				conn.close();
		}
		catch(SQLException e) {}
			
	}
}

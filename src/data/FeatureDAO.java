package data;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Feature;
import util.SQLConnection;

public class FeatureDAO implements Closeable {
	private Connection conn;
	
	public FeatureDAO() {
		conn = SQLConnection.getInstance().getDBConnection();
	}
	public void addFeature(Feature feature) throws SQLException {
		String query = "INSERT INTO feature (feature_name) VALUES (?)";
		PreparedStatement stmt = null;
		
		try {
			stmt = conn.prepareStatement(query);
			stmt.setString(1, feature.getName());
			stmt.execute();
		}
		finally {
			if(stmt != null)
				stmt.close();
		}
		
		
	}
	@Override
	public void close() throws IOException {
		// TODO Auto-generated method stub
		try {
			if(conn != null)
				conn.close();
		}
		catch(Exception e) {}
			
	}
}

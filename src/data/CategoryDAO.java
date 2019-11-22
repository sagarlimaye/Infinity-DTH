package data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Channel;
import model.Package;
import model.Category;
import util.SQLConnection;

public class CategoryDAO {
	private Connection conn = null;
	public CategoryDAO() throws SQLException {
		conn = SQLConnection.getInstance().getDBConnection();	
	}
	
	public void addCategory(Category ctg) throws SQLException {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try
		{
			String query = "INSERT INTO category(category_name, min_channels, max_channels)"
					+ " VALUES (?, ?, ?)";
			
			stmt = conn.prepareStatement(query);
			
			stmt.setString(1, ctg.getCategoryName());
			stmt.setInt(2, ctg.getMinChannels());
			stmt.setInt(3, ctg.getMaxChannels());
			
			stmt.executeUpdate();
		}
		
		finally {
			if(stmt != null)
				stmt.close();
		}
	}
}


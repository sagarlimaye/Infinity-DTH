package data;

import java.io.IOException;
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
		String query = "INSERT INTO category(category_name, min_channels, max_channels)"
				+ "		VALUES (?, ?, ?)";
		
		PreparedStatement stmt = null;
		
		try {
			stmt = conn.prepareStatement(query);
			
			stmt.setString(1, ctg.getCategoryName());
			stmt.setInt(2, ctg.getMinChannels());
			stmt.setInt(3,ctg.getMaxChannels());
			
			stmt.executeUpdate();
		}
		finally {
			if(stmt != null)
				stmt.close();
		}
	}
	
	public List<Category> CategoryNames() throws SQLException {
		
		String selectQuery = "select category_name from category";
		List<Category> categoryNames = new ArrayList<Category>();

		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
		    rs = stmt.executeQuery(selectQuery);
			
			while(rs.next()) {
				//Category category = new Category();
				
				String str = rs.getString(1);
				
				Category category = new Category();
				category.setCategoryName(str);
				categoryNames.add(category);		
			}
			
		}
		
		finally {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
		}
		
		return categoryNames;
	}
	
	public void close() throws IOException {
		try {
			if(conn != null)
				conn.close();
		} 
		catch (SQLException e) {
		}
		
	}
}


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
	
public List<Category> CategoryInformation() throws SQLException {
		
		String selectQuery = "select * from category";
		List<Category> categoryInf = new ArrayList<Category>();

		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
		    rs = stmt.executeQuery(selectQuery);
			
			while(rs.next()) {
				Category categoryInfo = new Category();
				categoryInfo.setCategory_id(rs.getInt(1));
				categoryInfo.setCategoryName(rs.getString(2));
				categoryInfo.setMinChannels(rs.getInt(3));
				categoryInfo.setMaxChannels(rs.getInt(4));
				categoryInf.add(categoryInfo);
			
			}
		}
		finally {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
		}
		
		return categoryInf;
	}

	public Category getCategoryById(int id) throws SQLException {
		String query = "SELECT * FROM category WHERE category_id = ?;";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Category category = null;
		
		try
		{
			stmt = conn.prepareStatement(query);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			rs.next();
			category = new Category();
			category.setCategory_id(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			category.setMinChannels(rs.getInt("min_channels"));
			category.setMaxChannels(rs.getInt("max_channels"));
		}
		finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
		}
		
		return category;
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


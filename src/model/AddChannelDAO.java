package model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import util.SQLConnection;


public class AddChannelDAO {
	static SQLConnection DBMgr = SQLConnection.getInstance();
	
	
	public static void addChannel(){
		Statement stmt = null;
		String query = "Insert into channels(channel_name) values ('some')";
		try{
				//conn.setAutoCommit(false);  
				Connection conn = DBMgr.getDBConnection();
				stmt = conn.createStatement();
				stmt.executeUpdate(query);
				conn.commit();
	}
	catch(SQLException e){
		
	}
	}
	}


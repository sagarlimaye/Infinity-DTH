package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLConnection {

	private static String DB_DRIVER;
	private static String DB_CONNECTION;
	private static String DB_USER;
	private static String DB_PASSWORD; 
	private static SQLConnection single_instance = null;
	
	private SQLConnection() {		
		DB_DRIVER = "com.mysql.jdbc.Driver";
		DB_CONNECTION  = DBConfig.DB_URL;
		DB_USER  = DBConfig.DB_USERNAME;
		DB_PASSWORD = DBConfig.DB_PASSWORD;
	}
		
	public static synchronized SQLConnection getInstance() {
        if (single_instance == null)
        	single_instance = new SQLConnection();
        return single_instance;
	}

	public Connection getDBConnection() {	
		Connection dbConnection = null;	 

		try {	 
			Class.forName(DB_DRIVER);	
			dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,DB_PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {	 
			e.printStackTrace();
		}
		
		return dbConnection;
	}
	
	// can be removed if everyone's db works without this
	public void useDB(Connection dbConnection) throws SQLException {
		Statement statement = null;
		
		try {
			statement = dbConnection.createStatement();
			statement.execute("USE xfinity");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (statement != null) statement.close();
		}
	}
}



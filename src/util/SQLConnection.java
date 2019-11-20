package util;


	import java.sql.Connection;
	import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

	public class SQLConnection {

		private static String DB_DRIVER;
		private static String DB_CONNECTION;
		private static String DB_USER;
		private static String DB_PASSWORD; 
		private static SQLConnection single_instance = null;
		private SQLConnection() {
			
			DB_DRIVER = "com.mysql.cj.jdbc.Driver";
			DB_CONNECTION  = DBConfig.DB_URL;
			DB_USER  = DBConfig.DB_USERNAME;
			DB_PASSWORD = DBConfig.DB_PASSWORD;
		}
		
		public static synchronized SQLConnection getInstance() {
	        if (single_instance == null)
	        	single_instance = new SQLConnection();
	        return single_instance;
		}

		public static Connection getDBConnection() throws SQLException {	
			Connection dbConnection = null;	 

			try {	 
				Class.forName(DB_DRIVER);	 
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			PreparedStatement stmt = null;
			try {	 
				dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,DB_PASSWORD);
				stmt = dbConnection.prepareStatement("USE xfinity;");
				stmt.executeUpdate();
			} catch (SQLException e) {	    
			}	 
			finally {
				if(stmt != null)
					stmt.close();
			}
			return dbConnection;	 
		}

	}



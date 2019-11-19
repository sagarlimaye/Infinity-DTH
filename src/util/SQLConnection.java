package util;


	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.SQLException;

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

		public static Connection getDBConnection() {	
			Connection dbConnection = null;	 

			try {	 
				Class.forName(DB_DRIVER);	 
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			try {	 
				dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER,DB_PASSWORD);
				dbConnection.setAutoCommit(false);
			} catch (SQLException e) {	    
			}	 
			return dbConnection;	 
		}

	}



package data;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.SetTopBox;
import util.SQLConnection;

public class SetTopBoxDAO implements Closeable {
	
	Connection conn = null;
	
	public SetTopBoxDAO() throws SQLException
	{
		conn = SQLConnection.getInstance().getDBConnection();
	
	}
	
	public SetTopBox[] SetTopBoxInformation() throws SQLException {
		
		String selectQuery = "select * from set_top_boxes";
		List<SetTopBox> setTopBoxInf = new ArrayList<SetTopBox>();

		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
		    rs = stmt.executeQuery(selectQuery);
			
			while(rs.next()) {
				SetTopBox settopbox = new SetTopBox();
				settopbox.setSerialNumber(rs.getInt(1));
				settopbox.setType(rs.getString(2));
				settopbox.setDimensions(rs.getString(3));
				settopbox.setPrice(rs.getFloat(4));
				settopbox.setInstallation_charges(rs.getFloat(5));
				settopbox.setUpgradation_charges(rs.getFloat(6));
				settopbox.setMac_id(rs.getString(7));
				settopbox.setControl_asset_id(rs.getInt(8));
				settopbox.setBilling_type(rs.getString(9));
				settopbox.setDiscount(rs.getFloat(10));
				settopbox.setDish_asset_id(rs.getInt(11));
				settopbox.setRefundable_deposit(rs.getFloat(12));
				settopbox.setStatus(rs.getInt(13));
				settopbox.setInventory_details(rs.getBinaryStream(14));
				setTopBoxInf.add(settopbox);
			}
		}
		finally {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
		}
		
		return setTopBoxInf.toArray(new SetTopBox[setTopBoxInf.size()]);
	}
	
	@Override
	public void close() throws IOException {
		try {
			if(conn != null)
				conn.close();
		} 
		catch (SQLException e) {
		}
		
	}
}

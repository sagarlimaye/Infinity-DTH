package data;

import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Feature;
import model.SetTopBox;
import util.SQLConnection;

public class SetTopBoxDAO implements Closeable {
	
	Connection conn = null;
	
	public SetTopBoxDAO() throws SQLException
	{
		conn = SQLConnection.getInstance().getDBConnection();
	
	}
	public void addSetTopBox(SetTopBox stb) throws SQLException {
		String insertQuery = "INSERT INTO set_top_boxes (type, dimensions, price, installation_charges, upgradation_charges, mac_id, control_asset_id, billing_type, discount, dish_asset_id, refundable_deposit, status, inventory_details "
				+ "		VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int id = 0;
		try {
			stmt = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, stb.getType());
			stmt.setString(2, stb.getDimensions());
			stmt.setFloat(3, stb.getPrice());
			stmt.setFloat(4, stb.getInstallation_charges());
			stmt.setFloat(5, stb.getUpgradation_charges());
			stmt.setString(6, stb.getMac_id());
			stmt.setInt(7, stb.getControl_asset_id());
			stmt.setString(8, stb.getBilling_type());
			stmt.setFloat(9, stb.getDiscount());
			stmt.setInt(10, stb.getDish_asset_id());
			stmt.setFloat(11, stb.getRefundable_deposit());
			stmt.setInt(12, stb.getStatus());
			stmt.setBlob(13, stb.getInventory_details());
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();
			rs.next();
			id = rs.getInt(1);
		}
		finally {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
		}
		String updateQuery = "INSERT INTO feature_set_top_box (feature_id, stb_serial_number) VALUES (?, ?)";
		Feature[] features = null;
		try {
			stmt = conn.prepareStatement(updateQuery);
			features = stb.getFeatures();
			for(Feature feature : features) {
				stmt.setInt(1, feature.getId());
				stmt.setInt(2, stb.getSerialNumber());
				stmt.executeUpdate();
			}
		}
		finally {
			if(stmt != null)
				stmt.close();
		}
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
	
	public void updateSetTopBox(SetTopBox settopbox) throws SQLException {
		String updateQuery = "UPDATE set_top_boxes SET serial_number = ?, type = ?, dimensions = ?, price= ?, installation_charges = ?, upgradation_charges = ?, mac_id = ?, control_asset_id = ?, billing_type = ?, discount = ?, dish_asset_id = ?, refundable_deposit = ?, status = ?, inventory_details = ?";
		PreparedStatement updateStmt = null;
		
		try {
			updateStmt = conn.prepareStatement(updateQuery);
			updateStmt.setInt(1, settopbox.getSerialNumber());
			updateStmt.setString(2, settopbox.getType());
			updateStmt.setString(3, settopbox.getDimensions());
			updateStmt.setFloat(4, settopbox.getPrice());
			updateStmt.setFloat(5, settopbox.getInstallation_charges());
			updateStmt.setFloat(6, settopbox.getUpgradation_charges());
			updateStmt.setString(7, settopbox.getMac_id());
			updateStmt.setInt(8, settopbox.getControl_asset_id());
			updateStmt.setString(9, settopbox.getBilling_type());
			updateStmt.setFloat(10, settopbox.getDiscount());
			updateStmt.setInt(11, settopbox.getDish_asset_id());
			updateStmt.setFloat(12, settopbox.getRefundable_deposit());
			updateStmt.setInt(13, settopbox.getStatus());
			updateStmt.setBinaryStream(14, settopbox.getInventory_details());
			updateStmt.executeUpdate();			
		} finally {
			if(updateStmt != null)
				updateStmt.close();			
		}
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

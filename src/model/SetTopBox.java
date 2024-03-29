package model;

import java.io.InputStream;

public class SetTopBox {
	private String billing_type, dimensions, mac_id, type;
	private int control_asset_id, dish_asset_id, serialNumber, status;
	private float discount, installation_charges, price, refundable_deposit, upgradation_charges;
	private InputStream inventory_details;
	private Feature[] features;
	
	public String getBilling_type() {
		return billing_type;
	}
	public void setBilling_type(String billing_type) {
		this.billing_type = billing_type;
	}
	public String getDimensions() {
		return dimensions;
	}
	public void setDimensions(String dimensions) {
		this.dimensions = dimensions;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getInstallation_charges() {
		return installation_charges;
	}
	public void setInstallation_charges(float installation_charges) {
		this.installation_charges = installation_charges;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getRefundable_deposit() {
		return refundable_deposit;
	}
	public void setRefundable_deposit(float refundable_deposit) {
		this.refundable_deposit = refundable_deposit;
	}
	public float getUpgradation_charges() {
		return upgradation_charges;
	}
	public void setUpgradation_charges(float upgradation_charges) {
		this.upgradation_charges = upgradation_charges;
	}
	public InputStream getInventory_details() {
		return inventory_details;
	}
	public void setInventory_details(InputStream inventory_details) {
		this.inventory_details = inventory_details;
	}
	public int getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(int serialNumber) {
		this.serialNumber = serialNumber;
	}
	public Feature[] getFeatures() {
		return features;
	}
	public void setFeatures(Feature[] features) {
		this.features = features;
	}
}

package model;

import java.util.Date;

public class Package {

	private String name, chargingType, transmissionType;
	private Date availableFrom, availableTo;
	private float cost;
	private boolean addedByDefault;
	private Channel[] channels;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getChargingType() {
		return chargingType;
	}
	public void setChargingType(String chargingType) {
		this.chargingType = chargingType;
	}
	public String getTransmissionType() {
		return transmissionType;
	}
	public void setTransmissionType(String transmissionType) {
		this.transmissionType = transmissionType;
	}
	public Date getAvailableFrom() {
		return availableFrom;
	}
	public void setAvailableFrom(Date availableFrom) {
		this.availableFrom = availableFrom;
	}
	public Date getAvailableTo() {
		return availableTo;
	}
	public void setAvailableTo(Date availableTo) {
		this.availableTo = availableTo;
	}
	public boolean isAddedByDefault() {
		return addedByDefault;
	}
	public void setAddedByDefault(boolean addedByDefault) {
		this.addedByDefault = addedByDefault;
	}
	public Channel[] getChannels() {
		return channels;
	}
	public void setChannels(Channel[] channels) {
		this.channels = channels;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}

}

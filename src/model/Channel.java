package model;

public class Channel {
	private String name, band, chargeType, transmissionType;
	private float videoFreq, audioFreq;
	private int channel_id, charge;
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getBand() {
		return band;
	}
	public void setBand(String band) {
		this.band = band;
	}
	public String getChargeType() {
		return chargeType;
	}
	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
	public String getTransmissionType() {
		return transmissionType;
	}
	public void setTransmissionType(String transmissionType) {
		this.transmissionType = transmissionType;
	}
	public float getVideoFreq() {
		return videoFreq;
	}
	public void setVideoFreq(float videoFreq) {
		this.videoFreq = videoFreq;
	}
	public float getAudioFreq() {
		return audioFreq;
	}
	public void setAudioFreq(float audioFreq) {
		this.audioFreq = audioFreq;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}

	public int getChannel_id() {
		return channel_id;
	}

	public void setChannel_id(int channel_id) {
		this.channel_id = channel_id;
	}
}




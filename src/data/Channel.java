package data;

public class Channel {
	private String name, band, chargeType, transmissionType;
	private float videoFreq, audioFreq, charge;
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
	public float getCharge() {
		return charge;
	}
	public void setCharge(float charge) {
		this.charge = charge;
	}

	
}

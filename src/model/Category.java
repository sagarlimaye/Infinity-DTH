package model;

import java.io.Serializable;

public class Category implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String category_name;
	private int min_channels, max_channels;
	
	public String getCategoryName() {
		return category_name;
	}
	
	public void setCategoryName(String name) {
		this.category_name = name;
	}
	
	public int getMinChannels() {
		return min_channels;
	}
	
	public void setMinChannels(int minChannels) {
		this.min_channels = minChannels;
	}
	
	public int getMaxChannels() {
		return max_channels;
	}
	
	public void setMaxChannels(int maxChannels) {
		this.max_channels = maxChannels;
	}
	
}	
package model;

import java.io.Serializable;

public class Category implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String categoryName;
	private int category_id;
	private int minChannels, maxChannels;
	
	public String getCategoryName() {
		return categoryName;
	}
	
	public void setCategoryName(String name) {
		this.categoryName = name;
	}
	
	public int getMinChannels() {
		return minChannels;
	}
	
	public void setMinChannels(int minChannels) {
		this.minChannels = minChannels;
	}
	
	public int getMaxChannels() {
		return maxChannels;
	}
	
	public void setMaxChannels(int maxChannels) {
		this.maxChannels = maxChannels;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int i) {
		this.category_id = i;
	}
	
}	
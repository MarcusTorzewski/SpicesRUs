package com.example.model;

public enum PacketSize {
	
    SMALL(1f,1f), 
    MEDIUM(2f,0.9f), 
    LARGE(5,0.8f);

	
	private float sizeRatio;
	
	private float priceRatio;
	
	PacketSize(float sizeRatio, float priceRatio) {
		
		this.sizeRatio = sizeRatio;
		this.priceRatio = priceRatio;
		
	}

	public float getSizeRatio() {
		return sizeRatio;
	}

	public void setSizeRatio(float sizeRatio) {
		this.sizeRatio = sizeRatio;
	}

	public float getPriceRatio() {
		return priceRatio;
	}

	public void setPriceRatio(float priceRatio) {
		this.priceRatio = priceRatio;
	}
	
	
	
	
	
}
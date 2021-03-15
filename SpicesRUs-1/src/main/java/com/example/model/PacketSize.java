package com.example.model;

public enum PacketSize {
	
    SMALL(1f,1f), 
    MEDIUM(2.5f,0.9f), 
    LARGE(5.0f,0.8f);

	
	private float sizeRatio;
	
	private float priceRatio;
	
	PacketSize(float sizeRatio, float priceRatio) {
		
		this.sizeRatio = sizeRatio;
		this.priceRatio = priceRatio;
		
	}
	
	
}
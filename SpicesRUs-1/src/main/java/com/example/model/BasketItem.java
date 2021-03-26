package com.example.model;






public class BasketItem {
	
	
	private Spice spice;
	
	private PacketSize size;
	
	
	private int quantity;
	
	private float price;
	

	
	

	public BasketItem(Spice spice,PacketSize size ,  int quantity) {
		super();
		
		this.spice = spice;
		this.size = size;
		this.quantity = quantity;
		
		this.price = spice.getBasePricePerKG() * quantity *size.getSizeRatio() * size.getPriceRatio();

	}


	public Spice getSpice() {
		return spice;
	}

	public void setSpice(Spice spice) {
		this.spice = spice;
	}




	public PacketSize getSize() {
		return size;
	}




	public void setSize(PacketSize size) {
		this.size = size;
	}




	public int getQuantity() {
		return quantity;
	}




	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}




	public float getPrice() {
		return price;
	}




	public void setPrice(float price) {
		this.price = price;
	}
	
	
	



	
	
	
	
	
	
	
	
	
	
	

}

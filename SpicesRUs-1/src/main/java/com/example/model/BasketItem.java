package com.example.model;



public class BasketItem {
	
	
	private Spice spice;
	
	private PacketSize size;
	
	
	private int quantity;
	
	private double price;
	

	
	

	public BasketItem(Spice spice,PacketSize size ,  int quantity) {
		super();
		
		this.spice = spice;
		this.size = size;
		this.quantity = quantity;
		
		double tempPrice = spice.getBaseWeight() * spice.getBasePricePerKG() * quantity *size.getSizeRatio() * size.getPriceRatio();
		
		System.out.println("item priceee 1 = " +tempPrice);
		
		tempPrice= Math.round(tempPrice*100);
		
		tempPrice = tempPrice/100;
		
		System.out.println("item priceee 2 = " +tempPrice);
		
		this.price = tempPrice;

	}
	
	public void UpdatePrice() {
		
		double tempPrice = spice.getBaseWeight() * spice.getBasePricePerKG() * quantity *size.getSizeRatio() * size.getPriceRatio();
		
		tempPrice= Math.round(tempPrice*100);
		tempPrice = tempPrice/100;
		
		this.price = tempPrice;
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

	public double getPrice() {
			
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}
	
	
	



	
	
	
	
	
	
	
	
	
	
	

}

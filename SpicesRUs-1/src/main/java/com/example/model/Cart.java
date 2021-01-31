package com.example.model;

import java.util.List;

import org.springframework.data.util.Pair;





public class Cart {
	
	
	//Spice, Quantity 
	private List<Pair<Spice,Integer>> itemQuantityList;
	
	private float cartTotalValue;
	
	
	
	public List<Pair<Spice, Integer>> getItemQuantityList() {
		return itemQuantityList;
	}

	public void setItemQuantityList(List<Pair<Spice, Integer>> itemQuantityList) {
		this.itemQuantityList = itemQuantityList;
	}

	public float getCartTotalValue() {
		return cartTotalValue;
	}

	public void setCartTotalValue(float cartTotalValue) {
		this.cartTotalValue = cartTotalValue;
	}
	
	public float WorkOutTotal() {
		
	}


	
	
	
	
	
	
	

}

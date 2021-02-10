package com.example.model;

import java.util.List;

import org.springframework.data.util.Pair;

public class Basket {

	// Spice, Quantity
	private List<Pair<Spice, Integer>> itemQuantityList;

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

//	public float WorkOutTotal() {
//
//		float tempCartTotal = 0;
//
//		for (Pair<Spice, Integer> pair : itemQuantityList) {
//
//			tempCartTotal += (pair.getFirst().getPrice() * pair.getSecond());
//
//		}
//
//		return tempCartTotal;
//
//	}
//
//	public float WorkOutTotalWithDiscountPerecent(float discountPercent) {
//
//		float tempTotalPercentDiscounted = cartTotalValue;
//
//		tempTotalPercentDiscounted = tempTotalPercentDiscounted * ((100 - discountPercent) / 100);
//
//		return tempTotalPercentDiscounted;
//
//	}
//
//	public float WorkOutTotalWithValueDiscount(float valueDiscount) {
//
//		float tempTotalValueDiscounted = cartTotalValue;
//
//		tempTotalValueDiscounted = tempTotalValueDiscounted - valueDiscount;
//
//		return tempTotalValueDiscounted;
//
//	}

}

package com.example.model;

import java.util.ArrayList;

import java.util.List;


import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;


@Document(collection="basket")
public class Basket {
	
	
	@Id
	private String basketId;
	
	private int basketItemCount;
	
	private float basketTotalValue;
	
	// Product, Quantity
	
	private List<BasketItem> items = new ArrayList<BasketItem>();
	


	public String getBasketId() {
		return basketId;
	}

	public void setBasketId(String basketId) {
		this.basketId = basketId;
	}

	public int getBasketItemCount() {
		return basketItemCount;
	}

	public void setBasketItemCount(int basketItemCount) {
		this.basketItemCount = basketItemCount;
	}

	public float getBasketTotalValue() {
		return basketTotalValue;
	}

	public void setBasketTotalValue(float basketTotalValue) {
		this.basketTotalValue = basketTotalValue;
	}
	
	
	


	public List<BasketItem> getItems() {
		return items;
	}

	public void setItems(List<BasketItem> items) {
		this.items = items;
	}


	public void WorkOutTotalWithDiscountPerecent(float discountPercent) {

		float tempTotalPercentDiscounted = basketTotalValue;

		tempTotalPercentDiscounted = tempTotalPercentDiscounted * ((100 - discountPercent) / 100);

		basketTotalValue = tempTotalPercentDiscounted;

	}

	public void WorkOutTotalWithValueDiscount(float valueDiscount) {

		float tempTotalValueDiscounted = basketTotalValue;

		tempTotalValueDiscounted = tempTotalValueDiscounted - valueDiscount;

		basketTotalValue = tempTotalValueDiscounted;
	}
	
	
	
	
	

}

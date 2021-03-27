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
	
	private double basketTotalValue;
	
	// Product, Quantity
	
	private List<BasketItem> items = new ArrayList<BasketItem>();
	
	public Basket() {
		items = new ArrayList<BasketItem>();
		this.basketTotalValue =0;
		this.basketItemCount=0;
		
		
	}
	
	public void addItemToBasket(BasketItem pendingAddItem) {
		
		System.out.println("ITEM TO BE ADDED = " +pendingAddItem.getSpice().getName());
		
		boolean addedRepeat = addRepeatingItem(pendingAddItem);
		
		if(addedRepeat == false) {
			System.out.println("ADD METHOD PERSONAL INSIDE if");
			items.add(pendingAddItem);
			
			WorkOutBasketTotal();
			
		}
		
	}
	
	public boolean addRepeatingItem(BasketItem itemToBeAdded) {
		
		for(BasketItem item : items) {
		
			if(item.getSize() == itemToBeAdded.getSize() && item.getSpice().getId().contains(itemToBeAdded.getSpice().getId())) {
				
				int tempQuant = item.getQuantity();
				
				tempQuant+= itemToBeAdded.getQuantity();

				item.setQuantity(tempQuant);
				
				item.UpdatePrice();

				WorkOutBasketTotal();
				
				return true;
			}
		}
		
		return false;
		
		
		
	}
	
	


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

	public double getBasketTotalValue() {
		return basketTotalValue;
	}

	public void setBasketTotalValue(double basketTotalValue) {
		this.basketTotalValue = basketTotalValue;
	}
	
	
	


	public List<BasketItem> getItems() {
		return items;
	}

	public void setItems(List<BasketItem> items) {
		this.items = items;
	}
	
	public void WorkOutBasketTotal() {
		
		double tempTotal =0.00;

		for(BasketItem item : items) {
			
			tempTotal +=item.getPrice();
		}
		
		tempTotal = Math.round(tempTotal*100);
		
		tempTotal = tempTotal/100;
	
		setBasketTotalValue(tempTotal);
		
	}
	
	public void RemoveItemFromBasket(int pos) {
		
		items.remove(pos);
		
		WorkOutBasketTotal();
	}

	
	public void EmptyBasket() {
		
		this.items = new ArrayList<BasketItem>();
		this.basketTotalValue =0;
		this.basketItemCount =0;

	}
	
	public void WorkOutTotalWithDiscountPerecent(float discountPercent) {

		double tempTotalPercentDiscounted = basketTotalValue;
		tempTotalPercentDiscounted = tempTotalPercentDiscounted * ((100 - discountPercent) / 100);
		basketTotalValue = tempTotalPercentDiscounted;

	}

	public void WorkOutTotalWithValueDiscount(float valueDiscount) {

		double tempTotalValueDiscounted = basketTotalValue;

		tempTotalValueDiscounted = tempTotalValueDiscounted - valueDiscount;
		
		
	}
	
	
	
	
	

}

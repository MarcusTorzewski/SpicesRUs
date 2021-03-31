package com.example.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "promo")
public class Promo {
	
	
	@Id
	private String promoCodeString;
	
	private int promoValuePercent;
	
	public Promo(String promoCodeString,int promoValuePercent) {
		
		this.promoCodeString = promoCodeString;
		
		this.promoValuePercent = promoValuePercent;
		
	}
	

	public String getPromoCodeString() {
		return promoCodeString;
	}

	public void setPromoCodeString(String promoCodeString) {
		this.promoCodeString = promoCodeString;
	}

	public int getPromoValuePercent() {
		return promoValuePercent;
	}

	public void setPromoValuePercent(int promoValuePercent) {
		this.promoValuePercent = promoValuePercent;
	}
	
	
	
	
	
	
	


}

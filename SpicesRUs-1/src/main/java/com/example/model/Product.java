package com.example.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="product")
public class Product {
	@Id
	private String id;
	@DBRef
	private Spice spice;
	private double price;
	private int weight;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Spice getSpice() {
		return spice;
	}
	public void setSpice(Spice s) {
		this.spice = s;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double d) {
		this.price = d;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	@Override
	public String toString() {
		return "product [id=" + id + ", spice=" + spice + ", price=" + price + ", weight=" + weight + "]";
	}
	
}

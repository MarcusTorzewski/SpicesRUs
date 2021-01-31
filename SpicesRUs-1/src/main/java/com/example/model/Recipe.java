package com.example.model;

import java.util.List;



public class Recipe {
	
	//General recipe info/properties
	private String name;
	private String type;
	private int prepTime;
	private int cookingTime;
	private String difficulty;
	private int servings;
	
	
	private List<Spice> spices;
	private String method;
	
	//Macros per serving 
	private int calories;
	private float fat;
	private float carbs;
	private float fibre;
	private float protein;
	private float salt;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrepTime() {
		return prepTime;
	}
	public void setPrepTime(int prepTime) {
		this.prepTime = prepTime;
	}
	public int getCookingTime() {
		return cookingTime;
	}
	public void setCookingTime(int cookingTime) {
		this.cookingTime = cookingTime;
	}
	public List<Spice> getSpices() {
		return spices;
	}
	public void setSpices(List<Spice> spices) {
		this.spices = spices;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public int getServings() {
		return servings;
	}
	public void setServings(int servings) {
		this.servings = servings;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public int getCalories() {
		return calories;
	}
	public void setCalories(int calories) {
		this.calories = calories;
	}
	public float getFat() {
		return fat;
	}
	public void setFat(float fat) {
		this.fat = fat;
	}
	public float getCarbs() {
		return carbs;
	}
	public void setCarbs(float carbs) {
		this.carbs = carbs;
	}
	public float getFibre() {
		return fibre;
	}
	public void setFibre(float fibre) {
		this.fibre = fibre;
	}
	public float getProtein() {
		return protein;
	}
	public void setProtein(float protein) {
		this.protein = protein;
	}
	public float getSalt() {
		return salt;
	}
	public void setSalt(float salt) {
		this.salt = salt;
	}
	
	
	
	

}

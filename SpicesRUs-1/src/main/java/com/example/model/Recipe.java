package com.example.model;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "recipe")
public class Recipe {

	@Id
	private String id;
	private String name;
	private String image;
	private int difficulty;
	private String region;
	private int prep_time;
	private int cooking_time;
	private int calories;
	private int servings;
	private List<String> spice_recommendations;
	private List<String> ingredients;
	private List<String> method;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getPrep_time() {
		return prep_time;
	}

	public void setPrep_time(int prep_time) {
		this.prep_time = prep_time;
	}

	public int getCooking_time() {
		return cooking_time;
	}

	public void setCooking_time(int cooking_time) {
		this.cooking_time = cooking_time;
	}
	
	public int getCalories() {
		return calories;
	}

	public void setCalories(int calories) {
		this.calories = calories;
	}

	public int getServings() {
		return servings;
	}

	public void setServings(int servings) {
		this.servings = servings;
	}

	public List<String> getSpice_recommendations() {
		return spice_recommendations;
	}

	public void setSpice_recommendations(List<String> spice_recommendations) {
		this.spice_recommendations = spice_recommendations;
	}
	
	public List<String> getIngredients() {
		return ingredients;
	}
	
	public void setIngredients(List<String> ingredients) {
		this.ingredients = ingredients;
	}

	public List<String> getMethod() {
		return method;
	}

	public void setMethod(List<String> method) {
		this.method = method;
	}
	
}

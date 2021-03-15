package com.example.model;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "spice")
public class Spice {

	@Id
	private String id;
	private String name;
	private String image;
	private String region;
	
	private float basePricePerKG;
	
	private float defaultSize = 100;

	
	private List<String> compliment_spices;


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


	public String getRegion() {
		return region;
	}


	public void setRegion(String region) {
		this.region = region;
	}


	public float getBasePricePerKG() {
		return basePricePerKG;
	}


	public void setBasePricePerKG(float basePricePerKG) {
		this.basePricePerKG = basePricePerKG;
	}


	public float getDefaultSize() {
		return defaultSize;
	}


	public void setDefaultSize(float defaultSize) {
		this.defaultSize = defaultSize;
	}


	public List<String> getCompliment_spices() {
		return compliment_spices;
	}


	public void setCompliment_spices(List<String> compliment_spices) {
		this.compliment_spices = compliment_spices;
	}
	

}

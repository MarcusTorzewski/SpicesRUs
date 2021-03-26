 package com.example.model;

import java.util.ArrayList;
import java.util.List;


import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="user")
public class User {
	@Id
	private String id;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	
	private String addressLine1;
	private String addressLine2;
	private String City;
	private String Country;
	private String Postcode;
	
	@DBRef
	private List<Role> roles;
	
	@DBRef
	private List<Spice> favouriteSpices = new ArrayList<>();
	
	@DBRef
	private List<Recipe> favouriteRecipes = new ArrayList<>();
	
	
	
	public List<Spice> getFavouriteSpices() {
		return favouriteSpices;
	}
	public void setFavouriteSpices(List<Spice> favouriteSpices) {
		this.favouriteSpices = favouriteSpices;
	}
	public List<Recipe> getFavouriteRecipes() {
		return favouriteRecipes;
	}
	public void setFavouriteRecipes(List<Recipe> favouriteRecipes) {
		this.favouriteRecipes = favouriteRecipes;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastname() {
		return lastName;
	}
	public void setLastname(String lastname) {
		this.lastName = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	// for principal.getName()
	public String getName() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public String getPostcode() {
		return Postcode;
	}
	public void setPostcode(String postcode) {
		Postcode = postcode;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastname=" + lastName + ", email=" + email
				+ ", password=" + password + "]";
	}
	
}

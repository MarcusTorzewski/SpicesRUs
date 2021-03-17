package com.example.model;

/*
 * This class exists solely to house data from the registration form. It is deliberately not connected to the db
 * Unless you're changing register forms, you're in the wrong place.
 */
public class NewUser {
	private String email;
	private String password;
	private String passwordCheck;
	private String firstName;
	private String lastName;
	private boolean premium;
	
	private String addressLine1;
	private String addressLine2;
	private String City;
	private String Country;
	private String Postcode;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordCheck() {
		return passwordCheck;
	}
	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public boolean isPremium() {
		return premium;
	}
	public void setPremium(boolean premium) {
		this.premium = premium;
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
	@Override
	public String toString() {
		return "NewUser [email=" + email + ", password=" + password + ", passwordCheck=" + passwordCheck
				+ ", firstName=" + firstName + ", lastName=" + lastName + ", premium=" + premium + ", addressLine1="
				+ addressLine1 + ", addressLine2=" + addressLine2 + ", City=" + City + ", Country=" + Country
				+ ", Postcode=" + Postcode + "]";
	}
	
	
}

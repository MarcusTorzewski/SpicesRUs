package com.example.model;


import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="role")
public class Role {
	@Id
	private String id;
	//private Collection<User> users; This might be necessary but im not sure yet, putting it here so people know it could exist -marcus

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + "]";
	}
	

}

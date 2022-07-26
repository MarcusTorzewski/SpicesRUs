package com.example.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.model.User;

public interface UserRepository extends MongoRepository<User, String>{
	public User findByEmail(String email);
	public void deleteByEmail(String email);
}

package com.example.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.model.Role;

public interface RoleRepository extends MongoRepository<Role, String>{
	public Role findByid(String id);
}

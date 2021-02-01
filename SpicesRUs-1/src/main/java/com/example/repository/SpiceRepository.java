package com.example.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.model.Spice;


public interface SpiceRepository extends MongoRepository<Spice, String>{

}

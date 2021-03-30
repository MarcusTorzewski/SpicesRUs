package com.example.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.model.Basket;

public interface BasketRepository extends MongoRepository<Basket, String> {

}

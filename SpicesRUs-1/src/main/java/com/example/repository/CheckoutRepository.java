package com.example.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.model.Checkout;



public interface CheckoutRepository extends MongoRepository<Checkout, String>{

}

package com.example.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.model.Promo;

public interface PromoRepository extends MongoRepository<Promo, String> {

}

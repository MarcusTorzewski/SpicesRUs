package com.example.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.example.model.Recipe;

public interface RecipeRepository extends MongoRepository<Recipe, String> {

	public Recipe findByName(String name);
}

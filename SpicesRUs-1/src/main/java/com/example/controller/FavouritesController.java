package com.example.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.Recipe;
import com.example.model.User;
import com.example.repository.RecipeRepository;
import com.example.repository.SpiceRepository;
import com.example.repository.UserRepository;

@Controller
public class FavouritesController {
	
	@Autowired
	private UserRepository urepo;
	
	@Autowired
	private SpiceRepository srepo;
	
	@Autowired
	private RecipeRepository rrepo;
	
	@RequestMapping("/addFavouriteRecipe/{recipe}")
	public String addFavouriteRecipe(@PathVariable Recipe recipe, Principal principal) {
		User user = urepo.findByEmail(principal.getName());
		user.getFavouriteRecipes().add(recipe);
		urepo.save(user);
		return "redirect:/recipe/{recipe}";
	}
	
	@RequestMapping("/removeFavouriteRecipe/{recipe}")
	public String removeFavouriteRecipe(@PathVariable Recipe recipe, Principal principal) {
		User user = urepo.findByEmail(principal.getName());
		user.getFavouriteRecipes().remove(recipe);
		urepo.save(user);
		return "redirect:/recipe/{recipe}";
	}

}

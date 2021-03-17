package com.example.controller;

import java.security.Principal;
import java.util.Collection;

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
	public String addFavouriteRecipe(@PathVariable("recipe") String recipeName, Principal principal) {
		User user = urepo.findByEmail(principal.getName());
		Recipe recipe = rrepo.findByName(recipeName);
		user.getFavouriteRecipes().add(recipe);
		System.out.println(user.getFavouriteRecipes());
		urepo.save(user);
		return "redirect:/recipes/{recipe}";
	}
	
	@RequestMapping("/removeFavouriteRecipe/{recipe}")
	public String removeFavouriteRecipe(@PathVariable("recipe") String recipeName, Principal principal) {
		User user = urepo.findByEmail(principal.getName());
		for (Recipe recipes : user.getFavouriteRecipes()) {
			if (recipes.getName().equals(recipeName)) {
				user.getFavouriteRecipes().remove(recipes);
				break;
			}
		}
		System.out.println(user.getFavouriteRecipes());
		urepo.save(user);
		return "redirect:/recipes/{recipe}";
	}
	
	public static boolean favouriteRecipesContainsRecipe(Collection<Recipe> favouriteRecipes, String recipeName) {
		for (Recipe recipes : favouriteRecipes) {
			if (recipes.getName().equals(recipeName)) {
				return true;
			}
		}
		return false;
	}
	
}

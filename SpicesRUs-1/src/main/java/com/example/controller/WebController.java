package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.repository.RecipeRepository;
import com.example.repository.SpiceRepository;

@Controller
public class WebController {
	
	@Autowired
	private SpiceRepository spice_repo;
	
	@Autowired
	private RecipeRepository recipe_repo;

	
	@RequestMapping("/")
	public String home(Model model) {
		return "/homepage/index";
	}
	
	@RequestMapping("/about")
	public String aboutUs(Model model) {
		return "/aboutUs/index";
	}
	
	@RequestMapping("/spices")
	public String spices(Model model) {
		model.addAttribute("spices", spice_repo.findAll());
		return "/spices/index";
	}
	
	@RequestMapping("/recipes")
	public String recipes(Model model) {
		model.addAttribute("recipes", recipe_repo.findAll());
		return "/recipes/index";
	}
	
	@RequestMapping("/spices/{spice}")
	public String spice(@PathVariable String spice, Model model) {
		model.addAttribute("spice", spice_repo.findByName(spice));
		return "/spices/spice";
	}
	
	@RequestMapping("/recipes/{recipe}")
	public String recipes(@PathVariable String recipe, Model model) {
		model.addAttribute("recipe", recipe_repo.findByName(recipe));
		return "/recipes/recipe";
	}
	
	
}

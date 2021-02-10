package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebController {
	
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
		return "/spices/index";
	}
	
	@RequestMapping("/recipes")
	public String recipes(Model model) {
		return "/recipes/index";
	}
	
	@RequestMapping("/spices/{spice}")
	public String spice(@PathVariable String spice, Model model) {
		model.addAttribute("spice", spice);
		return "/spices/spice";
	}

}

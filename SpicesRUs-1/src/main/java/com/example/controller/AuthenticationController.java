package com.example.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.User;
import com.example.repository.UserRepository;

@Controller
public class AuthenticationController {
	
	@Autowired
	public UserRepository repo;
	
	@RequestMapping("/login-form")
	public String loginForm() {
		return "/account/login";
	}
	
	@RequestMapping(value = "/success-login", method = RequestMethod.GET) 
	public String successLogin(Principal principal) { 
	   User user = repo.findByEmail(principal.getName()); 
	   if (user.getRoles().isEmpty()) { 
	     return "security/denied"; 
	   }
	   return "/homepage/index";
	} 
	
	@RequestMapping("/error-login")
	public String errorLogin() {
		System.out.print("Error login");
		return "/account/login";
	}
}

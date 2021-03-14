package com.example.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.User;
import com.example.repository.UserRepository;

@Controller
public class AuthenticationController {
	
	@Autowired
	public UserRepository repo;
	
	@Autowired 
	private PasswordEncoder pe; 
	
	private User user;
	
	@RequestMapping("/login-form")
	public String loginForm() {
		return "/account/login";
	}
	@RequestMapping("/myLogin")
	public String myLogin(@ModelAttribute("login") User login) {
		System.out.println(login.getName());
		System.out.println(login.getPassword());
		user = repo.findByEmail(login.getName());
		if (user == null) {
			return "/account/login";
		}
		if (user.getPassword() == pe.encode(login.getPassword())){
			return "/homepage/index";
		}
		return "/homepage/index";
	}
	
	@GetMapping("/success-login") 
	public String successLogin(Principal principal) { 
	   user = repo.findByEmail(principal.getName()); 
	   if (user.getRoles().isEmpty()) { 
	     return "/account/denied"; 
	   }
	   return "/homepage/index";
	} 
	
	@RequestMapping("/error-login")
	public String errorLogin() {
		System.out.print("Error login");
		return "/account/login";
	}
	
	@RequestMapping("/access-denied")
	public String accessDenied() {
		return "/account/denied";
	}
	
	@RequestMapping("/account")
	public String account(Model model) {
		model.addAttribute("user", user);
		return "/account/account";
	}
	
	@RequestMapping("/editAccount")
	public String editAccountPage(Model model) {
		model.addAttribute("user", user);
		return "/account/edit";
	}
	
	@RequestMapping("/editData")
	public String editAccount(@ModelAttribute List<String> data, Model model) {
		System.out.println(data);
		return "/account/account";
		
	}
	
	/*
	@RequestMapping("/logout")
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login?logout";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}
	*/
	
	@RequestMapping("/createAccount")
	public String accountCreation(Model model) {
		return "/account/registerForm";
	}
	
	@RequestMapping("/accountBuild")
	public String accountBuilder(@ModelAttribute("userRegister") User form) {
		return "/homepage/index";
	}
}

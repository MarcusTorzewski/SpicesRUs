package com.example.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.NewUser;
import com.example.model.Role;
import com.example.model.User;
import com.example.repository.RoleRepository;
import com.example.repository.UserRepository;

@Controller
public class AuthenticationController {
	
	@Autowired
	public UserRepository repo;
	@Autowired
	public RoleRepository rrepo;
	@Autowired 
	private PasswordEncoder pe; 
	
	private static User user;
	
	static public User getUser() {
		return user;
	}
	public static void setUser(User newUser) {
		user = newUser;
	}
	
	@RequestMapping("/login-form")
	public String loginForm(Model model) {
		if (user !=null) {
			if (!user.getEmail().equals("guest@guest.com")) {
				model.addAttribute("user", user);
				return "/account/account";
			}
		} else {
			user = repo.findByEmail("guest@guest.com");
		}
		return "/account/login";
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
		Role guest = rrepo.findByid("GUEST");
		if (user == null) {
			System.out.println("0");
			user = repo.findByEmail("guest@guest.com");
			return "/account/login";
		}
		if (user.getEmail().equals("guest@guest.com")) {
			return "/account/login";
		}
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
	
	
	@RequestMapping("/createAccount")
	public String accountCreation(Model model) {
		return "/account/registerForm";
	}
	
	@RequestMapping("/accountBuild")
	public String accountBuilder(@ModelAttribute("userRegister") NewUser form, Model model) {
		System.out.println(form);
		if (form.getEmail() == "" || form.getPassword() == "" || form.getPasswordCheck() == "" || form.getFirstName() == "" || form.getLastName() == "") {
			model.addAttribute("errorInfo", "Some data was not entered!");
			return "/account/registerForm";
		}
		if (repo.findByEmail(form.getEmail()) != null){
			model.addAttribute("errorInfo", "Email already in use!");
			return "/account/registerForm";
		}
		if (!form.getPassword().equals(form.getPasswordCheck())) {
			model.addAttribute("errorInfo", "Passwords don't match!");
			return "/account/registerForm";
		}
		user = new User();
		user.setEmail(form.getEmail());
		user.setPassword(pe.encode(form.getPassword()));
		user.setFirstName(form.getFirstName());
		user.setLastname(form.getLastName());
		user.setRoles(new ArrayList<>());
		if (form.isPremium()) {
			user.getRoles().add(rrepo.findByid("PREMIUM"));
		}
		user.getRoles().add(rrepo.findByid("MEMBER"));
		user = repo.save(user);
		return "/homepage/index";
	}
	
	@RequestMapping("/logout-user")
	public String logout(){
		user = repo.findByEmail("guest@guest.com");
		return "/account/login";
	}
}

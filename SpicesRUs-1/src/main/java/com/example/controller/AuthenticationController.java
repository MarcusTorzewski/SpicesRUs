package com.example.controller;

import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.Basket;
import com.example.model.NewUser;
import com.example.model.User;
import com.example.repository.BasketRepository;
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
	@Autowired
	public BasketRepository brepo;
	
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
		return "/admin/access-denied";
	}
	
	@RequestMapping("/account")
	public String account(Model model) {
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
	public String editAccount(@ModelAttribute("editUserDetails") NewUser form, Model model) {
		System.out.println(form);
		User updatedUser = new User();
		
		// checking for updated email
		if (form.getEmail() != "") {
			updatedUser.setEmail(form.getEmail());
		} else {
			updatedUser.setEmail(user.getEmail());
		}
		
		// checking for updated password
		if (form.getPassword() != "") {
			// checking for passwordCheck, if there isn't one, it returns the user to the form
			if (form.getPasswordCheck() == "") {
				model.addAttribute("errorInfo", "You haven't re-entered your new password!");
				return "/account/edit";
			} else if (!form.getPassword().equals(form.getPasswordCheck())) { 
				// checking that password and check match, if not, it returns user to form
				model.addAttribute("errorInfo", "Passwords don't match!");
				return "/account/edit";
			} else {
				updatedUser.setPassword(pe.encode(form.getPassword()));
			}
		} else {
			updatedUser.setPassword(user.getPassword());
		}
		
		// checking for updated first and last name
		if (form.getFirstName() != "") {
			updatedUser.setFirstName(form.getFirstName());
		} else {
			updatedUser.setFirstName(user.getFirstName());
		}
		if (form.getLastName() != "") {
			updatedUser.setLastname(form.getLastName());
		} else {
			updatedUser.setLastname(user.getLastname());
		}
		
		updatedUser.setRoles(new ArrayList<>());
		updatedUser.getRoles().add(rrepo.findByid("MEMBER"));
		if (form.isPremium() == true){
			updatedUser.getRoles().add(rrepo.findByid("PREMIUM"));
		}
		
		System.out.print(updatedUser);
		repo.deleteByEmail(user.getEmail());
		
		user = repo.save(updatedUser);
		model.addAttribute("user", user);
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
		
		User createUser = new User();
		createUser.setEmail(form.getEmail());
		createUser.setPassword(pe.encode(form.getPassword()));
		createUser.setFirstName(form.getFirstName());
		createUser.setLastname(form.getLastName());
		createUser.setRoles(new ArrayList<>());
		
		if (form.isPremium()) {
			createUser.getRoles().add(rrepo.findByid("PREMIUM"));
		}
		createUser.getRoles().add(rrepo.findByid("MEMBER"));
		
		Basket b = new Basket();
		user.setCustomerBasket(b);
		
		brepo.save(b);
		repo.save(createUser);
		return "/homepage/index";
	}
	
	@RequestMapping("/logout-user")
	public String logout(){
		user = repo.findByEmail("guest@guest.com");
		return "/account/login";
	}
}

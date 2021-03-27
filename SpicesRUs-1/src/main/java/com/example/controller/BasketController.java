package com.example.controller;


import java.security.Principal;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.Basket;
import com.example.model.BasketItem;
import com.example.model.PacketSize;
import com.example.model.Spice;
import com.example.model.User;
import com.example.repository.BasketRepository;
import com.example.repository.SpiceRepository;
import com.example.repository.UserRepository;



@Controller
public class BasketController {
	
	@Autowired
	BasketRepository basketRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	SpiceRepository spiceRepo;
	


	@RequestMapping(path= "basket/add/{id}/{size}/{quantity}",method = RequestMethod.GET)
	public String addItemToBasket(@CookieValue(value ="basketIdSpicesRUs",defaultValue = "empty") String cookieBasketId,HttpServletResponse response,@PathVariable("id") String id,@PathVariable("size") String size,@PathVariable("quantity") String quantity,Principal principal) {
		
		
		Spice spiceToBeAddedSpice = spiceRepo.findById(id).orElse(null);	
		BasketItem newItem = null;
		
		
		if(size.contains("small")) {
			System.out.println("SMALL ITEM ADDED");
			PacketSize packSizeS =PacketSize.SMALL;
			newItem = new BasketItem(spiceToBeAddedSpice,packSizeS,Integer.parseInt(quantity));
			
		}
		else if (size.contains("medium")) {
			System.out.println("MEDIUM ITEM ADDED");
			PacketSize packSizeM =PacketSize.MEDIUM;
			newItem = new BasketItem(spiceToBeAddedSpice,packSizeM,Integer.parseInt(quantity));
		
		}
		else if (size.contains("large")) {
			System.out.println("LARGE ITEM ADDED");
			PacketSize packSizeL =PacketSize.LARGE;
			newItem = new BasketItem(spiceToBeAddedSpice,packSizeL,Integer.parseInt(quantity));
					
		}
		
		
		
		if(principal != null) {
			
			User currentUser= userRepo.findById(principal.getName()).orElse(null);
			
			currentUser.getCustomerBasket().addItemToBasket(newItem);
			
			
			userRepo.save(currentUser);
			
			basketRepo.save(currentUser.getCustomerBasket());
		}
		else {
			
		
				
			Basket currentSessionBasket = basketRepo.findById(cookieBasketId).orElse(null);
				
			currentSessionBasket.addItemToBasket(newItem);
				
			basketRepo.save(currentSessionBasket);				
					
		}

		return "redirect:/basket";
	}
	
	
	
	@RequestMapping(path = "/emptybasket",method = RequestMethod.GET)
	public String emptyBasket(@CookieValue(value="basketIdSpicesRUs",defaultValue ="empty") String cookieBasketId,HttpServletResponse response,Principal principal) {
		
		if(principal!= null) {
			User currentUser = userRepo.findByEmail(principal.getName());
			
			Basket userBasket = currentUser.getCustomerBasket();		
			userBasket.EmptyBasket();
			
			userRepo.save(currentUser);
			basketRepo.save(userBasket);
			
		}
		else {
			
			Basket cookieBasket = basketRepo.findById(cookieBasketId).orElse(null);
			cookieBasket.EmptyBasket();
			
			basketRepo.save(cookieBasket);			
				
		}
	
		return "redirect:/basket";	
	
	}
	
	@RequestMapping(path = "/basket/removeItem/{pos}",method = RequestMethod.GET)
	public String removeItemFromBasket(@CookieValue(value ="basketIdSpicesRUs", defaultValue="empty") String cookieBasketId,HttpServletResponse response,@PathVariable("pos") String pos,Principal principal){
		
		if(principal != null) {
			User currentUser = userRepo.findByEmail(principal.getName());	
			currentUser.getCustomerBasket().RemoveItemFromBasket(Integer.parseInt(pos));
			
			basketRepo.save(currentUser.getCustomerBasket());
			
			userRepo.save(currentUser);
		}
		else {
			
			Basket cookieBasket = basketRepo.findById(cookieBasketId).orElse(null);
			
			cookieBasket.RemoveItemFromBasket(Integer.parseInt(pos));;
			
			basketRepo.save(cookieBasket);
			
		
		}
		
	
		return "redirect:/basket";
				
	}

	@RequestMapping("/basket")
	public String basket(@CookieValue(value ="basketIdSpicesRUs", defaultValue="empty") String cookieBasketId,HttpServletResponse response,Model model,Principal principal) {

		
		Basket basket = null;
		
		if(principal!= null) {
			User loggedInUser = userRepo.findById(principal.getName()).orElse(null);
			basket = basketRepo.findById(loggedInUser.getCustomerBasket().getBasketId()).orElse(null);
			if(basket == null) {
				System.out.println("basket cannot be found");
			}
			
			model.addAttribute("basket",basket);
			
			return "basket/basket";	
		}
		else {
			
			
			if(cookieBasketId.contains("empty")) {
				
				basket = new Basket();
				basket = basketRepo.save(basket);
				
				System.out.println("Basket id =  " +basket.getBasketId());
				
				setCookie(response,basket.getBasketId());
				
				model.addAttribute("basket",basket);
				
				return "basket/basket";
				
			}
			else {
	
				basket = basketRepo.findById(cookieBasketId).orElse(null);			
				model.addAttribute("basket", basket);
				return "basket/basket";
				
			}
				
		}
		
	
		
	}
	
	@GetMapping("/makeNewCookie")
	public String setCookie(HttpServletResponse response,String basketId) {
	    // create a cookie
	    Cookie cookie = new Cookie("basketIdSpicesRUs",basketId);
	    cookie.setMaxAge(7 * 24 * 60 * 60); 
	    cookie.setPath("/"); 
	
	    response.addCookie(cookie);

	    return "redirect:/spices";
	}
	
	
	
	
	
	
	
}

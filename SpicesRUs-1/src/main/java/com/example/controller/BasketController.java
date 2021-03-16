package com.example.controller;

import java.security.Principal;
import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

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
	
	
	
	

	@RequestMapping(path= "/basket/add/{id}/{size}/{quantity}",method = RequestMethod.POST)
	public String addItemToBasket(@PathVariable("id") String id,@PathVariable("size") String size,@PathVariable("quantity") String quantity,Principal principal) {
		
		
		return "redirect:/basket";
	}
	
	
	@RequestMapping(path = "/emptybasket",method = RequestMethod.GET)
	public String emptyBasket(Principal principal) {
		
		User currentUser = userRepo.findByEmail(principal.getName());
		
		
		Basket newUserBasket = new Basket();
		newUserBasket.setBasketItemCount(0);
		newUserBasket.setBasketTotalValue(0f);
		newUserBasket.setBasketId("123");
		newUserBasket.setItems(new ArrayList<BasketItem>());
		newUserBasket = basketRepo.save(newUserBasket);
				
		currentUser.setCustomerBasket(newUserBasket);		
		userRepo.save(currentUser);	
		return "redirect:/basket";	
		
	}
	
	@RequestMapping(path = "/basket/removeItem/{pos}",method = RequestMethod.GET)
	public String removeItemFromBasket(@PathVariable("pos") String pos,Principal principal)
	{
		User currentUser = userRepo.findByEmail(principal.getName());
		
		currentUser.getCustomerBasket().getItems().remove(Integer.parseInt(pos));
		
		basketRepo.save(currentUser.getCustomerBasket());
		userRepo.save(currentUser);
		
		
		return "redirect:/basket";
		
		
	}
	
	

	@RequestMapping("/basket")
	public String basket(Model model,Principal principal) {

		User loggedInUser = userRepo.findByEmail(principal.getName());
		
		Basket basket = basketRepo.findById(loggedInUser.getCustomerBasket().getBasketId()).orElse(null);
		
		if(basket == null) {
			System.out.println("basket cannot be found");
		}
		
		model.addAttribute("basket",basket);
		
		return "basket/basket";	
	}
	
	
}

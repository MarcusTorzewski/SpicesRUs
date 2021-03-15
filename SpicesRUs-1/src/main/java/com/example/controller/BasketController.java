package com.example.controller;

import java.security.Principal;

import org.apache.logging.log4j.message.StringFormattedMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.fasterxml.jackson.annotation.JsonTypeInfo.None;
import com.sun.java.swing.plaf.motif.MotifOptionPaneUI;
import com.sun.org.apache.bcel.internal.generic.NEW;

@Controller
public class BasketController {
	
	@Autowired
	BasketRepository basketRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	SpiceRepository spiceRepo;
	
	
	
	
	
	@RequestMapping(path="addItem/{spiceId}/{size}/{quant}",method = RequestMethod.POST)
	public String AddItemToBasket(@PathVariable String spiceId,@PathVariable String size,@PathVariable String quant, Model model,Principal principal) {
		
		
		Spice returnedSpice = spiceRepo.findById(spiceId).orElse(null);
		
		
		PacketSize packetSizeOfSpice;
		
		if(size == "S") {
			packetSizeOfSpice = PacketSize.SMALL;
		}
		else if(size == "M") {
			packetSizeOfSpice = PacketSize.MEDIUM;
		}
		else {
			packetSizeOfSpice = PacketSize.LARGE;			
		}
		
		BasketItem newItem = new BasketItem(returnedSpice, packetSizeOfSpice, Integer.parseInt(quant));
		
		User currentUser = userRepo.findByEmail(principal.getName());
		
		Basket userBasket = currentUser.getCustomerBasket();
		
		userBasket.getItems().add(newItem);
		
		userBasket = basketRepo.save(userBasket);
		
	
		return "redirect:/basket";
		
	}
	@RequestMapping(path = "/removeItem/{id}",method =  RequestMethod.POST)
	public String RemoveItemFromBasket(@PathVariable String id, Model model,Principal principal) {
		
		
		
		
		
		
		User currentUser = UserRepo.findByFirstName(principal.getName());
		
		
		
		return "redirect:/basket/basket";
	}
	
	@RequestMapping(path = "/emptyBasket",method = RequestMethod.POST)
	public String EmptyBasket(Principal principal) {
		User currentUser = UserRepo.findByFirstName(principal.getName());
		
		currentUser.getUserBasket().getItems().clear();
		
		return "redirect:/basket/basket";
		
	}
	
	@RequestMapping("/basket")
	public String basket(Model model) {

		
		Basket basket = basketRepo.findById("1").orElse(null);
		
		if(basket == null) {
			System.out.println("basket cannot be found");
		}
		
		model.addAttribute("basket",basket);
		
		return "basket/basket";	
	}
	
	
}

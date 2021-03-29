package com.example.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.Basket;
import com.example.model.Checkout;
import com.example.model.Role;
import com.example.model.User;
import com.example.repository.BasketRepository;
import com.example.repository.CheckoutRepository;
import com.example.repository.RecipeRepository;
import com.example.repository.SpiceRepository;
import com.example.repository.UserRepository;

@Controller
public class WebController {
	
	@Autowired
	private SpiceRepository spice_repo;
	
	@Autowired
	private RecipeRepository recipe_repo;
	
	@Autowired
	private UserRepository urepo;
	
	@Autowired
	private BasketRepository basketRepo;
	
	@Autowired CheckoutRepository checkoutRepo;
	
	@RequestMapping("/")
	public String home(Model model) {
		if (AuthenticationController.getUser() == null) {
			AuthenticationController.setUser(urepo.findByEmail("guest@guest.com"));
		}
		return "/homepage/index";
	}
	
	@RequestMapping("/about")
	public String aboutUs(Model model) {
		return "/aboutUs/index";
	}
	
	@RequestMapping("/spices")
	public String spices(@CookieValue(value = "basketIdSpicesRUs",defaultValue = "empty") String cookieBasketId,HttpServletResponse response,Model model) {
		model.addAttribute("spices", spice_repo.findAll());
		
		if(cookieBasketId.contains("empty")) {
			
			Basket newGuestBasket = new Basket();
			
			newGuestBasket = basketRepo.save(newGuestBasket);
			
			Cookie newBasketCookie = new Cookie("basketIdSpicesRUs", newGuestBasket.getBasketId());
			newBasketCookie.setMaxAge(7 * 24 * 60 * 60); 
		    newBasketCookie.setPath("/");
			
			response.addCookie(newBasketCookie);
					
		}
		
		
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
	public String recipes(@PathVariable String recipe, Model model, Principal principal) {
		
		model.addAttribute("recipe", recipe_repo.findByName(recipe));
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			User currentUser = urepo.findByEmail(principal.getName());
			for (Role role: currentUser.getRoles()) {
				if (role.getId().equals("MEMBER") || role.getId().equals("PREMIUM") || role.getId().equals("ADMIN")) {
					model.addAttribute("favouriteRecipes", currentUser.getFavouriteRecipes());
					Boolean isFavourited = com.example.controller.FavouritesController.favouriteRecipesContainsRecipe(currentUser.getFavouriteRecipes(), recipe);
					model.addAttribute("isFavourited", isFavourited);
					break;
				}
			}
		}
		
		return "/recipes/recipe";
	}
	
	@RequestMapping("/favourites")
	public String favourites(Model model, Principal principal) {
		try {
			User currentUser = urepo.findByEmail(principal.getName());
			if (currentUser.getEmail().equals("guest@guest.com")) {
				return "redirect:/login-form";
		}
		model.addAttribute("favouriteRecipes", currentUser.getFavouriteRecipes());
		model.addAttribute("favouriteSpices", currentUser.getFavouriteSpices());
		return "account/favourites";
		} catch(Exception e) {
			return "redirect:/login-form";
		}
	}
	
	@RequestMapping("/admin/sales")
	public String viewSales(Model model) {
		
		float allOrdersTotal =0;
		
		int numOfOrders = 0;
		
		
		List<Checkout> allSalesCheckouts = checkoutRepo.findAll();
		
		model.addAttribute("sales", allSalesCheckouts);
		
		for(Checkout c:allSalesCheckouts) {
			
			allOrdersTotal += c.getTotalValue();
		}
		
		allOrdersTotal= Math.round(allOrdersTotal*100);
		
		allOrdersTotal = allOrdersTotal/100;
		
		numOfOrders = allSalesCheckouts.size();
	
		model.addAttribute("totalSales", allOrdersTotal);
		
		model.addAttribute("orderCount",numOfOrders);
		
		return "/admin/sales";
	
	}
	

		
}

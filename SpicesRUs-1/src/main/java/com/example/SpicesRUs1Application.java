package com.example;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.model.Product;
import com.example.model.Recipe;
import com.example.model.Role;
import com.example.model.Spice;
import com.example.model.User;
import com.example.repository.ProductRepository;
import com.example.repository.RecipeRepository;
import com.example.repository.RoleRepository;
import com.example.repository.SpiceRepository;
import com.example.repository.UserRepository;


@SpringBootApplication
public class SpicesRUs1Application implements CommandLineRunner {
	
	@Autowired
	private UserRepository urepo;
	@Autowired
	private RoleRepository rrepo;
	@Autowired 
	private PasswordEncoder pe; 
	@Autowired
	private ProductRepository prepo;
	@Autowired
	private SpiceRepository srepo;
	@Autowired
	private RecipeRepository recipeRepo;


	public static void main(String[] args) {
		SpringApplication.run(SpicesRUs1Application.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		
		/* Not necessary for anyone to run this just here to show how it works
		 * V simple so far, but i can't say for certain that it will be as easy as 
		 * checking the user has x or y role when performing an action.
		 * View the db to see how things are stored.
		 * No real harm if you run this code but no reason to either. -marcus
		User testUser = new User();
		testUser.setFirstName("John");
		testUser.setLastname("Smith");
		
		Role member = new Role();
		member.setId("MEMBER");
		member = rrepo.save(member);
		Role guest = new Role();
		guest.setId("GUEST");
		guest = rrepo.save(guest);
		Role admin = new Role();
		admin.setId("ADMIN");
		admin = rrepo.save(admin);
		Role premium = new Role();
		premium.setId("PREMIUM");
		premium = rrepo.save(premium);
		
		User testUser = new User();
		testUser.setFirstName("John");
		testUser.setLastname("Smith");
		testUser.setEmail("js@gmail.com");
		testUser.setPassword(pe.encode("password"));
		testUser.setRoles(new ArrayList<>());
		testUser.getRoles().add(admin);
		testUser.getRoles().add(premium);
		testUser = urepo.save(testUser);
		 */
		

		
		// Test that a product of a spice can be added.
//		Spice s = new Spice();
//		s.setName("cayanne");
//		s.setImage("cayanne_pepper");
//		s.setRegion("French Guiana");
//		s = srepo.save(s);
//		
//		Product p = new Product();
//		p.setSpice(s);
//		p.setWeight(50);
//		p.setPrice(2.50);
//		p = prepo.save(p);

		
		/* Recipe was added to help design recipe page, can be deleted
		Recipe recipe = new Recipe();
		recipe.setCalories(463);
		recipe.setCooking_time(15);
		recipe.setDifficulty(1);
		recipe.setImage("https://images.immediate.co.uk/production/volatile/sites/30/2020/08/salmonpasta-11bb3f0.jpg?quality=90&webp=true&resize=300,272");
		recipe.setIngredients(Arrays.asList("240g Wholewheat fusili", "knob of butter", "1 large shallot, finely chopped","140g frozen peas", "2 skinless salmon fillets, cut into chunks", "140g low fat creme fraiche", "1/2 low-salt vegetable stock cube", "small bunch of chives, snipped"));
		recipe.setMethod(Arrays.asList("Bring a pan of water to the boil and cook the fusilli according to the pack instructions.", "Meanwhile, heat a knob of butter in a saucepan, then add the shallot and cook for 5 mins or until softened.", "Add the peas, salmon, crème fraîche and 50ml water. Crumble in the stock cube.", "Cook for 3-4 mins until cooked through, stir in the chives and some black pepper. Then stir through to coat the pasta. Serve in bowls."));
		recipe.setPrep_time(5);
		recipe.setName("Pasta with salmon and peas");
		recipe.setServings(4); 
		recipe.setDescription("Make this salmon pasta in under 20 minutes for a dinner the whole family can enjoy. Kids will love the fun-shaped pasta while packing in fibre and omega-3"); 
		recipe.setCarbs(44);
		recipe.setFat(19);
		recipe.setFibre(7);
		recipe.setProtein(25);
		recipe.setSalt(0.2);
		recipe.setSaturates(6);
		recipe.setSugars(5);
		
		
		
		recipeRepo.save(recipe); 
		
		Role guest = rrepo.findByid("GUEST");
		User testUser = new User();
		testUser.setFirstName(null);
		testUser.setLastname(null);
		testUser.setEmail("guest@guest.com");
		testUser.setPassword(pe.encode("password"));
		testUser.setRoles(new ArrayList<>());
		testUser.getRoles().add(guest);
		urepo.save(testUser);*/
		
		
	}

}

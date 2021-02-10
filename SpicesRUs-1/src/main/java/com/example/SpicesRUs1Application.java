package com.example;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.model.Product;
import com.example.model.Role;
import com.example.model.Spice;
import com.example.model.User;
import com.example.repository.ProductRepository;
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
	private ProductRepository prepo;
	@Autowired
	private SpiceRepository srepo;

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
		
		
		Role admin = new Role();
		admin.setId("admin");
		admin = rrepo.save(admin);
		Role premium = new Role();
		premium.setId("premium");
		premium = rrepo.save(premium);
		Role member = new Role();
		member.setId("member");
		member = rrepo.save(member);
		Role guest = new Role();
		guest.setId("guest");
		guest = rrepo.save(guest);
		
		
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
		
	}

}

package com.example;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.model.Role;
import com.example.model.User;
import com.example.repository.RoleRepository;
import com.example.repository.UserRepository;


@SpringBootApplication
public class SpicesRUs1Application implements CommandLineRunner {
	
	@Autowired
	private UserRepository urepo;
	@Autowired
	private RoleRepository rrepo;
	@Autowired 
	private PasswordEncoder pe; 
	
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

		
		

		
	}

}

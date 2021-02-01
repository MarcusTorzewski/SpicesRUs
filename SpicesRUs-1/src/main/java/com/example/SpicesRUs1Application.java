package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

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

	public static void main(String[] args) {
		SpringApplication.run(SpicesRUs1Application.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		
		User testUser = new User();
		testUser.setFirstName("John");
		testUser.setLastname("Smith");
		urepo.save(testUser);
		
		Role testRole = new Role();
		testRole.setId("TestRole");
		rrepo.save(testRole);
	}

}

package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.model.Customer;
import com.example.repository.CustomerRepository;

@SpringBootApplication
public class SpicesRUs1Application implements CommandLineRunner {
	
	@Autowired
	private  CustomerRepository crepo;

	public static void main(String[] args) {
		SpringApplication.run(SpicesRUs1Application.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		
		/*
		 Uploading this example to the database works
		Customer testCustomer = new Customer();
		testCustomer.setName("John Smith 2");
		testCustomer.setAge(30);
		testCustomer.setWeight(70);
		crepo.save(testCustomer);
		*/
		
	}

}

package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter { 
	@Autowired
	private UserDetailsService userDetailsService; 
	
	@Override 
	protected void configure(HttpSecurity http) throws Exception { 
		http.requiresChannel().anyRequest().requiresSecure();
		
	} 
	
	@Bean
	public PasswordEncoder passwordEncoder() { 
		return new BCryptPasswordEncoder(); 
	}

	@Autowired 
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception { 
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder()); 
	} 

} 

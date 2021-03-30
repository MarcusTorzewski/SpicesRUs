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

import com.example.service.CustomUserDetailsService;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter { 
	@Autowired
	private CustomUserDetailsService userDetailsService; 
	
	@Override 
	protected void configure(HttpSecurity http) throws Exception { 
		http.requiresChannel().anyRequest().requiresSecure().and().formLogin()
		.loginPage("/login-form")
		.loginProcessingUrl("/perform_login")
		.defaultSuccessUrl("/success-login",true)
		.usernameParameter("email")
		.failureUrl("/error-login")
		.permitAll()
	.and().logout()
		.invalidateHttpSession(true)
		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
		.logoutSuccessUrl("/logout-user")
		.permitAll()
	.and().authorizeRequests()
		.antMatchers("/admin/**").hasRole("ADMIN")
		.antMatchers("/**").permitAll()
		.antMatchers("/css/**").permitAll()
	.and().exceptionHandling().accessDeniedPage("/access-denied");

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

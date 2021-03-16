package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.model.Role;
import com.example.model.User;
import com.example.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private UserRepository urepo;;
	
	private UserDetails buildUserForAuthentication(User user, List<GrantedAuthority> authorities) {
	    return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), true, true, true, true, authorities);
	}
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User domainUser = urepo.findByEmail(email);
		System.out.println("1"); 
	    if(domainUser != null) {
	    	   List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>(); 
	    	      for (Role r : domainUser.getRoles()) { 
	    	         authorities.add(new SimpleGrantedAuthority("ROLE_" + r.getId())); 
	    	      } 
	        return buildUserForAuthentication(domainUser, authorities);
	    } else {
	        throw new UsernameNotFoundException("username not found");
	    }
	}
}

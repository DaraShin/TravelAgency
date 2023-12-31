package com.example.tripsagency.controller;

import java.util.Collections;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.tripsagency.domain.Role;
import com.example.tripsagency.domain.User;
import com.example.tripsagency.repos.UserRepo;

@Controller
public class RegistrationController {
	private UserRepo userRepo;
	
	public RegistrationController(UserRepo userRepo) {
		this.userRepo = userRepo;
	}
	
	@GetMapping("/registration")
	public String registration() {
		return "registration";
	}
	
	@PostMapping("/registration")
	public String addUser(User user, Model model) {
		User userFromDb = userRepo.findByUsername(user.getUsername());
		if(userFromDb != null) {
			model.addAttribute("message", "Пользователь с таким именем существует" );
			return "registration";
		}
		
		user.setActive(true);
		user.setRoles(Collections.singleton(Role.USER));
		userRepo.save(user);
		
		return "redirect:/login";	
	}

}

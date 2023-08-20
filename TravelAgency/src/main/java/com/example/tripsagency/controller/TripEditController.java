package com.example.tripsagency.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.tripsagency.domain.Trip;
import com.example.tripsagency.repos.TripRepository;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
public class TripEditController {
	private TripRepository tripRepo;
	
	public TripEditController(TripRepository tripRepo) {
		this.tripRepo = tripRepo;
	}
	
	@GetMapping("/create-trip")
	public String getAddTrip() {
		return "tripCreate";
	}
	
	@GetMapping("/edit-trip/{tripId}")
	public String getEditTrip(@PathVariable("tripId") Trip trip, Model model) {
		model.addAttribute("trip", trip);
		return "tripEdit";
	}
	
	@PostMapping("/save-trip")
	public String saveTrip(
			Trip trip,
			Model model,
			@RequestParam Map<String, String> form) {
		tripRepo.save(trip);
		return "redirect:/trips";	
	}
	
	@PostMapping("/delete-trip")
	public String deleteTrip(Trip trip) {
		tripRepo.delete(trip);
		return "redirect:/trips";	
	}
}

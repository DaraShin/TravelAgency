package com.example.tripsagency.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.tripsagency.domain.Trip;
import com.example.tripsagency.repos.TripRepository;

@Controller
public class TripListController {
	private TripRepository tripRepo;

	public TripListController(TripRepository tripRepo) {
		this.tripRepo = tripRepo;
	}
	

	@GetMapping("/trips")
	public String allTrips(
			@RequestParam(required = false, defaultValue = "") String tripType,
			@RequestParam(required = false, defaultValue = "") String isHotTour, 
			Model model) {
		Iterable<Trip> tripList;

		if (tripType != null && !tripType.isEmpty()) {
			model.addAttribute("tripType", tripType);
			if (isHotTour != null && isHotTour.equals("on")) {
				tripList = tripRepo.findByTripTypeAndIsHotTourTrue(tripType);
				model.addAttribute("isHotTour", isHotTour);
			} else {
				tripList = tripRepo.findByTripType(tripType);
			}
		} else {
			if (isHotTour != null && isHotTour.equals("on")) {
				tripList = tripRepo.findByIsHotTourTrue();
				model.addAttribute("isHotTour", isHotTour);
			} else {
				tripList = tripRepo.findAll();
			}
		}

		model.addAttribute("trips", tripList);

		return "tripList";
	}
	
	@GetMapping("/all-trips")
	public String allTrips() {
		return "redirect:/trips";
	}
}

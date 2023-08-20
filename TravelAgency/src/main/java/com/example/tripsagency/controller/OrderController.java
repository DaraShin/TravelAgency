package com.example.tripsagency.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
	@GetMapping("/create-order/{tripId}")
	public String createOrder() {
		return "orderEdit";
	}

}

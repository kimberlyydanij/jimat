package com.mycompany.myapp;

import org.springframework.stereotype.Controller;

@Controller
public class ReviewController {

	private ReviewService service;
	private ReviewDTO rdto;
	
	public ReviewController() {

	}
	
	public void setService(ReviewService service) {
		this.service = service;
	}
}   
 
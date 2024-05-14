package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Validated
@Controller
public class BoardController {
	@GetMapping("/")
	public ModelAndView main() {
		return new ModelAndView("main");
	}
	
}

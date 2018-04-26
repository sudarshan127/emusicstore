package com.emusicstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) 
			String error, @RequestParam(value = "logout", required = false) 
			String logout, Model model) {
		
		if(error!=null) {
			model.addAttribute("error", "invalid username or password");
			
		}
		
		if(logout!=null) {
			model.addAttribute("msg", "you have been logged out.");
			
		}
		
		return "login";
		
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		
		return "about";
	} 
	/*
	
	
	@RequestMapping(value ="/productList/viewProduct/{id}", method = RequestMethod.GET)
	public String viewProduct(@PathVariable int id, Model model) throws IOException {
		
		Product product = productDao.getProductById(id);
		model.addAttribute(product);
		
		return "viewProduct";
	}
	
	*/
}

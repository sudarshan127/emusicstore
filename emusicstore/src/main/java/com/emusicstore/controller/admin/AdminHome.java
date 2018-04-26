package com.emusicstore.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.emusicstore.model.Customer;
import com.emusicstore.model.Product;
import com.emusicstore.service.CustomerService;
import com.emusicstore.service.ProductService;


@Controller
@RequestMapping(value ="/admin", method = RequestMethod.GET)
public class AdminHome {

	@Autowired
	private ProductService productService; 
	
	@Autowired
	private CustomerService customerService;
	
	
	@RequestMapping
	public String adminPage() {
		return "admin"; 
		
	}
	
	@RequestMapping(value ="/productInventory", method = RequestMethod.GET)
	public String productInventory(Model model) {
		List<Product> products = productService.getProductList();
		model.addAttribute("products", products);
		
		return "productInventory";
	}
	
	@RequestMapping(value ="/customer", method = RequestMethod.GET)
	public String customerManagement(Model model) {
		List<Customer> customerList = customerService.getAllCustomers();
		System.out.println(customerList);
		model.addAttribute("customerList", customerList);
		return "customerManagement";
		
	}
}

package com.emusicstore.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.emusicstore.model.Product;
import com.emusicstore.service.ProductService;

@Controller
@RequestMapping(value = "/product", method = RequestMethod.GET)
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String getProducts(Model model) {
		List<Product> products = productService.getProductList();
		model.addAttribute("products", products);
		
		return "productList";
	}
	
	@RequestMapping(value = "/viewProduct/{id}", method = RequestMethod.GET)
	public String viewProduct(@PathVariable int id, Model model) throws IOException{
		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
		
		return "viewProduct";
	}
}



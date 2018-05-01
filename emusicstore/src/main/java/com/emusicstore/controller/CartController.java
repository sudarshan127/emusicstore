package com.emusicstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.emusicstore.model.Cart;
import com.emusicstore.model.Customer;
import com.emusicstore.service.CartItemService;
import com.emusicstore.service.CartService;
import com.emusicstore.service.CustomerService;
import com.emusicstore.service.ProductService;

@Controller
@RequestMapping("/customer/cart")
public class CartController {

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping
	public String getCart(@AuthenticationPrincipal User activeUser) {
		
		Customer customer = customerService.getCustomerByUsername (activeUser.getUsername());
		int cartId = customer.getCart().getCartId();
		
		return "redirect:/customer/cart/" + cartId;
	}
	
	@RequestMapping ("/{cartId}")
	public String getCartRedirect(@PathVariable (value = "cartId") int cartId, Model model) {
		model.addAttribute("cartId", cartId);
		Cart cart = cartService.getCartById(cartId);
		System.out.println(cart);
		
		cart.getCartItem();
		System.out.println(cart.getCartItem());
		
		for(int i=0; i<cart.getCartItem().size(); i++) {
			
			String name = cart.getCartItem().get(i).getProduct().getName();
			model.addAttribute("name", name);
			System.out.println(cart.getCartItem().get(i).getProduct().getName());
			
			double price = cart.getCartItem().get(i).getProduct().getPrice();
			model.addAttribute("price", price);
			System.out.println(cart.getCartItem().get(i).getProduct().getPrice());
			
			int quant = cart.getCartItem().get(i).getQuantity();
			model.addAttribute("quant", quant);
			System.out.println(cart.getCartItem().get(i).getQuantity());
			
			
		}
		
		cart.getGrandTotal();
		System.out.println(cart.getGrandTotal());
		return "cart";
		
	}
}

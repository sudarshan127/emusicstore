package com.emusicstore.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.emusicstore.model.Cart;
import com.emusicstore.model.CartItem;
import com.emusicstore.model.Customer;
import com.emusicstore.model.Product;
import com.emusicstore.service.CartItemService;
import com.emusicstore.service.CartService;
import com.emusicstore.service.CustomerService;
import com.emusicstore.service.ProductService;

@Controller
@RequestMapping("/rest/cart")
public class CartResources {
	Logger log = Logger.getLogger(CartResources.class);
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartItemService cartItemService;
	
	@Autowired
	private CustomerService CustomerService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping ("/{cartId}")
	public @ResponseBody Cart getCartById(@PathVariable (value = "cartId") int cartId) {
		return cartService.getCartById(cartId);
		
	}
	
	@RequestMapping (value = "/add/{id}", method= {RequestMethod.PUT, RequestMethod.POST, RequestMethod.GET})
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void addItem(@PathVariable (value = "id") int id, @AuthenticationPrincipal User activeUser) {
		/*System.out.println(" Adding id " + id + " to cart... USER = " + activeUser.getUsername());
		log.info(" Adding id " + id + " to cart... USER = " + activeUser.getUsername());*/
		Customer customer = CustomerService.getCustomerByUsername(activeUser.getUsername());
		Cart cart = customer.getCart();
		Product product = productService.getProductById(id);
		List<CartItem> cartItems = cart.getCartItem(); //getCartItems
		
		for(int i=0; i<cartItems.size(); i++) {
			if( product.getId() == cartItems.get(i).getProduct().getId()) {
				CartItem cartItem = cartItems.get(i);
				cartItem.setQuantity(cartItem.getQuantity()+1);
				cartItem.setTotalPrice(product.getPrice()*cartItem.getQuantity());
				cartItemService.addCartItem(cartItem);
				
				return;
			}
			
		}
		
		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setQuantity(1);
		cartItem.setTotalPrice(product.getPrice()*cartItem.getQuantity());
		cartItem.setCart(cart);
		cartItemService.addCartItem(cartItem);
	}
	
	@RequestMapping (value = "/remove/{cartId}", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeItem (@PathVariable(value = "cartId" ) int cartId) {
		
		CartItem cartItem = cartItemService.getCartItemById(cartId);
		cartItemService.removeCartItem(cartItem);
	}
	
	@RequestMapping (value = "/{cartId}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void clearCart (@PathVariable (value = "cartId") int cartId) {
		
		Cart cart = cartService.getCartById(cartId);
		cartItemService.removeAllCartItems(cart);
	}
	
	@ExceptionHandler(IllegalArgumentException.class)
	@ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Illegal request, please verify your payload.")
	public void handleClientErrors (Exception e) {
		
	}
	
	@ExceptionHandler(Exception.class)
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal Server Error.")
	public void handleServerErrors (Exception e) {
		
	}
}

package com.emusicstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.emusicstore.dao.CustomerOrderDao;
import com.emusicstore.model.Cart;
import com.emusicstore.model.CartItem;
import com.emusicstore.model.CustomerOrder;
import com.emusicstore.service.CartService;
import com.emusicstore.service.CustomerOrderService;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService{

	@Autowired
	private CustomerOrderDao customerOrderDao;
	
	@Autowired
	private CartService cartService;
	
	public void addCustomerOrder(CustomerOrder customerOrder) {
		
		customerOrderDao.addCustomerOrder(customerOrder);
	}
	
	public double getCustomerOrderGrandTotal(int cartId) {
		
		double grandTotal = 0;
		Cart cart = cartService.getCartById(cartId);
		List<CartItem> cartItems = cart.getCartItem();
		
		for(CartItem item : cartItems) {
			
			grandTotal += item.getTotalPrice(); 
		}
		
		return grandTotal;
	}
	
}

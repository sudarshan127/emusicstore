package com.emusicstore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.emusicstore.dao.CartDao;
import com.emusicstore.model.Cart;
import com.emusicstore.service.CartService;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDao cartDao;
	
	public Cart getCartById(int cartId) {
		
		return cartDao.getCartById(cartId);
	}
	
	public void update (Cart cart) {
		cartDao.update(cart);
		
	}
}

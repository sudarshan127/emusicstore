package com.emusicstore.service;

import java.util.List;

import com.emusicstore.model.Customer;


public interface CustomerService {

	void addCustomer(Customer customer);
	
	List<Customer> getAllCustomers();
	
	Customer getCustomerById(int customerId);
	
	Customer getCustomerByUsername (String username);
}

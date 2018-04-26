package com.emusicstore.dao;

import java.util.List;

import com.emusicstore.model.Customer;

public interface CustomerDao {
	
	void addCustomer(Customer customer);
	
	List<Customer> getAllCustomers();
	
	Customer getCustomerById(int customerId);
	
	Customer getCustomerByUsername (String username);
}

package com.emusicstore.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Customer implements Serializable{

	private static final long serialVersionUID = 5140900014886997914L;

	@Id
	@GeneratedValue
	private int customerId;
	
	
	@Pattern(regexp="[a-zA-Z]*", message = "Only Character Accepted!!")
	private String customerName;
	
	@Email
	@Pattern(regexp=".+@.+\\..+", message = "Invalid Email Pattern")
	private String customerEmail;
	
	@Pattern(regexp="[\\d]{10}", message = "Only 10 Numbers Accepted")
	private String customerPhone;
	
	@NotBlank
	private String username;
	
	
	@Size(min=6, max=20)
	@Pattern.List({
        @Pattern(regexp = "(?=.*[0-9]).+", message = "Password must contain one digit."),
        @Pattern(regexp = "(?=.*[a-z]).+", message = "Password must contain one lowercase letter."),
        @Pattern(regexp = "(?=.*[A-Z]).+", message = "Password must contain one upper letter."),
        @Pattern(regexp = "(?=.*[!@#$%^&*+=?-_()/\"\\.,<>~`;:]).+", message ="Password must contain one special character."),
        @Pattern(regexp = "(?=\\S+$).+", message = "Password must contain no whitespace.")})
	private String password;
	
	private boolean enabled;
	
	@OneToOne
	@JoinColumn(name = "billingAddressId")
	private BillingAddress billingAddress;
	
	@OneToOne
	@JoinColumn(name = "shippingAddressId")
	private ShippingAddress shippingAddress;
	
	
	@OneToOne
	@JoinColumn(name = "cartId")
	@JsonIgnore
	private Cart cart;


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	public String getCustomerName() {
		return customerName;
	}


	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}


	public String getCustomerEmail() {
		return customerEmail;
	}


	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}


	public String getCustomerPhone() {
		return customerPhone;
	}


	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public boolean isEnabled() {
		return enabled;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public BillingAddress getBillingAddress() {
		return billingAddress;
	}


	public void setBillingAddress(BillingAddress billingAddress) {
		this.billingAddress = billingAddress;
	}


	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}


	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}


	public Cart getCart() {
		return cart;
	}


	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	
}

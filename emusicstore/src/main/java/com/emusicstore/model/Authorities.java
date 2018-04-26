package com.emusicstore.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Authorities {

	
	@Id
	@GeneratedValue
	private int authorities_Id;
	
	public String username;
	public String authority;
	
	
	
	public int getAuthorities_Id() {
		return authorities_Id;
	}
	public void setAuthorities_Id(int authorities_Id) {
		this.authorities_Id = authorities_Id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
}

package com.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "user") 
@Data
public class UserEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userId;
	
	private String firstName;
	private String lastName;
	private String gender;
	private String email;
	private String password;
	private String contactNum;
	private String batch;
	private String role;
	private String branch;
	private String profilePicURL;
	
	
	
	

}

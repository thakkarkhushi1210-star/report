package com.entity;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "userstats") 
@Data
public class UserStatsEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userStatsId;
	
	private Integer attendancePercentage;
	private Integer communication;
	private Integer discipline;
	private Integer resultPercentage;
	
	@Column(name = "subject_name")
	private String subject;
	

	
	
	

}


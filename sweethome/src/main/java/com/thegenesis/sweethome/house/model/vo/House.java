package com.thegenesis.sweethome.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class House {
	
	private int houseNo;
	private String houseName;
	private String houseTitle;
	private String houseIntroduce;
	private String shareSpace;
	private String personalSpace;
	private String traffic;
	private String convenience;
	private String status;
	private int report;
	private String address;
	
}

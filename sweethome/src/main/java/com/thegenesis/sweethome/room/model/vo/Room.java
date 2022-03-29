package com.thegenesis.sweethome.room.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Room {
	
	private int roomNo;
	private int houseNo;
	private String roomName;
	private String gender;
	private int people;
	private String area;
	private String deposit;
	private int rent;
	private int expense;
	private int utility;
	private Date availableDate;
	
	private String status;
	private String houseName;
	private String houseTitle;
	private String houseIntroduce;
	private String shareSpace;
	private String personalSpace;
	private String traffic;
	private String convenience;
	private String address;
	private String latitude;
	private String longitude;
}

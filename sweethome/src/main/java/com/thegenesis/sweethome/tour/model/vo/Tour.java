package com.thegenesis.sweethome.tour.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Tour {
	
	private int rownum;
	private int tourNo;
	private int houseNo;
	private String houseName;
	private String roomName;
	private String userName;
	private String gender;
	private String age;
	private String phone;
	private String email;
	private String askContent;
	private Date tourTime;
	private String status;
	
	private int userNo;
	private int roomNo;
	private String address;
	private String timeString;
	private String ownerPhone;
}

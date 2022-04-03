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
	private String userId;
	private Date availableDate;


	private String status;
	
	// 룸에서 하우스 합쳐서 쓸려고

	private String houseName;
	private String houseTitle;
	private String houseIntroduce;
	private int userNo;
	
	private String shareSpace;
	private String personalSpace;
	private String traffic;
	private String convenience;
	private String address;
	private String latitude;
	private String longitude;

	// View 전용
	private int[] roomNoArr;
	private String[] roomNameArr;
	private String[] genderArr;
	private int[] peopleArr;
	private String[] areaArr;
	private String[] depositArr;
	private int[] rentArr;
	private int[] expenseArr;
	private int[] utilityArr;
	private Date[] availableDateArr;
	

}

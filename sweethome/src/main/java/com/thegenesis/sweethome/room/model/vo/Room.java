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
	
	// View 전용
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

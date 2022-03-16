package com.thegenesis.sweethome.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class HouseFile {

	private int fileNo;
	private int houseNo;
	private int roomNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	
}

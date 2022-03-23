package com.thegenesis.sweethome.common.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class dibs {
	private int userNo;//	USER_NO	NUMBER
	private int houseNo;//	HOUSE_NO	NUMBER
	private int interiorNo;//	INTERIOR_NO	NUMBER
	private String status;//	STATUS	VARCHAR2(1 BYTE)

}

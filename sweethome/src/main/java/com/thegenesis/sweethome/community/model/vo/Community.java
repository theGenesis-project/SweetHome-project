package com.thegenesis.sweethome.community.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Community {
	private int rownum;
	private int boardNo;//	BOARD_NO	NUMBER
	private int userNo;//	USER_NO	NUMBER
	private int categoryNo;//	CATEGORY_NO	NUMBER
	private int boardType;//	BOARD_TYPE	NUMBER
	private String boardTitle;//	BOARD_TITLE	VARCHAR2(100 BYTE)
	private int count;//	COUNT	NUMBER
	private Date createDate;//	CREATE_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	private String report;	//	REPORT	VARCHAR2(1 BYTE)

}

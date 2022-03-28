package com.thegenesis.sweethome.interior.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Interior {
	private int interiorNo;//	INTERIOR_NO	NUMBER
	private int inteCate;//	INTE_CATE	NUMBER
	private String interiorTitle;//	INTERIOR_TITLE	VARCHAR2(50 BYTE)
	private String interiorCo;//	INTERIOR_CO	VARCHAR2(50 BYTE)
	private int interiorPrice;//	INTERIOR_PRICE	NUMBER
	private int count;//	COUNT	NUMBER
	private String interiorDetail;//	INTERIOR_DETAIL	VARCHAR2(500 BYTE)
	private String sell;//	SELL	VARCHAR2(1000 BYTE)
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	private String interiorPost;
	
	private int rowNo;
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	
	// 가격 원으로 변경
	private String won;
}

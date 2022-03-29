package com.thegenesis.sweethome.interior.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Review {
		private int reviewNo;//	REVIEW_NO	NUMBER
		private int interiorNo;//	INTERIOR_NO	NUMBER
		private int userNo;//	USER_NO	NUMBER
		private String reviewContent;//	REVIEW_CONTENT	VARCHAR2(500 BYTE)
		private Date createDate;//	CREATE_DATE	DATE
		private Date modifyDate;//	MODITY_DATE	DATE
		private String status;//	STATUS	VARCHAR2(1 BYTE)
		private int reReview;//	REREVIEW	NUMBER
		private String report;//	REPORT	VARCHAR2(1 BYTE)
		
		private String userId;//USER_ID
}

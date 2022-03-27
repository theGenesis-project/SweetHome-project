package com.thegenesis.sweethome.interior.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Interior {
	private int interiorNo;
	private int inteCate;
	private String interiorTitle;
	private String interiorCo;
	private int interiorPrice;
	private int count;
	private String interiorDetail;
	private String sell;
	private String status;
	private String interiorPost;
	
	// 인테리어 사진
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int fileLevel;
	
	// 가격 원으로 변경
	private String won;
}

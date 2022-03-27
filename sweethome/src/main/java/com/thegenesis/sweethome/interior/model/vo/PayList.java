package com.thegenesis.sweethome.interior.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PayList {
	
	//private String imp_uid; //결제번호
	private String merchant_uid; //주문번호
	private String interiorTitle; 
	private int amount;
	private int userNo; 
	private String orderRe; 
	private String orderPhone;
	private String roadAddress;
	private String detailAddress;//ORDER_ADD2	VARCHAR2(300 BYTE)
	private String orderReQ;
	private int interiorNo;
	private int orderQuantity;
	private String postCode;//
	private int sumPrice;
	
	private String senderName;//	SENDER_NAME	VARCHAR2(100 BYTE)
	private String senderPhone;//	SENDER_PHONE	VARCHAR2(30 BYTE)
	private String senderEmail;//	SENDER_EMAIL	VARCHAR2(100 BYTE)
}

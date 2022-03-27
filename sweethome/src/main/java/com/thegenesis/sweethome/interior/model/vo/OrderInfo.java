package com.thegenesis.sweethome.interior.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class OrderInfo {
	private int orderNo;//	ORDER_NO	NUMBER
	private int userNo;//	USER_NO	NUMBER
	private String orderRe;//	ORDER_RE	VARCHAR2(50 BYTE)
	private String orderPhone;//	ORDER_PHONE	VARCHAR2(30 BYTE)
	private String orderAddress;//	ORDER_ADD	VARCHAR2(200 BYTE)
	private String orderReQ;//	ORDER_REQ	VARCHAR2(500 BYTE)
	private int orderStatus;//	ORDER_STATUS	NUMBER
	private int interiorNo;//	INTERIOR_NO	VARCHAR2(20 BYTE)
	private String orderNumber;//	ORDER_NUMBER	VARCHAR2(300 BYTE)
	private String postCode;//
	private Date orderDate;//	ORDER_DATE	DATE
	private int sumPrice;// SUMPRICE
}

package com.thegenesis.sweethome.interior.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Payment {
	
	private int paymentNo;//	PAYMENT_NO	NUMBER
	private int orderNo;//	ORDER_NO	NUMBER
	private int interiorNo;//	INTERIOR_NO	NUMBER
	private int orderQuantity;//	ORDER_QUANTITY	NUMBER
	private Date orderDate;//	ORDER_DATE	DATE

}

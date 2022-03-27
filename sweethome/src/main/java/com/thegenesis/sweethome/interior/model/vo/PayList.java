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
	private String address1;
	private String address2;
	private String orderReQ;
	private int interiorNo;
	private int orderQuantity;
	private String postCode;//
	private int sumPrice;
}

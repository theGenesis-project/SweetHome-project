package com.thegenesis.sweethome.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
	private String userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String gender;
	private String phone;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private String ownerNo;
	private String userType;
}

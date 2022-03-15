package com.thegenesis.sweethome.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo;//USER_NO	NUMBER
	private String userId;//USER_ID	VARCHAR2(30 BYTE)
	private String userPwd;//USER_PWD	VARCHAR2(100 BYTE)
	private String userName;//USER_NAME	VARCHAR2(30 BYTE)
	private String email;//EMAIL	VARCHAR2(100 BYTE)
	private String gender;//GENDER	VARCHAR2(1 BYTE)
	private String phone;//PHONE	VARCHAR2(30 BYTE)
	private Date enrollDate;//ENROLL_DATE	DATE
	private Date modifyDate;//MODIFY_DATE	DATE
	private String status;//STATUS	VARCHAR2(1 BYTE)
	private String ownerNo;//OWNER_NO	VARCHAR2(30 BYTE)
	private String userType;//USER_TYPE	VARCHAR2(1 BYTE)
	
	
	public Member() {
		super();
	}
	
	public Member(int userNo, String userId, String userPwd, String userName, String email, String gender, String phone,
			Date enrollDate, Date modifyDate, String status, String ownerNo, String userType) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.ownerNo = ownerNo;
		this.userType = userType;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOwnerNo() {
		return ownerNo;
	}

	public void setOwnerNo(String ownerNo) {
		this.ownerNo = ownerNo;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", gender=" + gender + ", phone=" + phone + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + ", ownerNo=" + ownerNo + ", userType="
				+ userType + "]";
	}
	
	
	
}

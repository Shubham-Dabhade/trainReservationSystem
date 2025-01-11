package com.model;

public class Member {

	private String userName;
	private String password;
	private String email;
	private long phoneNo;
	private String aadharNum;
	
	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public long getPhoneNo() {
		return phoneNo;
	}


	public void setPhoneNo(int phoneNo) {
		this.phoneNo = phoneNo;
	}


	public String getAadharNum() {
		return aadharNum;
	}


	public void setAadharNum(String aadharNum) {
		this.aadharNum = aadharNum;
	}


	public Member(String userName, String password, String email, long phoneNo, String aadharNum) {
		super();
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.phoneNo = phoneNo;
		this.aadharNum = aadharNum;
	}


	@Override
	public String toString() {
		return "Member [userName=" + userName + ", password=" + password + ", email=" + email + ", phoneNo=" + phoneNo
				+ ", aadharNum=" + aadharNum + "]";
	}
}

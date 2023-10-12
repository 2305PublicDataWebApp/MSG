package com.aug.spring.user.domain;

import java.sql.Timestamp;

public class User {
	private String userId;
	private String userPw;
	private String userName;
	private int userAge;
	private String userGender;
	private String userEmail;
	private String userAdd;
	private Timestamp userDate;
	private Timestamp updateDate;
	private String userYn;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String userId, String userPw, int userAge, String userGender, String userEmail,
			String userAdd) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userEmail = userEmail;
		this.userAdd = userAdd;
	
	}
	
	public User(String userId, String userPw, String userName, int userAge, String userGender, String userEmail,
			String userAdd) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userAge = userAge;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.userAdd = userAdd;
		
	}



	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAdd() {
		return userAdd;
	}
	public void setUserAdd(String userAdd) {
		this.userAdd = userAdd;
	}
	public Timestamp getUserDate() {
		return userDate;
	}
	public void setUserDate(Timestamp userDate) {
		this.userDate = userDate;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	public String getUserYn() {
		return userYn;
	}
	public void setUserYn(String userYn) {
		this.userYn = userYn;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userAge=" + userAge
				+ ", userGender=" + userGender + ", userEmail=" + userEmail + ", userAdd=" + userAdd + ", userDate="
				+ userDate + ", updateDate=" + updateDate + ", userYn=" + userYn + "]";
	}
	
	
	
}

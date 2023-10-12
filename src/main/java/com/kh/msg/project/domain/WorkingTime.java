package com.kh.msg.project.domain;

import java.sql.Timestamp;

public class WorkingTime {

	private String dateWithId;
	private int projectNo;
	private Timestamp startWork;
	private Timestamp endWork;
	private String userId;
	
	
	public String getDateWithId() {
		return dateWithId;
	}
	public void setDateWithId(String dateWithId) {
		this.dateWithId = dateWithId;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public Timestamp getStartWork() {
		return startWork;
	}
	public void setStartWork(Timestamp startWork) {
		this.startWork = startWork;
	}
	public Timestamp getEndWork() {
		return endWork;
	}
	public void setEndWork(Timestamp endWork) {
		this.endWork = endWork;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "근무시간 [날짜및아이디=" + dateWithId + ", 프로젝트명=" + projectNo + ", 출근=" + startWork
				+ ", 퇴근=" + endWork + ", 아이디=" + userId + "]";
	}
	
	
}

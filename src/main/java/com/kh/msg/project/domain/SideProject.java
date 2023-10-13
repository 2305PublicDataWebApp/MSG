package com.kh.msg.project.domain;

public class SideProject {

	private int sideProjectNo;
	private String sideProjectName;
	private int projectNo;
	
	public int getSideProjectNo() {
		return sideProjectNo;
	}
	public void setSideProjectNo(int sideProjectNo) {
		this.sideProjectNo = sideProjectNo;
	}
	public String getSideProjectName() {
		return sideProjectName;
	}
	public void setSideProjectName(String sideProjectName) {
		this.sideProjectName = sideProjectName;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	@Override
	public String toString() {
		return "사이드 프로젝트 [사이드프로젝트 번호=" + sideProjectNo + ", 사이드프로젝트 이름=" + sideProjectName + ", 프로젝트 번호="
				+ projectNo + "]";
	}
	
	
}

package com.kh.msg.project.domain;

import java.sql.Date;

public class Project {
	private int projectNo;
	private String projectName;
	private String projectCreater;
	private Date projectCreateDate;
	private String projectMember;
	
	
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectCreater() {
		return projectCreater;
	}
	public void setProjectCreater(String projectCreater) {
		this.projectCreater = projectCreater;
	}
	public Date getProjectCreateDate() {
		return projectCreateDate;
	}
	public void setProjectCreateDate(Date projectCreateDate) {
		this.projectCreateDate = projectCreateDate;
	}
	public String getProjectMember() {
		return projectMember;
	}
	public void setProjectMember(String projectMember) {
		this.projectMember = projectMember;
	}
	@Override
	public String toString() {
		return "Project [projectNo=" + projectNo + ", projectName=" + projectName + ", projectCreater=" + projectCreater
				+ ", projectCreateDate=" + projectCreateDate + ", projectMember=" + projectMember + "]";
	}
	
	
}

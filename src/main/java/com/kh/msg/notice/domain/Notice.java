package com.kh.msg.notice.domain;

import java.sql.Timestamp;

public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFileName;
	private String noticeFileRename;
	private String noticeFilePath;
	private long noticeFileLength;
	private Timestamp nCreateDate;
	private Timestamp nUpdateDate;
	private String userId;
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	
	
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeFileName() {
		return noticeFileName;
	}
	public void setNoticeFileName(String noticeFileName) {
		this.noticeFileName = noticeFileName;
	}
	public String getNoticeFileRename() {
		return noticeFileRename;
	}
	public void setNoticeFileRename(String noticeFileRename) {
		this.noticeFileRename = noticeFileRename;
	}
	public String getNoticeFilePath() {
		return noticeFilePath;
	}
	public void setNoticeFilePath(String noticeFilePath) {
		this.noticeFilePath = noticeFilePath;
	}
	public long getNoticeFileLength() {
		return noticeFileLength;
	}
	public void setNoticeFileLength(long noticeFileLength) {
		this.noticeFileLength = noticeFileLength;
	}
	public Timestamp getnCreateDate() {
		return nCreateDate;
	}
	public void setnCreateDate(Timestamp nCreateDate) {
		this.nCreateDate = nCreateDate;
	}
	public Timestamp getnUpdateDate() {
		return nUpdateDate;
	}
	public void setnUpdateDate(Timestamp nUpdateDate) {
		this.nUpdateDate = nUpdateDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "공지사항 [공지번호=" + noticeNo
				+ "공지제목=" + noticeTitle + ", 공지내용=" + noticeContent
				+ ", 파일이름=" + noticeFileName + ", 파일리네임=" + noticeFileRename + ", 파일경로="
				+ noticeFilePath + ", 파일길이=" + noticeFileLength + ", 작성일=" + nCreateDate
				+ ", 수정일=" + nUpdateDate + ", 유저아이디=" + userId + "]";
	}
	
	
}

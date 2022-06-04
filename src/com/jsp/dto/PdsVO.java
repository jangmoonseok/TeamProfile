package com.jsp.dto;

import java.util.Date;
import java.util.List;

public class PdsVO {

	private int pno;
	private String title;
	private String content;
	private String writer;
	private int viewcnt;
	private Date regDate;
	private Date updatedate;
	private int important;
	private List<PFileVO> pfileList;
	
	public int getImportant() {
		return important;
	}

	public void setImportant(int important) {
		this.important = important;
	}


	public List<PFileVO> getPfileList() {
		return pfileList;
	}

	public void setPfileList(List<PFileVO> pfileList) {
		this.pfileList = pfileList;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	
}

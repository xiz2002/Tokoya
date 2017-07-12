package com.nurinubi.tokoya.board.service.impl;

import java.io.Serializable;
import java.util.Date;

/**
* @Class Name : MainVO.java.java
* @Description :  MainVO.java Class
* @Modification Information
* @ 
* @	修正日			修正者		修正内容
* @ 	---------		---------		-------------------------------
* @ 	2017.07.12		Kim		最初作成
* 
* @author Kim
* @since 2017.07.12
* @version 0.1
*
*  Copyright (C) by NuriNubi All right reserved.
*/
public class BoardVO implements Serializable {

	private static final long serialVersionUID = -8274004534207618049L;

	private String noticeId;
	private String noticeTitle;
	private String noticeBody;
	private Date registerDate;
	
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeBody() {
		return noticeBody;
	}
	public void setNoticeBody(String noticeBody) {
		this.noticeBody = noticeBody;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void Date(Date registerDate) {
		this.registerDate = registerDate;
	}
}

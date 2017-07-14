package com.nurinubi.tokoya.board.domain;

import java.util.Date;

/**
<!--
 * 
 * @ClassName : SampleVO.java
 * @Description : 
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017. 7. 13.		Kim			最初作成
 * 
 * @author Kim
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
 */

public class BoardVO {
	
	private int noticeId;
	private String noticeTitle;
	private String noticeBody;
	private Date registerDate;
	
	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
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

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("boardVo [noticeId=");
		builder.append(noticeId);
		builder.append(", noticeTitle=");
		builder.append(noticeTitle);
		builder.append(", noticeBody=");
		builder.append(noticeBody);
		builder.append(", registerDate=");
		builder.append(registerDate);
		return builder.toString();
	}

}

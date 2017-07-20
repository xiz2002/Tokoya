package com.nurinubi.tokoya.user.domain;

import java.io.Serializable;

/**
<!--
 * 
 * @ClassName : SampleVO.java
 * @Description : 
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017. 07. 13.	山木雄矢			最初作成
 * 		2017. 07. 20. 	Lee				userStatus, userIsAdmin, Serializable 追加
 * 
 * @author 山木雄矢
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
 */

public class UserVO implements Serializable {
	
	private static final long serialVersionUID = -4399181419872094995L;
	
	private String userId;
	private String userPass;
	private String userName;
	private String userHuri;
	private String userEmail;
	private String userPhone;
	private String userStatus;
	private String userIsAdmin;
	
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	/**
	 * @return the userPassword
	 */
	public String getUserPass() {
		return userPass;
	}
	
	/**
	 * @param userPassword the userPassword to set
	 */
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the userHuri
	 */
	public String getUserHuri() {
		return userHuri;
	}
	/**
	 * @param userHuri the userHuri to set
	 */
	public void setUserHuri(String userHuri) {
		this.userHuri = userHuri;
	}
	/**
	 * @return the userEmail
	 */
	public String getUserEmail() {
		return userEmail;
	}
	/**
	 * @param userEmail the userEmail to set
	 */
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	/**
	 * @return the userPhone
	 */
	public String getUserPhone() {
		return userPhone;
	}
	/**
	 * @param userPhone the userPhone to set
	 */
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	/**
	 * @return the userStatus
	 */
	public String getUserStatus() {
		return userStatus;
	}

	/**
	 * @param userStatus the userStatus to set
	 */
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	/**
	 * @return the userIsAdmin
	 */
	public String getUserIsAdmin() {
		return userIsAdmin;
	}

	/**
	 * @param userIsAdmin the userIsAdmin to set
	 */
	public void setUserIsAdmin(String userIsAdmin) {
		this.userIsAdmin = userIsAdmin;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserVO [userId=");
		builder.append(userId);
		builder.append(", userPass=");
		builder.append(userPass);
		builder.append(", userName=");
		builder.append(userName);
		builder.append(", userHuri=");
		builder.append(userHuri);
		builder.append(", userEmail=");
		builder.append(userEmail);
		builder.append(", userPhone=");
		builder.append(userPhone);
		builder.append(", userStatus=");
		builder.append(userStatus);
		builder.append(", userIsAdmin=");
		builder.append(userIsAdmin);
		builder.append("]");
		return builder.toString();
	}

}

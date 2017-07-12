package com.nurinubi.tokoya.login;

/**
 * @Class Name : LoginForm.java
 * @Description : s
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		山木雄矢		最初作成
 * 
 * @author 山木雄矢
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
*/
public class LoginForm {
	
	private String UserId;
	private String UserPass;
	private String UserName;
	private String UserEmail;
	private int UserPhone;
	
	/*各種ゲッター、セッターの生成*/
	public String getUserID(){
		return UserId;
	}
	
	public void setUserID(String UserId){
		this.UserId = UserId;
	}
	
	public String getUserPass(){
		return UserPass;
	}
	
	public void serUserPass(String UserPass){
		this.UserPass = UserPass;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String UserName) {
		this.UserName = UserName;
	}
	
	public String getUserEmail() {
		return UserEmail;
	}

	public void setUserEmail(String UserEmail) {
		this.UserEmail = UserEmail;
	}
	public int getUserPhone() {
		return UserPhone;
	}

	public void setUserPhone(int UserPhone) {
		UserPhone = UserPhone;
	}
}

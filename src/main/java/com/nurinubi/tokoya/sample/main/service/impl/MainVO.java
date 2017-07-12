package com.nurinubi.tokoya.sample.main.service.impl;

import java.io.Serializable;

/**
* @Class Name : MainVO.java.java
* @Description :  MainVO.java Class
* @Modification Information
* @ 
* @	修正日			修正者		修正内容
* @ 	---------		---------		-------------------------------
* @ 	2016.10.04		李多浩		最初作成
* 
* @author 李　多　浩
* @since 2017.07.12
* @version 0.1
*
*  Copyright (C) by NuriNubi All right reserved.
*/
public class MainVO implements Serializable {

	private static final long serialVersionUID = -8274004534207618049L;

	private String id;
	private String password;
	private String encpassword;

	public String getid() {
		return id;
	}

	public void setid(String id) {
		this.id = id;
	}

	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password = password;
	}

	public String getEncpassword() {
		return encpassword;
	}

	public void setEncpassword(String encpassword) {
		this.encpassword = encpassword;
	}
}

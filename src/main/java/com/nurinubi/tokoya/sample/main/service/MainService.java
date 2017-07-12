package com.nurinubi.tokoya.sample.main.service;

import java.util.Map;

/**
* @Class Name : MainService.java.java
* @Description :  MainService.java Interface
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
public interface MainService {
	
	int mainView(Map<String, Object> commandMap) throws Exception;
	
}

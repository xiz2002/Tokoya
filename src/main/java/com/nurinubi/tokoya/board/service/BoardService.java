package com.nurinubi.tokoya.board.service;

import java.util.Map;

/**
* @Class Name : MainService.java.java
* @Description :  MainService.java Interface
* @Modification Information
* @ 
* @	修正日			修正者		修正内容
* @ 	---------		---------		-------------------------------
* @ 	2016.10.04		Kim		最初作成
* 
* @author Kim
* @since 2017.07.12
* @version 0.1
*
*  Copyright (C) by NuriNubi All right reserved.
*/
public interface BoardService {
	
	int mainView(Map<String, Object> commandMap) throws Exception;
	
}

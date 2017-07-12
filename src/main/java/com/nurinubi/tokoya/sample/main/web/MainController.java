package com.nurinubi.tokoya.sample.main.web;

import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.nurinubi.tokoya.sample.main.service.MainService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
* @Class Name : MainController.java.java
* @Description :  MainController.java Class
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

//@Controller
//public class MainController {
//	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
//
//	/** MainService */
//	@Resource(name = "mainService")
//	private MainService mainService;
//	
//	@RequestMapping(value = "/")
//	public String mainView(Model model, @RequestParam Map<String,Object> commandMap) throws Exception {
//		System.out.println("MainController");
//		System.out.println(commandMap);
//		return "sample/index";
//	}
//}

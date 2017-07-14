package com.nurinubi.tokoya.admin.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nurinubi.tokoya.admin.repository.AdminRepository;

/**
* @Class Name : AdminController.java.java
* @Description :  BoardController.java Class
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

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	/** WriteService */
	@Autowired
	private AdminRepository adminRepository;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminHome(Map<String, Object> cmdMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/admin");
		List<Map<String, Object>> result = adminRepository.getReservationListByStylist(cmdMap);
		mv.addObject("result", result);
		return mv;
	}
	
	@RequestMapping(value = "/admin/stylist/add", method = RequestMethod.GET)
	public String addStylist() {
		
		//表示するページ設定
		return "/admin/stylist/addStylist";
	}
	
	@RequestMapping(value = "/admin/stylist/management", method = RequestMethod.GET)
	public String management() {
		
		//表示するページ設定
		return "/admin/stylist/management";
	}
}

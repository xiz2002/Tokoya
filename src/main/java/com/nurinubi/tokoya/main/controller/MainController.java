package com.nurinubi.tokoya.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.board.repository.BoardRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @ClassName	: MainController.java
 * @Description	: MainController.java Class
 * @Modification Information
 * 
 * 	修正日		修正者	修正内容 
 * --------- --------- ------------------------------- 
 *	2017.07.12 	Kim 		最初作成
 * 	2017.07.20	Lee		フォルター移動　user -> main
 * 
 * @author Kim
 * @since 2017.07.12
 * @version 0.1
 *
 * Copyright (C) by NuriNubi All right reserved.
 */

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	private BoardRepository boardRepository;
	
	/**
	 * Call MainView
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("result", boardRepository.getBoardList());
		System.out.println(model);
		return "main/home";
	}
}

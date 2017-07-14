package com.nurinubi.tokoya.user.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nurinubi.tokoya.sample.repository.SampleRepository;
import com.nurinubi.tokoya.user.domain.UserVO;
import com.nurinubi.tokoya.user.repository.UserRepository;

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
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	

	
	/** WriteService */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/user/home";
	}
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() throws Exception {
		
		return "/user/register";
	}
	
	/**
	 * ログイン画面初期
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		//
		logger.info("login");
		
		//表示するページ設定
		return "user/login";
	}
	
	/**
	 * ログイン
	 * @param username
	 * @param userpass
	 * @param model
	 * @return　
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET, params = "login")
	public String Loginaction(){
		logger.info("Loginaction");
        
		//List<UserVO> find = UserRepository.findOne(username, userpass);
        /*@RequestParam("username") String username,
							  @RequestParam("userpass") String userpass, Model model
         */
		//System.out.println(model);
		return "user/login";
		/*
		if(){
		
			//管理者ページ
			return "admin/admin";
		
		}else if(){
			
			//ユーザーページ
			return "user/home";
		}else{
			
			//ログインページ
			return "user/login";
		}*/
	}
	
	/**
	 * キャンセル
	 * @return　ホーム画面遷移
	 */
	@RequestMapping(value = "/login2", method = RequestMethod.GET, params = "cancel")
	public String Canselaction(){
		logger.info("Canselaction");
		return "user/home";
	}
	
	/**
	 * 新規登録
	 * @return　新規登録画面遷移
	 */
	@RequestMapping(value = "/login2", method = RequestMethod.GET, params = "newmenber")
	public String Newmenberaction(){
		logger.info("Newmenberaction");
		return "user/register";
	}
}

package com.nurinubi.tokoya.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nurinubi.tokoya.common.CommandMap;
import com.nurinubi.tokoya.user.repository.UserRepository;
import com.nurinubi.tokoya.board.repository.BoardRepository;
/**
 * @Class Name : AdminController.java.java
 * @Description : BoardController.java Class
 * @Modification Information
 * @ @ 修正日 修正者 修正内容 @ --------- --------- ------------------------------- @
 *   2017.07.12 Kim 最初作成
 * 
 * @author Kim
 * @since 2017.07.12
 * @version 0.1
 *
 *          Copyright (C) by NuriNubi All right reserved.
 */

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	/** WriteService */
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BoardRepository boardRepository;

	/** WriteService */
	@RequestMapping(value = "/home", method = {RequestMethod.POST, RequestMethod.GET})
	public String home(Model model) {
		model.addAttribute("result", boardRepository.getBoardList());
		System.out.println(model);
		return "user/home";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm() throws Exception {
		return "/user/register";
	}

	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(CommandMap cmdMap) throws Exception {
		logger.info("会員登録処理");
		userRepository.insertUser(cmdMap.getMap());
		return "redirect:/login";
	}

	/**
	 * ログイン画面初期
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.info("login");
		// 表示するページ設定
		return "/user/login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView Loginaction(@RequestParam String id, @RequestParam String pass) throws Exception {
		
		String result = "error";
		result = userRepository.login(id, pass, "step1");
		if(result.equals("1"))
		{
			result="user";
		} else if(result.equals("0")){
			result = userRepository.login(id, pass, "step2");
			if(result.equals("1")) {
				result="admin";
			}else if(result.equals("0")) {
				result="new";
			}
		}
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("data", result);
		mav.addObject("id", id);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public ModelAndView checkId(@RequestParam String id) {
		ModelAndView mav = new ModelAndView(); 
		String result = "error";
		result = userRepository.checkId(id);
		if(result.equals("0")) {
			result = "true";
		}else if(result.equals("1")){
			result = "false";
		}
		mav.addObject("result", result);
		mav.setViewName("jsonView");
		return mav;
	}
}

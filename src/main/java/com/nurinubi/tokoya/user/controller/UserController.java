package com.nurinubi.tokoya.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.common.domain.CommandMap;
import com.nurinubi.tokoya.user.domain.UserVO;
import com.nurinubi.tokoya.user.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ClassName : UserController.java
 * @Description : UserController Class
 * @Modification Information
 * 
 * 	修正日		修正者		修正内容
 * ---------		---------	-------------------------------
 * 2017.07.12	Kim			最初作成
 * 2017.07.20	Lee			Home -> MainContorllerに移動
 * 2017.07.21	Lee			Logout Add
 * 
 * @author Kim
 * @since 2017.07.12
 * @version 0.1
 *
 * Copyright (C) by NuriNubi All right reserved.
 */

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	/** WriteService */
	@Autowired
	private UserRepository userRepository;

	/** 会員登録 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm() throws Exception {
		return "/user/register";
	}
	
	/** 会員登録アイディ確認 */
	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public ModelAndView checkId(@RequestParam String id) throws Exception {
		ModelAndView mav = new ModelAndView();
		String result = "error";
		result = userRepository.checkId(id);
		if (result.equals("0")) {
			if (result.equals("0")) {
				result = "true";
			} else if (result.equals("1")) {
				result = "false";
			}
			mav.addObject("result", result);
			mav.setViewName("jsonView");
		}
		return mav;
	}
	
	/** 会員登録実行 */
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(CommandMap cmdMap) throws Exception {
		logger.debug("会員登録処理");
		userRepository.insertUser(cmdMap.getMap());
		return "redirect:/login";
	}

	/** ログイン画面 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		logger.debug("login");
		// 表示するページ設定
		return "/user/login";
	}

	/** ログイン処理 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginAction(@RequestParam String id, @RequestParam String pass, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, String> result = userRepository.loginUserCheck(id, pass);

		logger.debug(result.toString());
		logger.debug(result.get("result"));
		switch (result.get("result")) {
		// ユーザーがある場合
			case "1":
				logger.debug("success");
				UserVO userInfo = userRepository.loginUserInfo(id);
				logger.debug("userInfo : " + userInfo.toString());
				HttpSession session = request.getSession(true);
				session.setAttribute("userInfo", userInfo);
				mav.addObject("loginTF", true);
				logger.debug("session : " + session.toString());
				logger.debug("mav : " + mav.toString());
				break;
			// ユーザーがない場合
			default:
				mav.addObject("loginTF", false);
				logger.debug(mav.toString());
				break;
		}
		mav.setViewName("jsonView");
		return mav;
	}
	
	/** ログアウト処理 */
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String loginOutAction(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
}

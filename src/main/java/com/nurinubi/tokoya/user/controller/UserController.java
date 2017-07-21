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

import com.nurinubi.tokoya.common.domain.CommandMap;
import com.nurinubi.tokoya.user.repository.UserRepository;
import com.nurinubi.tokoya.board.repository.BoardRepository;

/**
 * @ClassName : UserController.java
 * @Description : UserController Class
 * @Modification Information
 * 
 *               修正日 修正者 修正内容 --------- ---------
 *               ------------------------------- 2017.07.12 Kim 最初作成 2017.07.20
 *               Lee Home -> MainContorllerに移動
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
	public ModelAndView loginAction(@RequestParam String id, @RequestParam String pass, HttpServletRequest request)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, String> result = userRepository.loginUserCheck(id, pass);

		logger.info(result.toString());
		logger.info(result.get("result"));
		switch (result.get("result")) {
		// ユーザーがある場合
		case "1":
			logger.info("success");
			UserVO userInfo = userRepository.loginUserInfo(id);
			logger.info("userInfo : " + userInfo.toString());
			HttpSession session = request.getSession(true);
			session.setAttribute("userInfo", userInfo);
			// メッソードの引数は 秒 で、「クライアントから20分の間に要請がなければ削除する」の意味
			session.setMaxInactiveInterval(20 * 60);
			mav.addObject("loginTF", true);
			logger.info("session : " + session.toString());
			logger.info("mav : " + mav.toString());
			break;
		// ユーザーがない場合
		default:
			mav.addObject("loginTF", false);
			logger.info(mav.toString());
			break;
		}
		mav.setViewName("jsonView");
		return mav;

		// result = userRepository.login(id, pass, "step1");
		// if (result.equals("1")) {
		// result = "user";
		// } else if (result.equals("0")) {
		// result = userRepository.login(id, pass, "step2");
		// if (result.equals("1")) {
		// result = "admin";
		// } else if (result.equals("0")) {
		// result = "new";
		// }
		// }
		// ModelAndView mav = new ModelAndView();
		// mav.addObject("data", result);
		// mav.addObject("id", id);
		// HttpSession session = request.getSession(true);
		// session.setAttribute("member", );
		//
		// mav.setViewName("jsonView");
		// return mav;
	}

	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public ModelAndView checkId(@RequestParam String id) throws Exception {
		ModelAndView mav = new ModelAndView();
		String result = "error";
		result = userRepository.checkId(id);
		if (result.equals("0")) {
			System.out.println("==============" + result);
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
}

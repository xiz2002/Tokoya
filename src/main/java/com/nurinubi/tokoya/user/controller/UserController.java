package com.nurinubi.tokoya.user.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.nurinubi.tokoya.common.CommandMap;
import com.nurinubi.tokoya.user.domain.UserVO;
import com.nurinubi.tokoya.user.repository.UserRepository;
import com.nurinubi.tokoya.board.repository.BoardRepository;
import com.nurinubi.tokoya.user.domain.UserVO;
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
		return "redirect:/home";
	}

	/**
	 * ログイン画面初期
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login() {
		logger.info("login");
		// 表示するページ設定
		return "/user/login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView Loginaction(CommandMap cmdMap, Model model) throws Exception {
		String paramId = cmdMap.get("USERID").toString();
		String paramPass = cmdMap.get("USERPASS").toString();
		List<UserVO> result = userRepository.login(cmdMap.getMap());
		if (result.size() != 0) {
				ModelAndView mv = new ModelAndView();
				mv.addObject("check", 2);
				mv.addObject("loginId", result.get(0).getUserId());
				//model.addAttribute("check", "2");
				//model.addAttribute("loginId", result.get(0).getUserId());
				RedirectView rv = new RedirectView("/home");
				rv.setExposeModelAttributes(false);
				mv.setView(rv);
				return mv;
		}
		if (result.size() == 0&&paramId.equals("admin")&&paramPass.equals("p@ssw0rd")) {
			model.addAttribute("ckeck", 1);
			model.addAttribute("loginId", "admin");
			RedirectView rv = new RedirectView("/admin");
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		}else {
			RedirectView rv = new RedirectView("/register");
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
		} 
	}
	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public ModelAndView checkId(@RequestParam String id) {
		ModelAndView mav = new ModelAndView(); 
		List<UserVO> result = userRepository.checkId(id);
		if(result.size()==0) {
			mav.addObject("result", "true");
		}else {
			mav.addObject("result", "false");
		}
		mav.setViewName("jsonView");
		return mav;
	}
}

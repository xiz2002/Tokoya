package com.nurinubi.tokoya.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.user.domain.UserVO;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
<!--
 * 
 * @ClassName : LoginInterceptor.java
 * @Description : LoginInterceptor Class
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017. 7. 20.		李　多　浩			最初作成
 * 
 * @author 李　多　浩
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
 */

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AdminCheckInterceptor.class);

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.debug("====================================LoginInterceptor================================");

		HttpSession session = request.getSession(false);

		// ログイン情報のセッションの値がヌルの場合
		if (session == null) {
			//ログインページにリダイレクト
			response.sendRedirect(request.getContextPath() + "/login");
			logger.debug("====================================NotSession================================");
			return false;
		}

		//ログイン情報のセッションの値がヌルがない場合
		UserVO userInfo = (UserVO) session.getAttribute("userInfo");
		logger.debug("SessionAttribute : " + session.getAttribute("userInfo"));
		if (userInfo == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			logger.debug("====================================UserInfoIsNull================================");
			return false;
		}

		return true;
	}

	public boolean postHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		return true;
	}
}

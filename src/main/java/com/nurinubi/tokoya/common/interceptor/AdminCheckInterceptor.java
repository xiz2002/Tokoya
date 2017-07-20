package com.nurinubi.tokoya.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.user.domain.UserVO;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminCheckInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("====================================AdminCheckInterceptorStart================================");
		HttpSession session = request.getSession(false);
		
		// ログイン情報のセッションの値がヌルの場合
		if(session == null) {
			//ログインページにリダイレクト
			response.sendRedirect(request.getContextPath() + "/");
			logger.info("====================================NotSession================================");
			return false;
		}
		
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		logger.info("SessionAttribute : "+ session.getAttribute("userInfo"));
		
		//ログイン情報のセッションの値がヌルがない場合		
		if(userInfo == null) {
			response.sendRedirect(request.getContextPath() + "/");
			logger.info("====================================UserInfoIsNull================================");
			return false;
		}
		
		//接近者が管理者がない場合
		if(userInfo.getUserIsAdmin() != "1") {
			response.sendRedirect(request.getContextPath() + "/");
			logger.info("====================================NotAdmin================================");
			return false;
		}
		logger.info("====================================AdminCheckInterceptorEnd================================");
		return true;
	}
	
	public boolean postHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		return true;
	}
}

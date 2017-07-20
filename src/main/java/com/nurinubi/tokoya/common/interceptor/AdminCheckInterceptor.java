package com.nurinubi.tokoya.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nurinubi.tokoya.user.domain.UserVO;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession(false);
		
		// ログイン情報のセッションの値がヌルの場合
		if(session == null) {
			//ログインページにリダイレクト
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		//ログイン情報のセッションの値がヌルがない場合
		UserVO userInfo = (UserVO)session.getAttribute("userInfo");
		
		if(userInfo == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		//接近者が管理者がない場合
		if(userInfo.getUserIsAdmin() == "0") {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		return true;
	}
	
	public boolean postHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		return true;
	}
}

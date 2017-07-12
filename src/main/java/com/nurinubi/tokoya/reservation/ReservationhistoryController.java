package com.nurinubi.tokoya.reservation;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nurinubi.tokoya.login.LoginController;

/**
 * @Class Name : LoginController.java
 * @Description : s
 * @
 * @	修正日			修正者		修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017.07.12		山木雄矢		最初作成
 * 
 * @author 山木雄矢
 * @since 2017.07.12
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
*/

@Controller
public class ReservationhistoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationhistoryController.class);
	
	//URL設定
	@RequestMapping(value = "/reservationhistory", method = RequestMethod.GET)
	public String login() {
		logger.info("Welcome home! The client locale is {}.");
		
		//表示するページ設定
		return "reservation/reservationhistory";
	}
}


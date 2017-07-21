package com.nurinubi.tokoya.reservation.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.reservation.domain.ReservationVO;
import com.nurinubi.tokoya.reservation.repository.ReservationRepository;
import com.nurinubi.tokoya.user.domain.UserVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
* @ClassName : ReservationController.java
* @Description :  RaservationController Class
* @Modification Information
* @ 
* @	修正日			修正者			修正内容
* @ 	---------		---------		-------------------------------
* @ 	2017.07.13		Kim				最初作成
* @ 2017.07.16		Lee				/reservation/getStaff追加
* 
* @author Kim
* @since 2017.07.13
* @version 0.1
*
*  Copyright (C) by NuriNubi All right reserved.
*/

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationRepository ReservationRepository;
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	/** コース選択*/
	@RequestMapping(value = "/reservation/course", method = RequestMethod.GET)
	public String revCourseView(Model model) throws Exception {
		logger.debug("======================================courseControllerStart===================================");
		model.addAttribute("list", ReservationRepository.getCourseList());
		logger.debug("======================================courseControllerEnd=====================================");
		return "/reservation/course";
	}
	
	/** 予約画面 */
	@RequestMapping(value = "/reservation/date", method = RequestMethod.POST)
	public ModelAndView revDateView(@ModelAttribute("ReservationVO") ReservationVO rDomain, UserVO userInfo, HttpSession session) throws Exception {
		logger.debug("======================================dateControllerStart===================================");
		ModelAndView mav = new ModelAndView();
		userInfo = (UserVO) session.getAttribute("userInfo");
		String returnUrl = "reservation/date";
		
		if(userInfo.getUserId().equals(rDomain.getUserId())) {
			mav.addObject("result",rDomain);
		} else {
			rDomain.setUserId(userInfo.getUserId());
		}
		
		mav.setViewName(returnUrl);
		logger.debug("======================================dateControllerEnd=====================================");			
		return mav; 
	}
	
	/** Jsonで要請した情報を検索 */
	@RequestMapping(value = "/reservation/getStaffList", method = RequestMethod.POST)
	public ModelAndView getStaffList(@RequestParam Map<String, Object> commandMap) throws Exception {	
		logger.debug("====================================getStaffListControllerStart====================================");
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("list", ReservationRepository.getStaffList(commandMap));
		mav.setViewName("jsonView"); // setViewNameに入るパラメーターは JsonView bean にあるアイディと同一
		logger.debug("======================================getStaffListControllerEnd=====================================");
		return mav;
	}
	
	/** 確認画面 */
	@RequestMapping(value = "/reservation/check", method = RequestMethod.POST)
	public ModelAndView revCheckView(@ModelAttribute("ReservationVO") ReservationVO rDomain, UserVO userInfo, HttpSession session) throws Exception {
		logger.debug("======================================revCheckViewControllerStart===================================");
		userInfo = (UserVO) session.getAttribute("userInfo");
		ModelAndView mav = new ModelAndView();
		
		if(!userInfo.getUserId().equals(rDomain.getUserId())) {
			rDomain.setUserId(userInfo.getUserId());
		}
		
		mav.setViewName("reservation/check");
		mav.addObject("result", ReservationRepository.getCheckInfo(rDomain));
		logger.debug("======================================revCheckViewControllerEnd=====================================");
		return mav;
	}
	
	/** 予約確定 */
	@RequestMapping(value = "/reservation/checkout", method = RequestMethod.POST)
	public ModelAndView revCheckOutView(@ModelAttribute("ReservationVO") ReservationVO rDomain, UserVO userInfo, HttpSession session) throws Exception {
		logger.debug("==================================revCheckOutViewControllerStart===================================");
		ModelAndView mav = new ModelAndView();
		userInfo = (UserVO) session.getAttribute("userInfo");

		if(!userInfo.getUserId().equals(rDomain.getUserId())) {
			rDomain.setUserId(userInfo.getUserId());
		}
		
		mav.addObject("rtn", ReservationRepository.setReserve(rDomain));
		mav.setViewName("jsonView");
		logger.debug("===================================revCheckOutViewControllerEnd====================================");
		return mav;
	}
	
	/** 予約履歴　*/
	@RequestMapping(value = "/reservation/userHistory", method = RequestMethod.GET)
	public ModelAndView revHistoryView(@ModelAttribute("ReservationVO") ReservationVO rDomain, UserVO userInfo, HttpSession session) throws Exception {	
		logger.debug("======================================revHistoryViewStart===================================");
		ModelAndView mav = new ModelAndView();
		userInfo = (UserVO) session.getAttribute("userInfo");
		
		if(!userInfo.getUserId().equals(rDomain.getUserId())) {
			rDomain.setUserId(userInfo.getUserId());
		}
		
		mav.addObject("rtn", ReservationRepository.getReserveHistory(rDomain));
		mav.setViewName("reservation/userHistory");
		logger.debug("======================================revHistoryViewEnd=====================================");
		return mav;
	}
	
	@RequestMapping(value = "/reservation/userCancel", method = RequestMethod.POST)
	public ModelAndView revCancel(@ModelAttribute("ReservationVO") ReservationVO rDomain,UserVO userInfo, HttpSession session) throws Exception {	
		logger.debug("======================================revCancelStart===================================");
		ModelAndView mav = new ModelAndView();
		userInfo = (UserVO) session.getAttribute("userInfo");
		
		if(!userInfo.getUserId().equals(rDomain.getUserId())) {
			rDomain.setUserId(userInfo.getUserId());
		}
		
		mav.addObject("rtn", ReservationRepository.setReserveCancel(rDomain));
		mav.setViewName("redirect:/reservation/userHistory");
		logger.debug("======================================revCancelEnd=====================================");
		return mav;
	}
	
}
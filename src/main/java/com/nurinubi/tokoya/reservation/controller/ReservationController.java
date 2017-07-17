package com.nurinubi.tokoya.reservation.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.reservation.domain.ReservationVO;
import com.nurinubi.tokoya.reservation.repository.ReservationRepository;

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
	public String course(Model model) throws Exception {
		logger.info("======================================courseControllerStart===================================");
		model.addAttribute("list", ReservationRepository.getCourseList());
		logger.info("======================================courseControllerEnd=====================================");
		return "/reservation/course";
	}
	
	/** 予約画面 */
	@RequestMapping(value = "/reservation/date", method = RequestMethod.POST)
	public ModelAndView date(@ModelAttribute("ReservationVO") ReservationVO rDomain) throws Exception {
		logger.info("======================================dateControllerStart===================================");
		logger.info("cid : " + rDomain);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reservation/date");
		mav.addObject("result",rDomain);
		logger.info("======================================dateControllerEnd=====================================");
		return mav; 
	}
	
	/** Jsonで要請した情報を検索 */
	@RequestMapping(value = "/reservation/getStaffList", method = RequestMethod.POST)
	public ModelAndView getStaffList(@RequestParam Map<String, Object> commandMap) throws Exception {	
		logger.info("======================================getStaffListControllerStart===================================");
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("list", ReservationRepository.getStaffList(commandMap));
		mav.setViewName("jsonView");
		logger.info("======================================getStaffListControllerEnd=====================================");
//		List<String> list = new ArrayList<String>();
//		list.add("OBJECT");
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("job", "developer");
//		mv.addObject("obj1", list); 
//		mv.addObject("obj2", map);
//		Keypoint ! setViewName에 들어갈 String 파라미터는 JsonView bean 설정해줬던 id와 같아야 한다.
		return mav;
	}
	
	/** 確認画面 */
	@RequestMapping(value = "/reservation/check", method = RequestMethod.POST)
	public ModelAndView check(@ModelAttribute("ReservationVO") ReservationVO rDomain) throws Exception {
		logger.info("======================================checkControllerStart===================================");
		logger.info(rDomain.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", ReservationRepository.getCheckInfo(rDomain));
		mav.setViewName("reservation/check");
		logger.info("======================================checkControllerEnd=====================================");
		return mav;
	}
	
	/** 予約確定 */
	@RequestMapping(value = "/reservation/checkout", method = RequestMethod.POST)
	public ModelAndView checkout(@ModelAttribute("ReservationVO") ReservationVO rDomain) throws Exception {
		logger.info("======================================checkoutControllerStart===================================");
		logger.info(rDomain.toString());
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("rtn", ReservationRepository.setReserve(rDomain));
		mav.setViewName("jsonView");
		logger.info("======================================checkoutControllerEnd=====================================");
		return mav;
	}
	
	/** */
	@RequestMapping(value = "/reservation/history", method = RequestMethod.GET)
	public String history() {
		logger.info("Welcome home! The client locale is {}.");
		//表示するページ設定
		return "/reservation/history";
	}	
}
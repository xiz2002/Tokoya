package com.nurinubi.tokoya.admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.admin.repository.AdminRepository;
import com.nurinubi.tokoya.common.domain.CommandMap;
import com.nurinubi.tokoya.reservation.repository.ReservationRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.nurinubi.tokoya.admin.domain.ScheduleVO;
import com.nurinubi.tokoya.admin.domain.StylistVO;

/**
* @Class Name : AdminController.java.java
* @Description :  BoardController.java Class
* @Modification Information
* @ 
* @	修正日			修正者			修正内容
* @ 	---------		---------		-------------------------------
* @ 	2017.07.12		Kim				最初作成
* @         17		Lee				getStylistForVacation 追加 
* @author Kim
* @since 2017.07.12
* @version 0.1
*
*  Copyright (C) by NuriNubi All right reserved.
*/

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	public String time[]= {"09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00"};
	public String month[]= {"01月", "02月", "03月", "04月", "05月", "06月", "07月", "08月", "09月", "10月", "11月", "12月"};
	/** WriteService */
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminHome(Model model) throws Exception {
		List<Map<String, Object>> reservation = reservationRepository.getReservationListByToday();
		model.addAttribute("reservation", reservation);
		model.addAttribute("stylist", adminRepository.getStylistList());
		model.addAttribute("time", time);
		return "admin/admin";
	}
	
	@RequestMapping(value = "/searchReservation.do", method = RequestMethod.POST)
	public ModelAndView serchReservation(@RequestParam String param) throws Exception {
		System.out.println("------------------test----------------");
		System.out.println(param);
		ModelAndView mav = new ModelAndView(); 
		Date date = new Date();
		DateFormat frm = new SimpleDateFormat("yyyy/MM/dd");
		date = frm.parse(param);
		mav.addObject("reservation", reservationRepository.getReservationByDate(date));
		mav.addObject("stylist", adminRepository.getStylistList());
		mav.addObject("time", time);
		mav.setViewName("jsonView");
		System.out.println(mav);
		return mav;
	}
	/**
	 * スタイリスト追加画面：デフォルト
	 * @return
	 */
	@RequestMapping(value = "/admin/stylist/add", method = RequestMethod.GET)
	public String addStylist() {
		//表示するページ設定
		System.out.println("=====================");
		return "admin/stylist/addStylist";
	}
	
	/**
	 * スタイリスト管理画面：デフォルト
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/admin/stylist/management", method = RequestMethod.GET)
	public String management(Model model) {
		logger.info("Stylistmanagement");
		
        model.addAttribute("result", adminRepository.getStylistList());
		//表示するページ設定
		return "admin/stylist/management";
	}
	
	/**
	 * スタイリスト管理画面：追加画面遷移
	 * @return
	 */
	@RequestMapping(value = "/stylistinsert", method = RequestMethod.POST, params = "stylistinsert")
	public String stylistinsert() {
		logger.info("addStylist");
		
		//表示するページ設定
		return "admin/stylist/addStylist";
	}
	
	/**
	 * スタイリスト追加画面：管理画面遷移
	 * @return
	 */
	@RequestMapping(value = "/addstylistform", method = RequestMethod.POST, params = "cansel")
	public String stylistadd() {
		logger.info("addStylist");
		
		//表示するページ設定
		return "admin/stylist/management";
	}
	
	/**
	 *　スタイリスト追加
	 * @param cmdMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/stylist/insertWrite.do", method = RequestMethod.POST)
	public ModelAndView insertWrite(CommandMap cmdMap) throws Exception {
		logger.info("スタイリストの追加処理");
		logger.info("<--- スタイリストの追加処理開始 --->");
		ModelAndView mv = new ModelAndView("/admin");
		adminRepository.insertStylist(cmdMap.getMap());
		//System.out.println("///// cmdMap.getMap() ：" + cmdMap.getMap() + " /////");
		mv.setViewName("redirect:/admin");
		logger.info("<--- スタイリストの追加処理終了 --->");
		return mv;
	}
	
	// スタイリストの削除処理
	@RequestMapping(value = "/admin/stylist/delete.do", method = RequestMethod.POST)
	public ModelAndView delStylist(@ModelAttribute("StylistVO") StylistVO styvo)
			throws Exception {
		logger.info("<--- スタイリストの削除処理開始 --->");
		//System.out.println("///// styvo ：" + styvo + " /////");
		ModelAndView mv = new ModelAndView();
		//System.out.println("///// mv:" + mv + " /////");
		//String ans = adminRepository.judgeStylist(styvo).toString();
		//System.out.println("///// ans:" + ans + " /////");
		//if(ans == ""){
			mv.addObject("rtn",adminRepository.upStylistStatus(styvo));
		//}
		mv.setViewName("redirect:/admin/stylist/management");
		System.out.println("///// mv:" + mv + " /////");
		logger.info("<--- スタイリストの削除処理終了 --->");
		return mv;
	}
	
	/**
	 * 
	 * @param styvo スタイリスト更新情報
	 * @return　
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/stylist/update.do", method = RequestMethod.POST)
	public ModelAndView upStylist(@ModelAttribute("StylistVO") StylistVO styvo)
			throws Exception {
		logger.info("<--- スタイリストの更新処理開始 --->");
		//System.out.println("///// styvo ：" + styvo + " /////");
		ModelAndView mv = new ModelAndView();
		//System.out.println("///// mv:" + mv + " /////");
		mv.addObject("rtn",adminRepository.upStylist(styvo));
		mv.setViewName("redirect:/admin/stylist/management");
		logger.info("<--- スタイリストの更新処理終了 --->");
		return mv;
	}

	/**
	 * スタイリスト詳細
	 * @param id スタイリストID
	 * @return　対象となるスタイリストの詳細画面
	 */
	@RequestMapping(value = "/admin/stylist/edit", method = RequestMethod.GET)
	public ModelAndView stylistdetail(@RequestParam String id) {
		
		ModelAndView mv = new ModelAndView(); 
		logger.info("<--- スタイリスト詳細処理開始 --->");
		//mv.addObject("deljuge", ans);
		//System.out.println("///// id ：" + id + " /////");
		//事前に対象のスタイリストに削除可能か判定
		List<StylistVO> ans = adminRepository.judgeStylist(id);
		//予約が無い場合は削除フラグを立てる
		if(ans.isEmpty()){
			mv.addObject("deljuge", 1);
		}
		//System.out.println("///// ans詳細:" + ans + " /////");
		List<StylistVO> result = adminRepository.getStylistDetail(id);
		//System.out.println("///// result ：" + result + " /////");
		mv.setViewName("/admin/stylist/edit");
		mv.addObject("result", result);
		logger.info("<--- スタイリスト詳細処理終了 --->");
		return mv;
	}
	
	/**
	 * スタイリスト休暇追加
	 * @return ModelAndView mav
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/stylist/addSchedule", method = RequestMethod.GET)
	public ModelAndView getVacationSetStylist() throws Exception {
		logger.info("====================================getStylistForVacationStart======================================");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", adminRepository.getStylistList());
		mav.setViewName("admin/stylist/addSchedule");
		logger.info("====================================getStylistForVacationEnd--======================================");
		return mav;
	}
	
	/**
	 * スタイリスト休暇追加
	 * @return ModelAndView mav
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/stylist/getStyBusyDate", method = RequestMethod.POST)
	public ModelAndView getStyBusyDate(@RequestParam Map<String, Object> commandMap) throws Exception {
		logger.info("====================================getStyBusyDateStart======================================");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", adminRepository.getStyBusyDate(commandMap));
		mav.setViewName("jsonView");
		logger.info("====================================getStyBusyDateEnd--======================================");
		return mav;
	}
	
	@RequestMapping(value = "/admin/stylist/schedule", method = RequestMethod.GET)
	public String stylistSchedule(Model model) throws Exception {
		List<Map<String, Object>> reservation = reservationRepository.getReservationListByToday();
		Calendar cld = Calendar.getInstance();
		int thisYear = cld.get(cld.YEAR);
		List<String> yearList = new ArrayList<String>();
		for(int i=2015; i<=thisYear+1; i++) {
			yearList.add(String.valueOf(i));
		}
		System.out.println(yearList.get(0));
		model.addAttribute("reservation", reservation);
		model.addAttribute("stylist", adminRepository.getStylistList());
		model.addAttribute("month", month);
		model.addAttribute("year", yearList);
		return "/admin/stylist/scheduleList";
	}
	
	@RequestMapping(value="/admin/stylist/schedule.do", method = RequestMethod.POST)
	public ModelAndView searchSchedule(@RequestParam String date, @RequestParam String stylist) throws Exception{
		ModelAndView mav = new ModelAndView(); 
		System.out.println("=========================schedule!!!!!!!!!!");
		mav.addObject("data", adminRepository.getStylistSchedule(date, stylist));
		mav.setViewName("jsonView");
		return mav;
	}
}

package com.nurinubi.tokoya.board.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.board.domain.BoardVO;
import com.nurinubi.tokoya.board.repository.BoardRepository;
import com.nurinubi.tokoya.common.domain.CommandMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ClassName 	: BoardController.java
 * @Description	: BoardController Class
 * @Modification Information
 * 	修正日 		修正者 		修正内容 
 * 	--------- 	--------- 	-------------------------------
 *  2017.07.12	Kim			最初作成
 * 
 * @author Kim
 * @since 2017.07.12
 * @version 0.1
 *
 * Copyright (C) by NuriNubi All right reserved.
 */

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardRepository boardRepository;

	// お知らせのホーム画面(ユーザー)
		@RequestMapping(value = "/admin/board", method = RequestMethod.GET)
		public String listBoard(
				Model model, 
				@RequestParam(value="selectedPageNum", defaultValue = "1") int pageNum
				) throws Exception {
			
			logger.info("お知らせのホーム画面(ユーザー)");
			System.out.println("pageNum : " + pageNum);
			model.addAttribute("result", boardRepository.getBoardList(pageNum));
			model.addAttribute("total", boardRepository.getBoardTotalCount());
			model.addAttribute("curPage", pageNum);
			
			return "/board/board";
		}
	// お知らせの作成画面
	@RequestMapping(value = "/admin/board/write", method = RequestMethod.GET)
	public String formWrite(CommandMap cmdMap) throws Exception {
		return "/board/write";
	}

	// お知らせの作成処理
	@RequestMapping(value = "/board/insertWrite.do", method = RequestMethod.POST)
	public String insertWrite(CommandMap cmdMap)
			throws Exception {
		logger.info("お知らせの作成処理");
		Date date = new Date();
		cmdMap.put("REGISTERDATE", date);
		boardRepository.insertBoard(cmdMap.getMap());
		return "redirect:/admin";
	}

	@RequestMapping(value = "/board/view", method = RequestMethod.GET)
	public ModelAndView boardView(@RequestParam String id) {
		ModelAndView mav = new ModelAndView(); 
		System.out.println("id" + id);
		List<BoardVO> result = boardRepository.getBoardByNoticeId(id);
		System.out.println("result:" + result);
		mav.setViewName("/board/view");
		System.out.println("mav:" + mav);
		mav.addObject("result", result);
		return mav;
	}
}

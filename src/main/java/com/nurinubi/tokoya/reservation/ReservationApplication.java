package com.nurinubi.tokoya.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import com.nurinubi.tokoya.reservation.domain.ReservationVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.reservation.controller.ReservationController;
import com.nurinubi.tokoya.reservation.repository.ReservationRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
<!--
 * 
 * @ClassName : ReservationApplication.java
 * @Description : ReservationApplication Class
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017. 7. 14.		李　多　浩			最初作成
 * 		2017. 7. 16.		李　多　浩			getStaffList追加
 * @author 李　多　浩
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
 */

@Repository
public class ReservationApplication implements ReservationRepository {

	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, Object>> getCourseList() {
		logger.info("======================================getStaffListApplicationStart===================================");
		List<HashMap<String, Object>> list = this.sqlSession.selectList("getCourseList");
		logger.info(list.toString());
		logger.info("======================================getStaffListApplicationEnd=====================================");
		return list;
	}

	@Override
	public List<HashMap<String, Object>> getStaffList(Map<String, Object> commandMap) {
		logger.info("======================================getStaffListApplicationStart===================================");
		logger.info(commandMap.toString());
		commandMap.put("time", commandMap.get("date") + "" +commandMap.get("time")+"0000");
		List<HashMap<String, Object>> list = this.sqlSession.selectList("getStaffList", commandMap);
		logger.info(list.toString());
		logger.info("======================================getStaffListApplicationEnd=====================================");
		return list;
	}
	
	@Override
	public List<Map<String, Object>> getReservationListByToday() throws Exception {
		return this.sqlSession.selectList("getReservationListByToday");
	}
}
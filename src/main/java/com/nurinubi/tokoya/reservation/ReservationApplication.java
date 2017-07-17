package com.nurinubi.tokoya.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.reservation.controller.ReservationController;
import com.nurinubi.tokoya.reservation.domain.ReservationVO;
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
		logger.info("======================================getCourseListApplicationStart===================================");
		List<HashMap<String, Object>> list = this.sqlSession.selectList("getCourseList");
		logger.info(list.toString());
		logger.info("======================================getCourseListApplicationEnd=====================================");
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
	public ReservationVO getCheckInfo(ReservationVO rDomain) {
		logger.info("======================================getCheckInfoApplicationStart===================================");
		ReservationVO rtn = this.sqlSession.selectOne("getCheckInfo", rDomain);
		rtn.setReservationDate(rDomain.getReservationDate());
		rtn.setReservationTime(rDomain.getReservationTime());
		/** 임시 */
		rtn.setUserId("User2");
		rtn.setUserName("aaaaa");
		/** */
		logger.info(rtn.toString());
		logger.info("======================================getCheckInfoApplicationEnd=====================================");
		return rtn;
	}

	@Override
	public int setReserve(ReservationVO rDomain) {
		logger.info("======================================setReserveApplicationStart===================================");
		rDomain.setReservationDateTime(rDomain.getReservationDate()+""+rDomain.getReservationTime()+"0000");
		rDomain.setReservationStatus("1");
//		Map<String, Integer> r = this.sqlSession.selectOne("getReservCount");
		Integer i = sqlSession.selectOne("getReservCount");
		i = new Integer(i.intValue() + 1);
		String s = ""+i;
		rDomain.setReservationId(s);
		logger.info(rDomain.toString());
		int rtn = this.sqlSession.insert("setReserveInfo", rDomain);
		logger.info("======================================setReserveApplicationEnd=====================================");
		return rtn;
	}
}
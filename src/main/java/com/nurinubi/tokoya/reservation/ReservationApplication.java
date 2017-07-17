package com.nurinubi.tokoya.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
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
 * 
 * @author 李　多　浩
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
 */

@Repository
public class ReservationApplication implements ReservationRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReservationVO> getUserList() {
		return this.sqlSession.selectList("getUserList");
	}
	
	@Override
	public List<Map<String, Object>> getReservationListByToday() throws Exception {
		return this.sqlSession.selectList("getReservationListByToday");
	}
}
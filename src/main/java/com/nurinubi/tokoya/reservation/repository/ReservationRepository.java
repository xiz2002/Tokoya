package com.nurinubi.tokoya.reservation.repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.reservation.domain.ReservationVO;

/**
<!--
 * 
 * @ClassName : ReservationRepository.java
 * @Description : ReservationRepository Class
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017. 7. 14.		李　多　浩			最初作成
 * 		2017. 7. 16.		李　多　浩			getStaffList追加
 * 		2017. 7. 18		李　多　浩			getReserveHistory追加
 * 
 * @author 李　多　浩
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
 */

@Mapper
public interface ReservationRepository {
	
	List<Map<String, Object>> getReservationListByToday() throws Exception;
	
	List<Map<String, Object>> getReservationByDate(Date date) throws Exception;
	
	List<HashMap<String, Object>> getCourseList();
	
	List<HashMap<String, Object>> getStaffList(Map<String, Object> commandMap);
	
	ReservationVO getCheckInfo(ReservationVO rDomain);

	int setReserve(ReservationVO rDomain);
	
	List<ReservationVO> getReserveHistory(ReservationVO rDomain);
	
	int setReserveCancel(ReservationVO rDomain);
	
}

package com.nurinubi.tokoya.reservation.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
<!--
 * 
 * @ClassName : ReservationRepository.java
 * @Description : ReservationRepository Class
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

@Mapper
public interface ReservationRepository {
	
	List<HashMap<String, Object>> getCourseList();
	
	List<HashMap<String, Object>> getStaffList(Map<String, Object> commandMap);
	
}

package com.nurinubi.tokoya.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.admin.domain.StylistVO;
import com.nurinubi.tokoya.admin.repository.AdminRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
/**
* @Class Name : AdminController.java.java
* @Description :  BoardController.java Class
* @Modification Information
* @ 
* @	修正日			修正者			修正内容
* @ 	---------		---------		-------------------------------
* @ 	2017.07.12		Kim				最初作成
*           16		Kim				
* 			17		Lee				Add Method getStyBusyDate 
* @author Kim
* @since 2017.07.12
* @version 0.1
*
*  Copyright (C) by NuriNubi All right reserved.
*/

@Repository
public class AdminApplication implements AdminRepository {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminApplication.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<StylistVO> getStylistList() {
		return this.sqlSession.selectList("getStylistList");
	}
	
	@Override
	public void insertStylist(Map<String, Object> map) {
		this.sqlSession.insert("addStylist", map);
	}

	@Override
	public List<String> getStyBusyDate(Map<String,Object> commandMap) throws Exception {
		logger.info("======================================getCourseListApplicationStart===================================");
		logger.info(commandMap.toString());
		List<String> styVa = this.sqlSession.selectList("getStyVaList", commandMap);
		logger.info(styVa.toString());
		List<String> styRe = this.sqlSession.selectList("getStyReList", commandMap);
		logger.info(styRe.toString());
		
		logger.info("======================================getCourseListApplicationEnd=====================================");
		return null;
	}
	
}
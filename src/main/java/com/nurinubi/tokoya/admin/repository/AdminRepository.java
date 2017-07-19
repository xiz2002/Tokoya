package com.nurinubi.tokoya.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.admin.domain.StylistVO;
/**
* @Class Name : AdminController.java.java
* @Description :  BoardController.java Class
* @Modification Information
* @ 
* @	修正日			修正者			修正内容
* @ 	---------		---------		-------------------------------
* @ 	2017.07.12		Kim				最初作成
* @ 			16		Kim				
* @author Kim
* @since 2017.07.12
* @version 0.1
*
*  Copyright (C) by NuriNubi All right reserved.
*/

@Mapper
public interface AdminRepository {

	//スタイリスト一覧処理
	List<StylistVO> getStylistList();
	
	//スタイリスト追加処理
	void insertStylist(Map<String, Object> map) throws Exception;
	
	List<String> getStyBusyDate(Map<String,Object> commandMap) throws Exception;
	
}

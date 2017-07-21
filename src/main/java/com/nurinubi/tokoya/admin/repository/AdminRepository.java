package com.nurinubi.tokoya.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.admin.domain.ScheduleVO;
import com.nurinubi.tokoya.admin.domain.StylistVO;

import com.nurinubi.tokoya.reservation.domain.ReservationVO;

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
	
	//スタイリスト詳細処理
	List<StylistVO> getStylistDetail(String id);
	
	//スタイリスト削除確認（詳細画面にて判定）
	List<StylistVO> judgeStylist(String id);
	
	//スタイリスト追加処理
	void insertStylist(Map<String, Object> map) throws Exception;
	

	//スタイリスト削除処理
	//int delStylist(StylistVO styvo);
	
	//スタイリストステータス削除
	int upStylistStatus(StylistVO styvo);
	
	//スタイリスト削除確認（削除前に確認）
	//List<StylistVO> judgeStylist(StylistVO styvo);
	
	//スタイリスト更新処理
	int upStylist(StylistVO styvo);

	List<String> getStyBusyDate(Map<String,Object> commandMap) throws Exception;
	
	//スタイリストスケジュール
	Map<String, Object> getStylistSchedule(String date, String stylist) throws Exception;

}

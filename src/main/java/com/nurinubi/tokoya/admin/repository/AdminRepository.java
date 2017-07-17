package com.nurinubi.tokoya.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.admin.domain.AdminVO;
import com.nurinubi.tokoya.admin.domain.StylistVO;

@Mapper
public interface AdminRepository {
	List<Map<String, Object>> getReservationListByStylist(Map<String, Object> cmdMap) throws Exception;
	

	//スタイリスト一覧処理
	List<StylistVO> getStylistList();
	
	//スタイリスト追加処理
	void insertStylist(Map<String, Object> map) throws Exception;

	List<StylistVO> getStylistList();

}

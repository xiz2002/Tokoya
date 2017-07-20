package com.nurinubi.tokoya.admin.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.admin.domain.AdminVO;
import com.nurinubi.tokoya.admin.domain.StylistVO;
import com.nurinubi.tokoya.reservation.domain.ReservationVO;

@Mapper
public interface AdminRepository {

	//スタイリスト一覧処理
	List<StylistVO> getStylistList();
	
	//スタイリスト詳細処理
	List<StylistVO> getStylistDetail(String id);
	
	//スタイリスト追加処理
	void insertStylist(Map<String, Object> map) throws Exception;
	
	//スタイリスト削除処理
	//int delStylist(StylistVO styvo);
	
	//スタイリストステータス削除
	int upStylistStatus(StylistVO styvo);
	
	//スタイリスト削除確認
	List<StylistVO> judgeStylist(StylistVO styvo);
	
	//スタイリスト更新処理
	int upStylist(StylistVO styvo);
}

package com.nurinubi.tokoya.user.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.user.domain.UserVO;

@Mapper
public interface UserRepository {
	List<Map<String, Object>> getReservationListByStylist(Map<String, Object> cmdMap) throws Exception;
	
	//ログイン
	void login(Map<String, Object> map) throws Exception;
}

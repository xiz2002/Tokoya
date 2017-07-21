package com.nurinubi.tokoya.user.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.user.domain.UserVO;

@Mapper
public interface UserRepository {

	//ログイン
	Map<String,String> loginUserCheck(String id, String pass) throws Exception;
	
	UserVO loginUserInfo(String id) throws Exception;
	
	String checkId(String id) throws Exception;

	void insertUser(Map<String, Object> map) throws Exception;

}

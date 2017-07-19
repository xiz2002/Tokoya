package com.nurinubi.tokoya.user.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {

	//ログイン
	String login(String id, String pass, String mode) throws Exception;
	
	String checkId(String id);

	void insertUser(Map<String, Object> map) throws Exception;

}

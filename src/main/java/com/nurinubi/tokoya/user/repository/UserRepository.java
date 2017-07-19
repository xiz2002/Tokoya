package com.nurinubi.tokoya.user.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.user.domain.UserVO;

@Mapper
public interface UserRepository {

	//ログイン
	String login(String id, String pass, String mode) throws Exception;
	
	String checkId(String id);

	void insertUser(Map<String, Object> map) throws Exception;

}

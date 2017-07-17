package com.nurinubi.tokoya.user.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.user.domain.UserVO;

@Mapper
public interface UserRepository {

	//ログイン
	void login(Map<String, Object> map) throws Exception;

	List<UserVO> findOne(String username, String userpass);
	
	void insertUser(Map<String, Object> map) throws Exception;

}

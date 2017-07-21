package com.nurinubi.tokoya.user;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nurinubi.tokoya.user.domain.UserVO;
import com.nurinubi.tokoya.user.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
<!--
 * 
 * @ClassName : UserApplication.java
 * @Description : UserApplication Class
 * @
 * @		修正日			修正者			修正内容
 * @ 	---------		---------		-------------------------------
 * @ 	2017. 7. 12.		Kim				最初作成
 * 
 * @author Kim
 * @since 2017
 * @version 0.1
 *
 *  Copyright (C) by NuriNubi All right reserved.
 * -->
 */

@Repository
public class UserApplication implements UserRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String checkId(String id){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		return this.sqlSession.selectOne("checkId", param);
	}
	
	@Override
	public void insertUser(Map<String, Object> map) throws Exception {
		this.sqlSession.insert("addUser", map);
	}

	@Override
	public Map<String,String> loginUserCheck(String id, String pass) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("pass", pass);
		return this.sqlSession.selectOne("loginUserCheck", param);
	}
	
	@Override
	public UserVO loginUserInfo(String id) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		return this.sqlSession.selectOne("loginUserInfo", param);
	}
}
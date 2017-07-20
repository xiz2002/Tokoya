package com.nurinubi.tokoya.user;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nurinubi.tokoya.user.domain.UserVO;
import com.nurinubi.tokoya.user.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserApplication implements UserRepository {

	@Autowired
	private SqlSession sqlSession;
	
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

	@Override
	public String checkId(String id){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		return this.sqlSession.selectOne("checkId", param);
	}
	
}
package com.nurinubi.tokoya.user;

import java.util.HashMap;
import java.util.List;
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
		map.get("email1");
		this.sqlSession.insert("addUser", map);
	}

	@Override
	public String login(String id, String pass, String mode) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("pass", pass);
		if(mode.equals("step1")) {
			return this.sqlSession.selectOne("login", param);
		}else if (mode.equals("step2")) {
			return this.sqlSession.selectOne("loginAdmin", param);
		}else {
			return "error";
		}
	}

	@Override
	public String checkId(String id){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		System.out.println(id);
		return this.sqlSession.selectOne("checkId", param);
	}
	
}
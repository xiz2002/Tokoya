package com.nurinubi.tokoya.user;

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
	public List<UserVO> login(Map<String, Object> map) throws Exception {
		return this.sqlSession.selectList("login", map);
	}

	@Override
	public List<UserVO> checkId(String id){
		return this.sqlSession.selectList("checkId", id);
	}
	
}
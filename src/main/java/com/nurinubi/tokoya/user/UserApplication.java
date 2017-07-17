package com.nurinubi.tokoya.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nurinubi.tokoya.admin.domain.StylistVO;
import com.nurinubi.tokoya.user.domain.UserVO;
import com.nurinubi.tokoya.user.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserApplication implements UserRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public void insertStylist(Map<String, Object> map) {
		this.sqlSession.insert("login", map);
		}

	@Override
	public List<Map<String, Object>> getReservationListByStylist(Map<String, Object> cmdMap) throws Exception {
		return this.sqlSession.selectList("getReservationListByStylist", cmdMap);
	}

	@Override
	public void login(Map<String, Object> map) throws Exception {
		this.sqlSession.insert("login", map);
	}

	@Override
	public void insertUser(Map<String, Object> map) throws Exception {
		map.get("email1");
		this.sqlSession.insert("addUser", map);
	}
	
}
package com.nurinubi.tokoya.user;

import java.util.List;

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
	public List<UserVO> getUserList() {
		return this.sqlSession.selectList("getUserList");
	}
	
	@Autowired
	private SqlSession userlogin;

	@Override
	public List<UserVO> findOne(String username, String userpass) {
		return this.userlogin.selectOne(username, userpass);
	}
}
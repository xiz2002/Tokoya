package com.nurinubi.tokoya.user.repository;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.user.domain.UserVO;

@Mapper
public interface UserRepository {
	
	List<UserVO> getUserList();
	
	List<UserVO> findOne(String username, String userpass);
}

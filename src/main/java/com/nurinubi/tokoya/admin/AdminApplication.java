package com.nurinubi.tokoya.admin;

import java.util.List;
<<<<<<< HEAD
import java.util.Map;
=======
>>>>>>> fe01d9d732c9bd127aada6e209fa50cedf823274

import org.apache.ibatis.session.SqlSession;

import com.nurinubi.tokoya.admin.domain.AdminVO;
import com.nurinubi.tokoya.admin.repository.AdminRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminApplication implements AdminRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AdminVO> getStylistList() {
		return this.sqlSession.selectList("getStylistList");
	}
}
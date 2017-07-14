package com.nurinubi.tokoya.admin.repository;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.admin.domain.AdminVO;

@Mapper
public interface AdminRepository {
	
	List<AdminVO> getStylistList();
}

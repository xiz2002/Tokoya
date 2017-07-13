package com.nurinubi.tokoya.sample.repository;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.nurinubi.tokoya.sample.domain.SampleVO;

// Mapper 어노테이션으로 xml파일과 연

@Mapper
public interface SampleRepository {
	
	List<SampleVO> getUserList();
}

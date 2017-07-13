package com.nurinubi.tokoya.sample.repository;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.nurinubi.tokoya.sample.domain.SampleVO;

@Mapper
public interface SampleRepository {
	
	List<SampleVO> getUserList();
}

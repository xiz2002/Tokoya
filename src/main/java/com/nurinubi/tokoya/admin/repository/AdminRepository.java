package com.nurinubi.tokoya.admin.repository;

import java.util.List;
<<<<<<< HEAD
import java.util.Map;

=======
>>>>>>> fe01d9d732c9bd127aada6e209fa50cedf823274
import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.admin.domain.AdminVO;

@Mapper
public interface AdminRepository {
<<<<<<< HEAD
	List<Map<String, Object>> getReservationListByStylist(Map<String, Object> cmdMap) throws Exception;
=======
	
	List<AdminVO> getStylistList();
>>>>>>> fe01d9d732c9bd127aada6e209fa50cedf823274
}

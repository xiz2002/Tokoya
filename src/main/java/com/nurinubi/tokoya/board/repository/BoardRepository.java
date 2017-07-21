package com.nurinubi.tokoya.board.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.nurinubi.tokoya.board.domain.BoardVO;

@Mapper
public interface BoardRepository {
	
	Integer getBoardTotalCount();
	
	List<BoardVO> getBoardList(int pageNum);
	
	List<BoardVO> getBoardByNoticeId(String id);
	
	void insertBoard(Map<String, Object> map) throws Exception;
	
}

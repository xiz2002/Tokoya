package com.nurinubi.tokoya.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nurinubi.tokoya.board.domain.BoardVO;
import com.nurinubi.tokoya.board.repository.BoardRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardApplication implements BoardRepository {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardVO> getBoardList() {
		return sqlSession.selectList("getBoardList");
	}
	
	public void insertBoard(Map<String, Object> map) {
		this.sqlSession.insert("addBoardList", map);
	}

	@Override
	public List<BoardVO> getBoardByNoticeId(String id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		return this.sqlSession.selectList("getBoardByNoticeId", id);
	}
	

	@Override
	public int deleteBoard(String boardId) throws Exception {
		int result = this.sqlSession.delete("deleteBoard", boardId);
		return result;
	}
}
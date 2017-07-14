package com.nurinubi.tokoya.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.nurinubi.tokoya.board.domain.BoardVO;
import com.nurinubi.tokoya.board.repository.BoardRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

@Repository
public class BoardApplication implements BoardRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> getBoardList() {
		return this.sqlSession.selectList("getBoardList");
	}
	public void insertBoard(Map<String, Object> map) {
		this.sqlSession.insert("addBoardList", map);
		}
}
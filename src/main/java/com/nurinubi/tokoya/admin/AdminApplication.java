package com.nurinubi.tokoya.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nurinubi.tokoya.admin.controller.AdminController;
import com.nurinubi.tokoya.admin.domain.AdminVO;
import com.nurinubi.tokoya.admin.domain.StylistVO;
import com.nurinubi.tokoya.admin.repository.AdminRepository;
import com.nurinubi.tokoya.board.domain.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * スタイリスト、管理者のDB処理
 * @author Administrator
 *
 */
@Repository
public class AdminApplication implements AdminRepository {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * スタイリスト全件表示
	 */
	@Override
	public List<StylistVO> getStylistList() {
		return this.sqlSession.selectList("getStylistList");
	}
	/**
	 * スタイリスト追加
	 */
	public void insertStylist(Map<String, Object> map) {
		this.sqlSession.insert("addStylist", map);
	}
	
	/**
	 * スタイリスト削除
	 */
	/**
	 * @Override
	public int delStylist(StylistVO styvo) {
		return this.sqlSession.delete("delStylist", styvo);
	}**/
	
	/**
	 * スタイリスト詳細
	 */
	@Override
	public List<StylistVO> getStylistDetail(String id){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		return this.sqlSession.selectList("getStylistDetail",id);
	}
	
	/**
	 * スタイリスト名更新
	 */
	@Override
	public int upStylist(StylistVO styvo) {
		return this.sqlSession.update("upStylist", styvo);
	}
	
	/**@Override
	public List<StylistVO> judgeStylist1(StylistVO styvo) {
		return this.sqlSession.selectList("judgeStylist",styvo);
	}**/
	
	@Override
	public List<StylistVO> judgeStylist(String id) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		//System.out.println("///// id ：" + id + " /////");
		//System.out.println("///// param ：" + param + " /////");
		//System.out.println(this.sqlSession.selectList("judgeStylist",id));
		return this.sqlSession.selectList("judgeStylist",id);
	}
	
	@Override
	public int upStylistStatus(StylistVO styvo) {
		return this.sqlSession.update("upStylistStatus", styvo);
	}
	
	
}
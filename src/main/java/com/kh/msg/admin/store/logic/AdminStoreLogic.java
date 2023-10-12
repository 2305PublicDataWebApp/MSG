package com.kh.msg.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.msg.admin.store.AdminStore;
import com.kh.msg.notice.domain.PageInfo;
import com.kh.msg.user.domain.User;

@Repository
public class AdminStoreLogic implements AdminStore{

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("AdminMapper.selectListCount");
		return result;
	}

	@Override
	public List<User> selectMemberList(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getNaviCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<User> mList = sqlSession.selectList("AdminMapper.selectMemberList", null, rowBounds);
		return mList;
	}

	@Override
	public int deleteMember(SqlSession sqlSession, String memberId) {
		int result = sqlSession.delete("AdminMapper.deleteMember", memberId);
		return result;
	}

}

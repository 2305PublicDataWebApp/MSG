package com.kh.msg.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.msg.admin.store.AdminStore;
import com.kh.msg.member.domain.Member;
import com.kh.msg.notice.domain.PageInfo;

@Repository
public class AdminStoreLogic implements AdminStore{

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("AdminMapper.selectListCount");
		return result;
	}

	@Override
	public List<Member> selectMemberList(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getNaviCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Member> mList = sqlSession.selectList("AdminMapper.selectMemberList", null, rowBounds);
		return mList;
	}

	@Override
	public int deleteMember(SqlSession sqlSession, String memberId) {
		int result = sqlSession.delete("AdminMapper.deleteMember", memberId);
		return result;
	}

}

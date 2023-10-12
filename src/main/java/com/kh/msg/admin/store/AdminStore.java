package com.kh.msg.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.msg.member.domain.Member;
import com.kh.msg.notice.domain.PageInfo;

public interface AdminStore {

	int selectListCount(SqlSession sqlSession);

	List<Member> selectMemberList(SqlSession sqlSession, PageInfo pInfo);

	int deleteMember(SqlSession sqlSession, String memberId);

}

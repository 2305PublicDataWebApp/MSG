package com.kh.msg.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.msg.notice.domain.PageInfo;
import com.kh.msg.user.domain.User;

public interface AdminStore {

	int selectListCount(SqlSession sqlSession);

	List<User> selectMemberList(SqlSession sqlSession, PageInfo pInfo);

	int deleteMember(SqlSession sqlSession, String memberId);

}

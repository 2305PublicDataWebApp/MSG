package com.kh.msg.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.msg.admin.service.AdminService;
import com.kh.msg.admin.store.AdminStore;
import com.kh.msg.member.domain.Member;
import com.kh.msg.notice.domain.PageInfo;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminStore aStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Integer getListCount() {
		int result = aStore.selectListCount(sqlSession);
		return result;
	}

	@Override
	public List<Member> selectMemberList(PageInfo pInfo) {
		List<Member> mList = aStore.selectMemberList(sqlSession, pInfo);
		return mList;
	}

	@Override
	public int deleteMember(String memberId) {
		int result = aStore.deleteMember(sqlSession, memberId);
		return result;
	}

}

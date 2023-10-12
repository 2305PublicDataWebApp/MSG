package com.kh.msg.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.msg.admin.service.AdminService;
import com.kh.msg.admin.store.AdminStore;
import com.kh.msg.notice.domain.PageInfo;
import com.kh.msg.user.domain.User;

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
	public List<User> selectMemberList(PageInfo pInfo) {
		List<User> mList = aStore.selectMemberList(sqlSession, pInfo);
		return mList;
	}

	@Override
	public int deleteMember(String memberId) {
		int result = aStore.deleteMember(sqlSession, memberId);
		return result;
	}

}

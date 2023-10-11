package com.kh.msg.member.sevice.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.msg.member.domain.Member;
import com.kh.msg.member.sevice.MemberService;
import com.kh.msg.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private MemberStore mStore;

	@Override
	public int insertMember(Member member) {
		int result = mStore.insertMember(session, member);
		return result;
	}

	@Override
	public int updateMember(Member member) {
		int result = mStore.updateMember(session, member);
		return result;
	}

	@Override
	public int deleteMember(String memberId) {
		int result = mStore.deleteMember(session, memberId);
		return result;
	}

	@Override
	public Member checkMemberLogin(Member member) {
		Member mOne = mStore.checkMemberLogin(session, member);
		return mOne;
	}

	@Override
	public Member getMemberById(String memberId) {
		Member member = mStore.selectOneById(session, memberId);
		return member;
	}

	@Override
	public int idChk(MemberStore vo) throws Exception{
		// TODO Auto-generated method stub
		int result = mStore.idChk(vo);
		return result;
	}

	@Override
	public void register(MemberStore vo) {
		// TODO Auto-generated method stub
		
	}

}

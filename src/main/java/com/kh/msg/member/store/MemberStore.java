package com.kh.msg.member.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.msg.member.domain.Member;

public interface MemberStore {

	int insertMember(SqlSession session, Member member);

	Member checkMemberLogin(SqlSession session, Member member);

	Member selectOneById(SqlSession session, String memberId);

	int updateMember(SqlSession session, Member member);

	int deleteMember(SqlSession session, String memberId);

	int idChk(MemberStore vo) throws Exception;
}
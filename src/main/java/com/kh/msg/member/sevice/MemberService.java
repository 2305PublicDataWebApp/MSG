package com.kh.msg.member.sevice;

import com.kh.msg.member.domain.Member;
import com.kh.msg.member.store.MemberStore;

public interface MemberService {

	/**
	 * 회원 가입 Service
	 * @param member
	 * @return
	 */
	int insertMember(Member member);

	/**
	 * 회원 로그인 Service
	 * @param member
	 * @return
	 */
//	int checkMemberLogin(Member member);
	Member checkMemberLogin(Member member);

	/**
	 * 회원 상세 정보 조회 Service
	 * @param memberId
	 * @return
	 */
	Member getMemberById(String memberId);

	/**
	 * 회원 정보 수정 Service
	 * @param member
	 * @return
	 */
	int updateMember(Member member);

	/**
	 * 회원 탈퇴 Service, update로 할 예정
	 * @param memberId
	 * @return
	 */
	int deleteMember(String memberId);

	int idChk(MemberStore vo) throws Exception;

	void register(MemberStore vo);
}

package com.kh.msg.admin.service;

import java.util.List;

import com.kh.msg.member.domain.Member;
import com.kh.msg.notice.domain.PageInfo;

public interface AdminService {

	Integer getListCount();

	List<Member> selectMemberList(PageInfo pInfo);

	int deleteMember(String memberId);

}

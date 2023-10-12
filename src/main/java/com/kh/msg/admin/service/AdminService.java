package com.kh.msg.admin.service;

import java.util.List;

import com.kh.msg.notice.domain.PageInfo;
import com.kh.msg.user.domain.User;

public interface AdminService {

	Integer getListCount();

	List<User> selectMemberList(PageInfo pInfo);

	int deleteMember(String memberId);

}

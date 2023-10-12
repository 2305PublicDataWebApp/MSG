package com.aug.spring.user.service;

import com.aug.spring.user.domain.User;
import com.aug.spring.user.store.UserStore;

public interface UserService {

	/**
	 * 회원 가입 Service
	 * @param user
	 * @return
	 */
	int insertuser(User user);

	/**
	 * 회원 로그인 Service
	 * @param member
	 * @return
	 */
//	int checkUserLogin(User user);
	User checkUserLogin(User user);

	/**
	 * 회원 상세 정보 조회 Service
	 * @param userId
	 * @return
	 */
	User getUserById(String userId);

	/**
	 * 회원 정보 수정 Service
	 * @param member
	 * @return
	 */
	int updateUser(User user);

	/**
	 * 회원 탈퇴 Service, update로 할 예정
	 * @param memberId
	 * @return
	 */
	int deleteUser(String userId);

	int idChk(UserStore vo) throws Exception;

	void register(UserStore vo);









}

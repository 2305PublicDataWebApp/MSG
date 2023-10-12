package com.aug.spring.user.store;

import org.apache.ibatis.session.SqlSession;

import com.aug.spring.user.domain.User;

public interface UserStore {

	int insertUser(SqlSession session, User user);

	User checkUserLogin(SqlSession session, User user);

	int updateUser(SqlSession session, User user);

	int deleteUser(SqlSession session, String userId);

	int idChk(UserStore vo) throws Exception;

	User getUserById(SqlSession session, String userId);
}

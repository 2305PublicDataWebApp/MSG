package com.kh.msg.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.msg.user.domain.User;
import com.kh.msg.user.store.UserStore;

@Repository
public class UserStoreLogic implements UserStore{

	private SqlSession sql;
	
	@Override
	public int insertUser(SqlSession session, User user) {
		int result = session.insert("UserMapper.insertUser", user);
		return result;
	}

	@Override
	public int updateUser(SqlSession session, User user) {
		int result = session.update("UserMapper.updateUser", user);
		return result;
	}

	@Override
	public int deleteUser(SqlSession session, String userId) {
		int result = session.update("UserMapper.deleteUser", userId);
		return result;
	}

	@Override
	public User checkUserLogin(SqlSession session, User user) {
		User mOne = session.selectOne("UserMapper.checkUserLogin", user);
		return mOne;
	}

//	@Override
//	public User selectOneById(SqlSession session, String userId) {
////		User member = session.selectOne("UserMapper.selectOneById", userId);
//		return member;
//	}

	@Override
	public int idChk(UserStore vo) throws Exception {
		// TODO Auto-generated method stub
		int result = sql.selectOne("UserMapper.idChk",vo);
		return result;
	}

	@Override
	public User getUserById(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		User user = session.selectOne("UserMapper.getUserById", userId);
		return user;
	}



}

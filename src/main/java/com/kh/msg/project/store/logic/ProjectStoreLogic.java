package com.kh.msg.project.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.msg.project.domain.WorkingTime;
import com.kh.msg.project.store.ProjectStore;

@Repository
public class ProjectStoreLogic implements ProjectStore {

	@Override
	public int addStartTime(WorkingTime workingTime, SqlSession sqlSession) {
		int result = sqlSession.insert("WorkingTimeMapper.addStartTime", workingTime);
		return result;
	}

	@Override
	public int addEndTime(WorkingTime workingTime, SqlSession sqlSession) {
		int result = sqlSession.update("WorkingTimeMapper.addEndTime", workingTime);
		return result;
	}

	@Override
	public WorkingTime getOneWorkingTime(String dateWithId, SqlSession sqlSession) {
		WorkingTime getOne = sqlSession.selectOne("WorkingTimeMapper.getOneWorkingTime", dateWithId);
		return getOne;
	}

	@Override
	public List<WorkingTime> getTeamWorkingTime(String dataVal, SqlSession sqlSession) {
		List<WorkingTime> wList = sqlSession.selectList("WorkingTimeMapper.getTeamWorkingTime", dataVal);
		return wList;
	}

}

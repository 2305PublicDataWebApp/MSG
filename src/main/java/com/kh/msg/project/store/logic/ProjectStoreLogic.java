package com.kh.msg.project.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.msg.project.domain.Project;
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
	public List<WorkingTime> getTeamWorkingTime(WorkingTime workingTime, SqlSession sqlSession) {
		List<WorkingTime> wList = sqlSession.selectList("WorkingTimeMapper.getTeamWorkingTime", workingTime);
		return wList;
	}

	@Override
	public int addProject(Map<String, String> paramMap, SqlSession sqlSession) {
		int result = sqlSession.insert("ProjectMapper.addProject", paramMap);
		return result;
	}

	@Override
	public List<Project> getProjectById(String userId, SqlSession sqlSession) {
		List<Project> pList = sqlSession.selectList("ProjectMapper.getProjectById", userId);
		return pList;
	}

	@Override
	public Project checkSameProjectName(Map<String, String> paramMap, SqlSession sqlSession) {
		Project pro = sqlSession.selectOne("ProjectMapper.checkSameProjectName", paramMap);
		return pro;
	}

}

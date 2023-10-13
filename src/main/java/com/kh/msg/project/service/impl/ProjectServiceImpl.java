package com.kh.msg.project.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.msg.project.domain.Project;
import com.kh.msg.project.domain.WorkingTime;
import com.kh.msg.project.service.ProjectService;
import com.kh.msg.project.store.ProjectStore;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectStore pStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int addStartTime(WorkingTime workingTime) {
		int result = pStore.addStartTime(workingTime, sqlSession);
		return result;
	}

	@Override
	public int addEndTime(WorkingTime workingTime) {
		int result = pStore.addEndTime(workingTime, sqlSession);
		return result;
	}

	@Override
	public WorkingTime getOneWorkingTime(String dateWithId) {
		WorkingTime getOne = pStore.getOneWorkingTime(dateWithId, sqlSession);
		return getOne;
	}

	@Override
	public List<WorkingTime> getTeamWorkingTime(WorkingTime workingTime) {
		List<WorkingTime> wList = pStore.getTeamWorkingTime(workingTime, sqlSession);
		return wList;
	}

	@Override
	public int addProject(Map<String, String> paramMap) {
		int result = pStore.addProject(paramMap, sqlSession);
		return result;
	}

	@Override
	public List<Project> getProjectById(String userId) {
		List<Project> pList = pStore.getProjectById(userId, sqlSession);
		return pList;
	}

	@Override
	public Project checkSameProjectName(Map<String, String> paramMap) {
		Project pro = pStore.checkSameProjectName(paramMap, sqlSession);
		return pro;
	}

}

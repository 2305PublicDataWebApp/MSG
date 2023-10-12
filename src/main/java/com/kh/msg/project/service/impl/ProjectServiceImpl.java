package com.kh.msg.project.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<WorkingTime> getTeamWorkingTime(String dataVal) {
		List<WorkingTime> wList = pStore.getTeamWorkingTime(dataVal, sqlSession);
		return wList;
	}

}

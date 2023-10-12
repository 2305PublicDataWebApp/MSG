package com.kh.msg.project.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.msg.project.domain.WorkingTime;

public interface ProjectStore {

	/**
	 * 출근 Store
	 * @param workingTime
	 * @param sqlSession
	 * @return
	 */
	int addStartTime(WorkingTime workingTime, SqlSession sqlSession);

	/**
	 * 퇴근 Store
	 * @param workingTime
	 * @param sqlSession
	 * @return
	 */
	int addEndTime(WorkingTime workingTime, SqlSession sqlSession);

	/**
	 * getOne Store
	 * @param dateWithId
	 * @param sqlSession
	 * @return
	 */
	WorkingTime getOneWorkingTime(String dateWithId, SqlSession sqlSession);

	/**
	 * 지정날짜 출/퇴근 Store
	 * @param dataVal
	 * @param sqlSession
	 * @return
	 */
	List<WorkingTime> getTeamWorkingTime(String dataVal, SqlSession sqlSession);

}

package com.kh.msg.project.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.msg.project.domain.Project;
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
	List<WorkingTime> getTeamWorkingTime(WorkingTime workingTime, SqlSession sqlSession);

	/**
	 * 프로젝트 생성 Store
	 * @param paramMap
	 * @param sqlSession
	 * @return
	 */
	int addProject(Map<String, String> paramMap, SqlSession sqlSession);

	/**
	 * 아이디로 프로젝트 리스트 가져오기 Store
	 * @param userId
	 * @param sqlSession
	 * @return
	 */
	List<Project> getProjectById(String userId, SqlSession sqlSession);

	/**
	 * 프로젝트 이름 중복 체크 Store
	 * @param paramMap
	 * @param sqlSession
	 * @return
	 */
	Project checkSameProjectName(Map<String, String> paramMap, SqlSession sqlSession);

}

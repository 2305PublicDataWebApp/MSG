package com.kh.msg.project.service;

import java.util.List;
import java.util.Map;

import com.kh.msg.project.domain.Project;
import com.kh.msg.project.domain.WorkingTime;

public interface ProjectService {

	/**
	 * 출근 Service
	 * @param workingTime
	 * @return
	 */
	int addStartTime(WorkingTime workingTime);

	/**
	 * 퇴근 Service
	 * @param workingTime
	 * @return
	 */
	int addEndTime(WorkingTime workingTime);

	/**
	 * getOne Service
	 * @param dateWithId
	 * @return
	 */
	WorkingTime getOneWorkingTime(String dateWithId);

	/**
	 * 지정 날짜 출/퇴근 Service
	 * @param dataVal
	 * @return
	 */
	List<WorkingTime> getTeamWorkingTime(WorkingTime workingTime);

	/**
	 * 프로젝트 생성 Service
	 * @param paramMap
	 * @return
	 */
	int addProject(Map<String, String> paramMap);

	/**
	 * 아이디로 프로젝트 리스트 가져오기 Service
	 * @param userId
	 * @return
	 */
	List<Project> getProjectById(String userId);

	/**
	 * 프로젝트 이름 중복 체크 Service
	 * @param paramMap
	 * @return
	 */
	Project checkSameProjectName(Map<String, String> paramMap);

}

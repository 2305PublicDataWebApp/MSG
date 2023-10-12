package com.kh.msg.project.service;

import java.util.List;

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
	List<WorkingTime> getTeamWorkingTime(String dataVal);

}

package com.kh.msg.project.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.msg.project.domain.WorkingTime;
import com.kh.msg.project.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
	@RequestMapping(value="/project/myInfo.do", method=RequestMethod.GET)
	public ModelAndView ShowProjectPage(ModelAndView mv) {
		mv.setViewName("project/projectMyPage");
		return mv;
	}
	
	@RequestMapping(value="/project/subProject.do", method=RequestMethod.GET)
	public ModelAndView ShowSubProjectPage(ModelAndView mv) {
		mv.setViewName("project/subProjectPage");
		return mv;
	}
	
	@RequestMapping(value="/moim/workingSchedule.do", method=RequestMethod.GET)
	public ModelAndView showWorkingSchedule(ModelAndView mv) {
		
		mv.setViewName("moim/workingSchedule");
		return mv;
	}
	
	@RequestMapping(value="/moim/moimSide.do", method=RequestMethod.GET)
	public ModelAndView showMoimSide(ModelAndView mv) {
		
		mv.setViewName("moim/moimSide");
		return mv;
	}
	
	@RequestMapping(value="/moim/moimMain.do", method=RequestMethod.GET)
	public ModelAndView showMoimMain(ModelAndView mv) {
		
		mv.setViewName("moim/moimMain");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/moim/addStartTime.do", produces="text/plain;charset=utf-8", method=RequestMethod.GET)
	public String addStartTime(@ModelAttribute WorkingTime workingTime) {
		String resultVal = "";
		try {
			Date today = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
			String formattedDate = dateFormat.format(today);
			workingTime.setDateWithId(formattedDate+workingTime.getUserId());
			int result = pService.addStartTime(workingTime);
			System.out.println(workingTime);
			if(result > 0) {
				WorkingTime getOne = pService.getOneWorkingTime(workingTime.getDateWithId());
				resultVal = getOne.getUserId() + " 님" + getOne.getStartWork() + " 출근하셨습니다";
			} else {
				WorkingTime getOne = pService.getOneWorkingTime(workingTime.getDateWithId());
				resultVal = getOne.getUserId() + " 님" + getOne.getStartWork() + " 에 이미 출근하셨습니다";
			}
			
		} catch (Exception e) {
			WorkingTime getOne = pService.getOneWorkingTime(workingTime.getDateWithId());
			resultVal = getOne.getUserId() + " 님" + getOne.getStartWork() + " 에 이미 출근하셨습니다";
		}
		return resultVal;
	}
	
	@ResponseBody
	@RequestMapping(value="/moim/addEndTime.do", produces="text/plain;charset=utf-8", method=RequestMethod.GET)
	public String addEndTime(@ModelAttribute WorkingTime workingTime) {
		String resultVal = "";
		try {
			Date today = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
			String formattedDate = dateFormat.format(today);
			String dateWithId = formattedDate+workingTime.getUserId();
			WorkingTime getOne = pService.getOneWorkingTime(dateWithId);
			if(getOne != null) {
				int result = pService.addEndTime(getOne);
				if(result > 0) {
					WorkingTime getOneFinal = pService.getOneWorkingTime(dateWithId);
					resultVal = getOneFinal.getUserId() + " 님" + getOneFinal.getEndWork() + " 퇴근하셨습니다";
				}
			} else {
				resultVal = workingTime.getUserId() + " 님 먼저 출근하셔야 합니다";
			}
		} catch (Exception e) {
			resultVal = workingTime.getUserId() + " 님 먼저 출근하셔야 합니다";
		}
		
		return resultVal;
	}
	
	@ResponseBody
	@RequestMapping(value="/moim/teamWorkingTime.do", produces="application/json;charset=utf-8", method=RequestMethod.GET)
	public String showTeamWorkingTime(@RequestParam("dataVal") String dataVal) {
		List<WorkingTime> wList = pService.getTeamWorkingTime(dataVal);
		JSONArray jsonArr = new JSONArray();
		if(wList.size() > 0) {
			for(WorkingTime team : wList) {
				JSONObject json = new JSONObject();
				json.put("userId", team.getUserId());
				json.put("startWork", team.getStartWork());
				json.put("endWork", team.getEndWork());
				jsonArr.add(json);
			}
			System.out.println(jsonArr.toString());
			return jsonArr.toString();
		} else {
			return "noData";
		}
	}
}

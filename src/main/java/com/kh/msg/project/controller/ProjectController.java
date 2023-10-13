package com.kh.msg.project.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.kh.msg.project.domain.Project;
import com.kh.msg.project.domain.SideProject;
import com.kh.msg.project.domain.WorkingTime;
import com.kh.msg.project.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService pService;
	
	@RequestMapping(value="/project/myInfo.do", method=RequestMethod.GET)
	public ModelAndView ShowProjectPage(ModelAndView mv, HttpSession session) {
		List<Project> pList = pService.getProjectById("khuser01");
		mv.addObject("pList", pList);
		mv.setViewName("project/projectMyPage");
		return mv;
	}
	
	@RequestMapping(value="/project/createProject.do", method=RequestMethod.GET)
	public ModelAndView addProject(ModelAndView mv, @RequestParam("userId") String userId,
			@RequestParam("projectName") String projectName) {
		try {
			Map<String, String> paramMap = new HashMap<String, String>();
			// put() 메소드를 사용해서 key-value 설정을 함
			paramMap.put("userId", userId);
			paramMap.put("projectName", projectName);
			Project pro = pService.checkSameProjectName(paramMap);
			if(pro == null) {System.out.println("@@@@@@@@@@@@@");
				int result = pService.addProject(paramMap);
				System.out.println(result);
				if(result > 0) {System.out.println("################");
					List<Project> pList = pService.getProjectById(userId);
					mv.addObject("pList", pList);
					mv.setViewName("project/projectMyPage");
				} else {
					mv.addObject("msg", "프로젝트 생성 실패.관리자에게 문의하세요.");
					mv.addObject("url", "/project/myInfo.do");
					mv.setViewName("common/serviceFailed");
				}
			} else {
				mv.addObject("msg", "프로젝트 생성 실패.프로젝트 이름 중복.");
				mv.addObject("url", "/project/myInfo.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "프로젝트 생성 불가.관리자에게 문의하세요.");
			mv.addObject("url", "/project/myInfo.do");
			mv.setViewName("common/serviceFailed");
		}
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
	public ModelAndView showMoimMain(ModelAndView mv, @RequestParam("projectNo") Integer projectNo,
			@RequestParam("projectName") String projectName) {
		//List<SideProject> sList = pService.getSideProjectByNo();
		mv.addObject("projectName", projectName);
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
	public String showTeamWorkingTime(@ModelAttribute WorkingTime workingTime) {
		List<WorkingTime> wList = pService.getTeamWorkingTime(workingTime);
		JSONArray jsonArr = new JSONArray();
		if(wList.size() > 0) {
			for(WorkingTime team : wList) {
				JSONObject json = new JSONObject();
				json.put("userId", team.getUserId());
				json.put("startWork", team.getStartWork().toString());
				if(team.getEndWork() == null) {
					json.put("endWork", "퇴근 미처리");
				} else {
					json.put("endWork", team.getEndWork().toString());
				}
				jsonArr.add(json);
			}
			System.out.println(jsonArr.toString());
		} else {
			System.out.println(jsonArr.toString());
		}
		return jsonArr.toString();
	}
}

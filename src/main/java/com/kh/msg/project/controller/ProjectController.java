package com.kh.msg.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectController {

	@RequestMapping(value="/project/main.do", method=RequestMethod.GET)
	public ModelAndView ShowProjectPage(ModelAndView mv) {
		mv.setViewName("project/main");
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
}

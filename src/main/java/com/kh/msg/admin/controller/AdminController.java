package com.kh.msg.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.msg.admin.service.AdminService;
import com.kh.msg.member.domain.Member;
import com.kh.msg.notice.domain.PageInfo;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	
	@RequestMapping(value = "/admin/removeMember.do", method = RequestMethod.GET)
	public ModelAndView removeMember(ModelAndView mv
			, @RequestParam("memberId") String memberId) {
		try {
			int result = aService.deleteMember(memberId);
			if(result > 0) {
				mv.setViewName("redirect:/admin/memberList.do");
			}else {
				mv.addObject("msg", "회원 탈퇴 처리가 완료되지 않았습니다.");
				mv.addObject("error", "회원 탈퇴 처리 실패");
				mv.addObject("url", "/admin/memberList.do");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "회원 탈퇴 처리가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/admin/memberList.do");
			mv.setViewName("common/serviceFailed");
		}
	    return mv;
	}

	@RequestMapping(value="/admin/memberList.do", method=RequestMethod.GET)
	public ModelAndView showMemberListForm(ModelAndView mv) {
		mv.setViewName("admin/memberList");
		List<Member> mList = new ArrayList<Member>();
		return mv;
	}
	
//	@RequestMapping(value="/admin/memberList.do", method=RequestMethod.GET)
//	public ModelAndView showNoticeList(
//			@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
//			, ModelAndView mv) {
//		try {
//			Integer totalCount = aService.getListCount();
//			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
//			List<Member> mList = aService.selectMemberList(pInfo);
//			if(!mList.isEmpty()) {
//				mv.addObject("mList", mList).addObject("pInfo", pInfo).setViewName("admin/memberList");
//			} else {
//				mv.addObject("msg", "회원 전체 조회가 완료되지 않았습니다.");
//				mv.addObject("error", "회원 조회 실패");
//				mv.addObject("url", "/index.do");
//				mv.setViewName("common/serviceFailed");
//			}
//		} catch (Exception e) {
//			mv.addObject("msg", "회원 조회가 완료되지 않았습니다.");
//			mv.addObject("error", e.getMessage());
//			mv.addObject("url", "/index.do");
//			mv.setViewName("common/serviceFailed");
//		}
//		return mv;
//	}
	
	@RequestMapping(value="/admin/noticeList.do", method=RequestMethod.GET)
	public ModelAndView showNListForm(ModelAndView mv) {
		mv.setViewName("admin/noticeList");
		return mv;
	}
	
	
	private PageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		PageInfo pInfo = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		
		return pInfo;
	}
}

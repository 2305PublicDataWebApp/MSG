package com.kh.msg.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.msg.user.domain.User;
import com.kh.msg.user.service.UserService;
import com.kh.msg.user.store.UserStore;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;

	@RequestMapping(value="/user/register2.do", method=RequestMethod.GET)
	public String showRegisterForm() {
		return "/user/register2";
	}
	
	@RequestMapping(value="/user/register2.do", method=RequestMethod.POST)
	public String registeruser(
//			@RequestParam("userId") String userId
			@ModelAttribute User user
			, Model model) {
		try {
			// INSERT INTO user_TBL
			int result = service.insertuser(user);
			if(result > 0) {
				// 성공하면 로그인 페이지
				// home.jsp가 로그인할 수 있는 페이지가 되면 됨!!
				return "redirect:/index.jsp";
			}else {
				// 실패하면 에러페이지로 이동
				model.addAttribute("msg", "회원가입이 완료되지 않았습니다.");
				model.addAttribute("error", "회원가입 실패");
				model.addAttribute("url", "/user/register2.do");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의해주세요.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/user/register2.do");
			return "common/errorPage";
		}
	}
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	public String postRegister(MemberStore vo) throws Exception {
//		int result = service.idChk(vo);
//		try {
//			if( result == 1) {
//				return "/user/register";
//			}else if(result == 0){
//				service.register(vo);
//			}
//		}catch (Exception e) {
//			// TODO: handle exception
//			throw new RuntimeException();
//		}
//		return "redirect:/";
//	}
	
	@RequestMapping(value="/user/update.do", method=RequestMethod.POST)
	public String modifyuser(@ModelAttribute User user, Model model) {
		try {
			String userId = user.getUserId();
			int result = service.updateUser(user);
			if(result > 0) {
				return "redirect:/index.jsp";
			}else {
				model.addAttribute("msg", "회원 정보 수정이 완료되지 않았습니다.");
				model.addAttribute("error", "회원정보 수정 실패");
				model.addAttribute("url", "/user/mypage.do?userId"+userId);
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의해주세요.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/index.jsp");
			return "common/errorPage";
		}
	}
	@RequestMapping(value="/user/delete.do", method=RequestMethod.GET)
	public String outServiceMember(
			@RequestParam("userId") String userId
			, Model model) {
		try {
			int result = service.deleteUser(userId);
			if(result > 0) {
				return "redirect:/user/logout.do";
			}else {
				model.addAttribute("msg", "회원 탈퇴가 완료되지 않았습니다.");
				model.addAttribute("error", "회원탈퇴 실패");
				model.addAttribute("url", "/index.jsp");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의해주세요.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/index.jsp");
			return "common/errorPage";
		}
	}

	@RequestMapping(value="/user/login.do", method=RequestMethod.POST)
	public String userLoginCheck(
			@ModelAttribute User user
			, HttpSession session
			, Model model) {
		try {
			// SELECT * FROM user_TBL WHERE user_ID = ? AND user_PW = ?
			User mOne = service.checkUserLogin(user);
			if(mOne != null) {
				// 성공하면 메인페이지로 이동
				session.setAttribute("userId", mOne.getUserId());
				session.setAttribute("userName", mOne.getUserName());
				return "redirect:/index.jsp";
			}else {
				// 실패하면 에러페이지로 이동
				model.addAttribute("msg", "로그인이 완료되지 않았습니다.");
				model.addAttribute("error", "로그인 실패");
				model.addAttribute("url", "/index.jsp");
				return "common/errorPage";
			}			
			
//			int result = service.checkMemberLogin(member);
//			if(result > 0) {
//				// 성공하면 메인페이지로 이동
//				session.setAttribute("memberId", member.getMemberId());
//				return "redirect:/index.jsp";
//			}else {
//				// 실패하면 에러페이지로 이동
//				model.addAttribute("msg", "로그인이 완료되지 않았습니다.");
//				model.addAttribute("error", "로그인 실패");
//				model.addAttribute("url", "/index.jsp");
//				return "common/errorPage";
//			}			
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의해주세요.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/user/register.do");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="/user/logout.do", method=RequestMethod.GET)
	public String userLogout(HttpSession session, Model model) {
		if(session != null) {
			session.invalidate();
			return "redirect:/index.jsp";
		}else {
			model.addAttribute("msg", "로그아웃을 완료하지 못하였습니다.");
			model.addAttribute("error", "로그아웃 실패");
			model.addAttribute("url", "/index.jsp");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="/user/mypage.do", method=RequestMethod.GET)
	public String showMyPage(
			// 쿼리스트링 받기 위해서 RequestParam 써줌
			@RequestParam("userId") String userId
			// 모델에 키와 값으로 데이터를 넣어주면 jsp에서 꺼내서 사용가능
			, Model model) {
		// SELECT * FROM MEMBER_TBL WHERE MEBER_ID = ?
		// Exception발생 시 에러메시지를 출력하기 위해 try ~ catch 설정해줌
		try {
			User user = service.getUserById(userId);
			if(user != null) {
				model.addAttribute("user", user);
				return "user/mypage";
			}else {
				model.addAttribute("msg", "회원 정보 조회를 완료하지 못하였습니다.");
				model.addAttribute("error", "마이페이지 조회 실패");
				model.addAttribute("url", "/index.jsp");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의해주세요.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/index.jsp");
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="/member/update.do", method=RequestMethod.GET)
	public String showModifyForm(
			String userId
			, Model model) {
		User user = service.getUserById(userId);
		model.addAttribute("user", user);
		return "user/modify";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(UserStore vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
	
	
	

	
}









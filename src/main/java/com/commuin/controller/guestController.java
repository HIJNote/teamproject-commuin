package com.commuin.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.commuin.service.GuestService;
import com.commuin.vo.Channel;
import com.commuin.vo.SessionValue;
import com.commuin.vo.User;

@Controller
@RequestMapping("/member")
public class guestController {

	@Autowired
	GuestService service;
	
	//로그인 페이지
	@RequestMapping("/login")
	public String loginPage() {
	
		return "/guest/login";
	}
	
	//구독목록 테스트
	@RequestMapping(value = "/subscribe", method = RequestMethod.POST)
	@ResponseBody
	public List<Channel> subscribe(@RequestParam("userName") String userName) {
		System.out.println("---Guest.subscribe()---");
		List<Channel> list = service.subscribe(userName);		
		return list;
	}
	
	//회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinPage(Locale locale, Model model) {
		return "/guest/join";
	}
	//회원가입 메소드
		@RequestMapping(value = "/userJoin", method = RequestMethod.POST)
		public String userJoin(@RequestParam("joinEmail") String joinEmail, @RequestParam("joinId") String joinId,
				@RequestParam("joinPwd") String joinPwd, @RequestParam("joinName") String joinName ) {
			User userTest = new User();
			userTest.setU_id(joinId);
			userTest.setU_pw(joinPwd);
			userTest.setU_name(joinName);
			userTest.setU_email(joinEmail);	
			service.join(userTest);				
			
			return "guest/login";
		}
	
		//로그인
		@RequestMapping(value = "/success", method = RequestMethod.POST)
		public String loginSucess(@RequestParam("l-id") String l_id, @RequestParam("l-pwd") String l_pwd,
				HttpServletRequest req, RedirectAttributes rttr) {
			System.out.println("---Guest.loginSucess()---");
			User userInfo = new User();
			userInfo.setU_id(l_id);
			userInfo.setU_pw(l_pwd);
			
			HttpSession session = req.getSession();
			String path = null;
			//id 체크
			User user = service.loginCheck(userInfo);
			
			if(user != null) {
				/*
				 * 세션객체 생성
				 */
				
				SessionValue sessionValue=new SessionValue();
				sessionValue.setSessionId(user.getU_id());
				sessionValue.setSessionName(user.getU_name());
				sessionValue.setSessionPoint(user.getU_pt());
				sessionValue.setSessionLevel(user.getU_lv());
				sessionValue.setSessionJoindate(user.getU_joindate());
				sessionValue.setSessionEmail(user.getU_email());
				
				session.setAttribute("sessionValue", sessionValue);			
				
				
				path = "redirect:/";
		
			} else {
				System.out.println("로그인 실패");
				rttr.addFlashAttribute("msg", false);
				path = "redirect:/member/login";
			}
			
			System.out.println(path);
			return path;
		}
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String loginSucess(HttpSession session) {		
			session.invalidate();	
			return "redirect:/";
		}
		
		//아이디 or 비밀번호 찾기 페이지
		@RequestMapping(value = "/search", method = RequestMethod.GET)
		public String memberSearch() {
			return "guest/memberSearch";
		}
		
		//게시글 생성 페이지
	//	@RequestMapping(value = "/board/create", method = RequestMethod.GET)
	//	public String boardCreate(Locale locale, Model model) {
	//		return "guest/commuin-board-create";
	//	}
		
		@RequestMapping(value = "/joinIdCheck", method = RequestMethod.POST)
		@ResponseBody
		public int idCheck(@RequestParam("id") String id) {
			System.out.println("완료" + id);
			int cnt = service.idCheck(id);
			System.out.println(cnt);
	 		return cnt;
		}
		
		@RequestMapping(value = "/joinNameCheck", method = RequestMethod.POST)
		@ResponseBody
		public int nameCheck(@RequestParam("name") String name) {
			System.out.println("완료" + name);
			int cnt = service.nameCheck(name);
			System.out.println(cnt);
	 		return cnt;
		}
		
		@RequestMapping(value = "/joinEmailCheck", method = RequestMethod.POST)
		@ResponseBody
		public int emailCheck(@RequestParam("email") String email) {
			System.out.println("완료, " + email);
			int cnt = service.emailCheck(email);
			System.out.println(cnt);
	 		return cnt;
		}
		//아이디 or 비밀번호 찾기
		@RequestMapping(value = "/searchMember", method = RequestMethod.POST)
		public String searchMember(@RequestParam("s-email") String u_email, @RequestParam("s-id") String u_id,
	        RedirectAttributes rttr) {
	      
			if(u_email.equals("") && u_id.equals("")) {
				rttr.addFlashAttribute("inputError", "error");
			}
	
			if(!u_email.equals("")) {         
				String id = service.searchId(u_email);
				if(id != null) {
					rttr.addFlashAttribute("searchId", id);
				} else {
					rttr.addFlashAttribute("searchId", "error");
				}
			}
	      
			if(!u_id.equals("")) {
				String pwd = service.searchPwd(u_id);
				
	            if(pwd != null) {
	                rttr.addFlashAttribute("searchPwd", pwd);
	            }
	         	else {
	         		rttr.addFlashAttribute("searchPwd", "error");
	            }
			}
	      return "redirect:/member/search";
		}
	
		//(회원)가입시 이메일 전송
		@RequestMapping(value="emailCheck", method=RequestMethod.POST)
		@ResponseBody
		public String emailCheck(HttpServletRequest req, @RequestParam("u_email") String u_email) {
			service.emailCheck(req, u_email);
			
			return (String) req.getSession().getAttribute("key");
		}	
	
}

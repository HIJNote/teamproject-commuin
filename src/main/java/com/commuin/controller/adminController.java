package com.commuin.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.commuin.persistence.HostDao;
import com.commuin.service.BoardService;
import com.commuin.service.HostService;
import com.commuin.vo.Board;
import com.commuin.vo.Board_Reply;
import com.commuin.vo.Reply;
import com.commuin.vo.SessionValue;
import com.commuin.vo.User;

@RequestMapping("/admin")
@Controller
public class adminController {

	private static final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	@Autowired
	HostService service;
	
	@Autowired
	HostDao dao;
	
	@Autowired
	BoardService Bdao;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(@SessionAttribute SessionValue sessionValue, HttpServletRequest req, Model model) {
		if(sessionValue.getSessionId()==null)
			return "redirect:/login";
		
		service.mainInfo(req, model);
		
		return "admin/adminMainPage";
	}
	// 유저 리스트
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String userList(@SessionAttribute SessionValue sessionValue, HttpServletRequest req, Model model) {
		if(sessionValue.getSessionId()==null)
			return "redirect:/login";
		
		service.userList(req, model);
		
		return "admin/userList";
	}
	// 정지, 휴면 - > 정상 변경
	@RequestMapping(value = "/userNormal", method = RequestMethod.GET)
	public String userNormal(@SessionAttribute SessionValue sessionValue, HttpServletRequest req, Model model) {
		if(sessionValue.getSessionId()==null)
			return "redirect:/login";
		
		service.userNormal(req, model);
		
		return "admin/alert";
	}
	
	// 일반 - > 정지회원으로 변경
	@RequestMapping(value = "/userStop", method = RequestMethod.GET)
	public String userStop(@SessionAttribute SessionValue sessionValue, HttpServletRequest req, Model model) {
		if(sessionValue.getSessionId()==null)
			return "redirect:/login";
		
		service.userStop(req, model);
		
		return "admin/alert";
	}
	
	// 유저 정보
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	@ResponseBody
	public User userInfo(@SessionAttribute SessionValue sessionValue, User user) {
		
		return dao.userInfo(user.getU_name());
	}
	
	//게시글 관리 페이지
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String userBoardList(@SessionAttribute SessionValue sessionValue, HttpServletRequest req, Model model) {
		if(sessionValue.getSessionId()==null)
			return "redirect:/login";
		
		service.boardList(req, model);
		
		return "admin/userBoardList";
	}
	
	// 게시글 정보
	@RequestMapping(value = "/board_Info", method = RequestMethod.GET)
	@ResponseBody
	public Board_Reply boardInfo(@SessionAttribute SessionValue sessionValue, Board board) {
		
		Board_Reply br = new Board_Reply();
		br.setBoard(dao.board_Info(board.getB_id()));
		br.setReply(dao.reply_Info(board.getB_id()));
		
		return br;
	}
	
	// 댓글 작성
	@RequestMapping(value = "/replyInsert", method = RequestMethod.GET)
	@ResponseBody
	public int replyInsert(@SessionAttribute SessionValue sessionValue, Reply reply) {
			int replyId = dao.replyInsert(reply);
			dao.board_Reply_Count_Update(reply);
			int cnt = dao.reply_Count(reply.getB_id());
			System.out.println(reply.toString());
			System.out.println(replyId);
			//포인트 추가
			dao.replyBoardPoint(reply.getU_name());
			sessionValue.setSessionPoint(Bdao.checkPoint(sessionValue.getSessionId()));
		return replyId;
	}
		
	//댓글 삭제
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	@ResponseBody
	public void replyDelete(@SessionAttribute SessionValue sessionValue, Reply reply) {
		dao.replyDelete(reply);
		dao.boardReplyCountDown(reply);
		System.out.println("reply_id : " + reply.getRp_id() +" Delete : 0 -> 1 변경완료");
	}
	
	// 게시글 상태 변경
	@RequestMapping(value = "/boardChange", method = RequestMethod.GET)
	public String boardChange(@SessionAttribute SessionValue sessionValue, HttpServletRequest req, Model model) {
		if(sessionValue.getSessionId()==null)
			return "redirect:/login";
		
		service.boardChange(req, model);
		
		return "admin/alert";
	}
	
	// 공지글 작성 페이지 이동
	@RequestMapping(value = "/bulletinWrite", method = RequestMethod.GET)
	public String bulletinWrite(@SessionAttribute SessionValue sessionValue, Locale locale, Model model) {
		if(sessionValue.getSessionId()==null)
			return "redirect:/login";
		
		return "admin/bulletinWrite";
	}
	
	// 공지글 작성 페이지 이동
	@RequestMapping(value = "/adminBoardInsert", method = RequestMethod.POST)
	public String adminBoardInsert(@SessionAttribute SessionValue sessionValue, HttpServletRequest req, Model model) {
		if(sessionValue.getSessionId()==null)
			return "redirect:/login";
		
		service.adminBoardInsert(req, model);
		
		return "admin/alert";
	}
	
	// 공지글 작성 페이지 이동
	@RequestMapping(value = "/channelList", method = RequestMethod.GET)
	public String channelList(@SessionAttribute SessionValue sessionValue, HttpServletRequest req, Model model) {
		if(sessionValue.getSessionId()==null)
			return "redirect:/login";
		
		service.adminChannelList(req, model);
		
		return "admin/channelList";
	}
	
	// 채널 일반 -> 메인 승급
	@RequestMapping(value = "/channelChange", method = RequestMethod.GET)
	public String channelChange(@SessionAttribute SessionValue sessionValue, HttpServletRequest req, Model model) {
		if(sessionValue.getSessionId()==null)
			return "redirect:/login";
		
		service.channelChange(req,model);
		
		return "admin/alert";
	}
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String bulletinWrite() {
		
		return "admin/error";
	}
}

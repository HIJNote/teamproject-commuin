package com.commuin.service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.commuin.persistence.HostDao;
import com.commuin.vo.Emoticon;
import com.commuin.vo.User;
import com.commuin.vo.Board;
import com.commuin.vo.Channel;
import com.commuin.vo.Chart;

@Service
public class HostServiceImpl implements HostService {
	@Autowired
	HostDao dao;
	
	// 관리자 메인페이지 정보 조회
	@Override
	public void mainInfo(HttpServletRequest req, Model model) {
		LocalDate now = LocalDate.now();
		
		ArrayList<Emoticon> bestET = dao.emoticonInfo(); // 이모티콘 판매 정보 검색 
		ArrayList<Chart> dc = dao.dayInfo(now.getMonthValue()); // 일 별 회원 누적 접속 수 조회
		ArrayList<User> ji = dao.joinInfo(); // 오늘 회원 가입자, 오늘 회원 가입 수, 누적 회원 수 조회
		ArrayList<Board> bi = dao.boardInfo(); // 오늘 등록된 게시글, 오늘 등록된 게시글 수, 누적 게시글 수 조회
		ArrayList<Board> qi = dao.boardQuestionInfo(); // 오늘 등록된 문의 글, 으늘 등록된 문의 글 수, 누적 문의 글 수
		ArrayList<User> ur = dao.userRank(); // 회원 랭크
		
		
		int u_TodayJoinCnt = 0; // 오늘 하루 가입자 수
		int u_accumulateJoinCnt = 0; // 누적 가입자 수
		int b_accumulateboardCnt = 0; // 누적 게시글 수
		int b_TodayboardCnt = 0; // 하루 게시글 등록 수
		int b_Accumulate_Q_Cnt = 0; // 누적 문의글 수
		int b_Today_Q_Cnt = 0; // 오늘 등록된 문의 글 수
		
		for(User user : ji) {
			u_TodayJoinCnt = user.getU_TodayJoinCnt();
			u_accumulateJoinCnt = user.getU_accumulateJoinCnt();
			break;
		}
		for(Board board : bi) {
			b_accumulateboardCnt = board.getB_accumulateboardCnt();
			b_TodayboardCnt = board.getB_TodayboardCnt();
			break;
		}
		for(Board board : qi) {
			b_Accumulate_Q_Cnt = board.getB_Accumulate_Q_Cnt();
			b_Today_Q_Cnt = board.getB_Today_Q_Cnt();
			break;
		}
		
		model.addAttribute("bestET", bestET); 
		model.addAttribute("dc", dc); 
		model.addAttribute("ji", ji);
		model.addAttribute("bi", bi);
		model.addAttribute("ur", ur);
		model.addAttribute("qi", qi);
		
		model.addAttribute("u_TodayJoinCnt", u_TodayJoinCnt);
		model.addAttribute("u_accumulateJoinCnt", u_accumulateJoinCnt);
		model.addAttribute("b_TodayboardCnt", b_TodayboardCnt);
		model.addAttribute("b_accumulateboardCnt", b_accumulateboardCnt);
		model.addAttribute("b_Today_Q_Cnt", b_Today_Q_Cnt);
		model.addAttribute("b_Accumulate_Q_Cnt", b_Accumulate_Q_Cnt);
	}
	
	// 회원 리스트
	@Override
	public void userList(HttpServletRequest req, Model model) {
		ArrayList<User> userAll = dao.userAllList(); // 회원 리스트
		ArrayList<User> userOld = dao.userOldList(); // 휴면 회원 리스트
		ArrayList<User> userCnt = dao.userCnt(); // 회원 각 리스트 별 수
		
		int allCnt = 0;
		int oldCnt = 0;
		int stopCnt = 0;
		int blackCnt = 0;
		int removeCnt = 0;
		
		for(User vo : userCnt) {
			allCnt = vo.getAllCnt();
			oldCnt = vo.getOldCnt();
			stopCnt = vo.getStopCnt();
			blackCnt = vo.getBlackCnt();
			removeCnt = vo.getRemoveCnt();
		}
		
		model.addAttribute("userAllList", userAll);
		model.addAttribute("userOldList", userOld);
		model.addAttribute("allCnt", allCnt);
		model.addAttribute("oldCnt", oldCnt);
		model.addAttribute("stopCnt", stopCnt);
		model.addAttribute("blackCnt", blackCnt);
		model.addAttribute("removeCnt", removeCnt);
	}
	
	// 상태 : 휴면 -> 정상 변경
	@Override
	public void userNormal(HttpServletRequest req, Model model) {
		String name = req.getParameter("name");
		
		int cnt = dao.userNormal(name);
		
		model.addAttribute("cnt", cnt);
	}
	
	// 상태 : 정상 -> 정지 변경
	@Override
	public void userStop(HttpServletRequest req, Model model) {
		String name = req.getParameter("name");
		int state = Integer.parseInt(req.getParameter("state"));
		int cnt = 0;
		
		if(state == 0 || state == 1) {
			cnt = dao.userStop(name);
			model.addAttribute("cnt", cnt+2);
			return;
		}else {
			model.addAttribute("cnt", cnt+10);
			return;
		}
		
	}
	
	// 게시글 목록 리스트
	@Override
	public void boardList(HttpServletRequest req, Model model) {
		ArrayList<Board> b_All_List = dao.boardAllList(); // 전체 게시글 조회
		ArrayList<Board> b_Announcement_List = dao.b_Announcement_List(); // 전체 공지글 조회
		ArrayList<Board> b_Question_List = dao.b_Question_List(); // 전체 문의글 조회
		ArrayList<Board> b_Delete_List = dao.b_Delete_List(); // 전체 블라인드 글 조회
		
		int b_All_Cnt = 0; // 전체 게시 글 수
		int b_Announcement_Cnt = 0; // 전체 공지 글 수
		int b_Question_Cnt = 0; // 전체 문의 글 수
		int b_Delete_Cnt = 0; // 전체 블라인드 글 수
		
		for(Board board : b_All_List) {
			b_All_Cnt = board.getB_Today_Q_Cnt();
			break;
		}
		for(Board board : b_Announcement_List) {
			b_Announcement_Cnt = board.getB_Today_Q_Cnt();
			break;
		}
		for(Board board : b_Question_List) {
			b_Question_Cnt = board.getB_Today_Q_Cnt();
			break;
		}
		for(Board board : b_Delete_List) {
			b_Delete_Cnt = board.getB_Today_Q_Cnt();
			break;
		}
		
		model.addAttribute("b_All_Cnt", b_All_Cnt);
		model.addAttribute("b_Announcement_Cnt", b_Announcement_Cnt);
		model.addAttribute("b_Question_Cnt", b_Question_Cnt);
		model.addAttribute("b_Delete_Cnt", b_Delete_Cnt);
		
		model.addAttribute("b_All_List", b_All_List);
		model.addAttribute("b_Announcement_List", b_Announcement_List);
		model.addAttribute("b_Question_List", b_Question_List);
		model.addAttribute("b_Delete_List", b_Delete_List);
	}

	// 신고 게시글 -> 일반 게시글 변경
	@Override
	public void boardChange(HttpServletRequest req, Model model) {
		
		int num = Integer.parseInt(req.getParameter("num")); // 일반 글 -> 신고 글 전환인지 신고 글 -> 일반 글 전환인지 확인 용 번호
		int cnt = 0;

		Board vo = new Board();
		vo.setB_id(Integer.parseInt(req.getParameter("b_id")));
		vo.setB_blinddate(new Timestamp(System.currentTimeMillis()));
		
		if(num == 0) {
			cnt = dao.board_R_Change(vo);
		}else if(num == 1) {
			cnt = dao.board_D_Change(vo);
		}
		if(cnt == 1) { // 업데이트 성공 시
			if(num == 0) {
				model.addAttribute("cnt", 4);
			}else if(num == 1) {
				model.addAttribute("cnt", 5);
			}
			
		}else if(cnt != 1) { // 업데이트 실패 시
			model.addAttribute("cnt", 11);
		}
	}
	
	// 공지 글 작성
	@Override
	public void adminBoardInsert(HttpServletRequest req, Model model) {
		String u_name = req.getParameter("u_name");
		String title = req.getParameter("title");
		String ch_Name = "공지 사항";
		String b_Content = req.getParameter("b_content");
		Board vo = new Board();
		vo.setU_name(u_name);
		vo.setB_title(title);
		vo.setCh_name(ch_Name);
		vo.setB_content(b_Content);
		
		int cnt = dao.adminBoardInsert(vo);
		
		if(cnt == 1) {
			model.addAttribute("cnt", 6); // 성공할 경우
		}else if(cnt != 1) {
			model.addAttribute("cnt", 15); // 실패할경우
		}
	}
	
	// 채널 리스트
	@Override
	public void adminChannelList(HttpServletRequest req, Model model) {
		ArrayList<Channel> c_All_List = dao.adminChannelList();
		
		model.addAttribute("c_All_List", c_All_List);
	}
	
	// 채널 일반 -> 메인 승급
	@Override
	public void channelChange(HttpServletRequest req, Model model) {
		int ch_id = Integer.parseInt(req.getParameter("ch_id"));
		int ch_grade = Integer.parseInt(req.getParameter("ch_grade")); // 0 : 일반, 1 : 메인 승급
		
		Channel channel = new Channel();
		channel.setCh_id(ch_id);
		channel.setCh_grade(ch_grade);
		
		dao.channelChange(channel);

		if(ch_grade == 1) {
			model.addAttribute("cnt", 7);
		}else if(ch_grade == 0) {
			model.addAttribute("cnt", 8);
		}else {
			model.addAttribute("cnt", 15);
		}
	}
}

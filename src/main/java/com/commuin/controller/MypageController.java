package com.commuin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.commuin.service.BoardService;
import com.commuin.service.EmoticonService;
import com.commuin.service.ReplyService;
import com.commuin.service.ScrapService;
import com.commuin.vo.Board;
import com.commuin.vo.Reply;
import com.commuin.vo.Scrap;
import com.commuin.vo.SessionValue;
import com.commuin.vo.User;
import com.commuin.vo.UserEmoticon;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	ReplyService replyService;
	@Autowired
	BoardService boardService;
	@Autowired
	ScrapService scrapService;
	@Autowired
	EmoticonService emoticonService;

	/*
	 * 내 게시글, 내댓글,스크랩글, 내가구매한 이모티콘,
	 */
	@RequestMapping
	public String mypage(@SessionAttribute SessionValue sessionValue, User user, Model model, Board board, Reply reply,
			UserEmoticon userEmoticon, Scrap scrap) {
		if (sessionValue == null)
			return "/member/login";

		user.setU_id(sessionValue.getSessionName());
		user.setU_name(sessionValue.getSessionName());
		/*
		 * 1.게시글 받기 2.댓글 받기 3. 스크랩글 받기 4.이모티콘 받기
		 */
		model.addAttribute("reply", replyService.getMypageReplyList(user, reply));
		model.addAttribute("board", boardService.getMypageBoardList(user, board));
		model.addAttribute("scrap", scrapService.getMypageScrapList(user, scrap));
		model.addAttribute("userEmoticon", emoticonService.getMypageEmoticonList(user, userEmoticon));
		model.addAttribute("boardCount", boardService.getMyBoardCount(user, board));
		model.addAttribute("replyCount", replyService.getMyReplyCount(user,reply));
		model.addAttribute("scrapCount", scrapService.getMyScrapCount(user,scrap) );
		model.addAttribute("userEmoticonCount", emoticonService.getMyEmoticonCount(user,userEmoticon) );
		return "mypage/mypage";
	}

}

package com.commuin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.commuin.paging.PageMaker;
import com.commuin.persistence.BoardDao;
import com.commuin.persistence.HostDao;
import com.commuin.service.BoardService;
import com.commuin.service.ChannelService;
import com.commuin.service.EmoticonService;
import com.commuin.service.FollowService;
import com.commuin.service.ScrapService;
import com.commuin.service.SubscribeService;
import com.commuin.service.TagService;
import com.commuin.vo.Board;
import com.commuin.vo.Channel;
import com.commuin.vo.Emoticon;
import com.commuin.vo.EmoticonList;
import com.commuin.vo.Follow;
import com.commuin.vo.Reply;
import com.commuin.vo.Scrap;
import com.commuin.vo.SessionValue;
import com.commuin.vo.Subscribe;
import com.commuin.vo.Tag;
import com.commuin.vo.UserEmoticon;

@Controller
@RequestMapping("/board")

public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	ChannelService channelService;
	@Autowired
	TagService tagService;
	@Autowired
	SubscribeService subscribeService;
	@Autowired
	ScrapService scrapService;
	@Autowired
	FollowService followService;
	@Autowired
	EmoticonService emoticonService;
	@Autowired
	BoardDao dao;
	@Autowired
	HostDao hDao;

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("---BoardController.searchConditionMap()---");
		Map<String, String> conditionMap = new LinkedHashMap<String, String>();
		conditionMap.put("??????", "title");
		conditionMap.put("??????", "content");
		conditionMap.put("?????????", "writer");
		conditionMap.put("??????+??????", "title_content");
		return conditionMap;
	}

	/*
	 * 1.?????? ???????????? ????????????. 2.?????? id??? ?????? ????????? ????????????. + ???????????? ??????????????? 3.?????? ???????????? ?????? ????????? ???????????? ?????????
	 * ???????????? ????????????. 4.??? ???????????? ?????? ????????? id??? ??????????????? ????????????. 0->X 1->????????? 5.view??? ?????????.
	 */
	@RequestMapping
	public String boardList(@SessionAttribute(required = false) SessionValue sessionValue, Channel channel, Tag tag,
			Subscribe subscribe, Model model, Board board, Scrap scrap,
			@RequestParam(name = "p", defaultValue = "1") int p,
			@RequestParam(name = "target", required = false) String target,
			@RequestParam(name = "tagName", required = false) String tagName) {
	
		// ?????? ????????? ?????????
		
		if (board.getSearchCondition() == null) {
			board.setSearchCondition("title");
		} else {
			model.addAttribute("option", board.getSearchCondition());
		}

		if (board.getSearchKeyword() == null) {
			board.setSearchKeyword("");
		} else {
			model.addAttribute("keyword", board.getSearchKeyword());
		}

		if (target != null) {
			board.setTarget(target);
			model.addAttribute("target", target);
		}

		if (tagName != null) {
			board.setB_tag(tagName);
			model.addAttribute("tagName", tagName);
		}
		

		// ?????? ????????????. ????????? ???????????????
		if (board.getB_id() != 0) {
			Board getBoard = boardService.getBoard(board);
			model.addAttribute("thisBoard", getBoard);
		}
		/*
		 * ??????->???????????? ????????? ????????????
		 */
		if (sessionValue != null) {
			UserEmoticon userEmoticon = new UserEmoticon();
			userEmoticon.setU_name(sessionValue.getSessionName());
			List<UserEmoticon> emoticonList = emoticonService.getUserEmoticonList(userEmoticon);
			model.addAttribute("emo", emoticonList);
		}

		// ??????????????? ????????????.
		channel = channelService.getChannel(channel);
		model.addAttribute("channel", channel);

		// ?????????????????????
		tag.setCh_id(channel.getCh_id());
		List<Tag> tagList = tagService.getTagList(tag);
		model.addAttribute("tagList", tagList);

		// ?????????,???????????? ??????

		if (sessionValue != null) {
			subscribe.setCh_id(channel.getCh_id());
			subscribe.setU_name(sessionValue.getSessionName());
			scrap.setB_id(board.getB_id());
			scrap.setU_name(sessionValue.getSessionName());
			model.addAttribute("subscribe", subscribeService.getSubscribeCheck(subscribe));
			model.addAttribute("scrap", scrapService.checkScrap(scrap));
		} else {
			model.addAttribute("subscribe", 0);
			model.addAttribute("scrap", 0);
		}
		// ????????? ??? ?????? ??????
		board.setCh_id(channel.getCh_id());
		// ????????? ?????? ??? ????????? ???
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(p);
		pageMaker.setPerPageNum(10);
		model.addAttribute("p", p);
		board.setPageMaker(pageMaker);
		pageMaker.setTotalCount(boardService.getBoardCount(board));
		List<Board> list = boardService.getBoardList(board);
		
	

		model.addAttribute("board", list);
		model.addAttribute("pageMaker", pageMaker);
		List<Board> noticeBoard=boardService.getNoticeList(board);
		model.addAttribute("noticeBoard", noticeBoard);

		// ??????
		if (board.getB_id() != 0) {
			int count = boardService.reply(board.getB_id());

			if (count != 0) {
				List<Reply> replyList = boardService.replyList(board.getB_id());

			

				model.addAttribute("replyList", replyList);
			}
		}
		return "board/board";
	}

	@RequestMapping(value = "/write")
	public String boardWrite(@SessionAttribute(required = false) SessionValue sessionValue, Channel channel, Tag tag,
			Model model,@RequestParam(name="check",required = false) String check) {
		if (sessionValue == null)
			return "redirect:/member/login";
		if(check!=null)
			model.addAttribute("check", check);
	
		tag.setCh_id(channel.getCh_id());
		List<Tag> tagList = tagService.getTagList(tag);
		model.addAttribute("tag", tagList);
		model.addAttribute("channel", channel);
		return "board/write";
	}

	@RequestMapping(value = "/content", method = RequestMethod.POST)
	public String content(@SessionAttribute SessionValue sessionValue, Channel channel, Board board) {

		board.setU_name(sessionValue.getSessionName());
		board.setCh_name(channel.getCh_name());
		board.setCh_id(channel.getCh_id());
		
		hDao.replyBoardPoint(sessionValue.getSessionName());
		sessionValue.setSessionPoint(dao.checkPoint(sessionValue.getSessionId()));

		Board boardInfo = boardService.boardInsert(board);

		return "redirect:/board?ch_id=" + channel.getCh_id() + "&" + "b_id=" + boardInfo.getB_id();
	}

	

	@RequestMapping(value = "/subscribe")
	@ResponseBody
	public Map<String,String> subscribe(@SessionAttribute(required = false) SessionValue sessionValue, 
			Subscribe subscribe,Channel channel) {
		Map<String,String> map=new HashMap<String, String>();
		if (sessionValue == null)
			return null;
		subscribe.setU_name(sessionValue.getSessionName());
		if (subscribeService.getSubscribeCheck(subscribe) == 0) {
			subscribeService.addSubscribe(subscribe);
			map.put("msg", "1");
			channel=channelService.getChannel(channel);
			map.put("count",channel.getCh_subscribe()+"");			
		} else {
			subscribeService.removeSubscribe(subscribe);
			map.put("msg", "0");
			channel=channelService.getChannel(channel);
			map.put("count",channel.getCh_subscribe()+"");		
		}
		return map;

	}

	// ??????????????? Ajax
	@RequestMapping(value = "/scrap")
	@ResponseBody
	public int scrap(@SessionAttribute(required = false) SessionValue sessionValue, Scrap scrap) {


		if (sessionValue == null)
			return 2;
		scrap.setU_name(sessionValue.getSessionName());
		return scrapService.updateScrap(scrap);
	}

	@RequestMapping(value = "/follow")
	@ResponseBody
	public Map<String, String> follow(@SessionAttribute(required = false) SessionValue sessionValue, Board board,
			Follow follow) {
		Map<String, String> map = new HashMap<String, String>();
		if (sessionValue == null||board==null) {
			return null;
		}

		
			follow.setB_id(board.getB_id());
			follow.setU_name(sessionValue.getSessionName());
			
			if (followService.checkFollow(follow) != 1) {
				followService.insertFollow(follow);

				map.put("msg", "?????????????????????!");
				map.put("follow", followService.getCount(follow) + "");
				
				return map;
			}else {
				map.put("msg", "?????? ?????????????????????.");
				map.put("follow", followService.getCount(follow) + "");
				
			}
		
		return map;

	}

	// ????????? ??????
	@RequestMapping(value = "/imageConvert", method = RequestMethod.POST)
	@ResponseBody
	public String imageConvert(@RequestParam("file") MultipartFile multipartFile,HttpSession session) {
			
		String path = session.getServletContext().getRealPath("/");
		String fileRoot = path + "resources/image/bImage/";//????????? ?????? ??????
		//String fileRoot = "D:\\Programming Backup\\Spring\\commuin_project\\src\\main\\webapp\\resources\\image\\bImage"; //????????? ?????? ??????
		String defaultName = multipartFile.getOriginalFilename(); //????????? ?????? ??????
		String extension = defaultName.substring(defaultName.lastIndexOf("."));
			
		String savedFileName = UUID.randomUUID() + extension;
		System.out.println(savedFileName);
			
		System.out.println(fileRoot + savedFileName);
			
		try {
			multipartFile.transferTo(new File(fileRoot + savedFileName));
			System.out.println("??????");
				
		} catch (IOException e) {
			e.printStackTrace();
		}
			
		return "/resources/image/bImage/" + savedFileName;
	}
		
	//????????? ??????
	@RequestMapping(value ="/delete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("b_id") String b_id, @RequestParam("ch_id") String ch_id) {
		System.out.println("?????? ????????? id : " + b_id);
		System.out.println("?????? ????????? ?????? ?????? : " + ch_id);
			
		int cnt = dao.boardDelete(b_id);
		if(cnt != 0) {
			System.out.println("?????? ????????? ???????????? : " + cnt);
		}
			
		return "redirect:/board?ch_id=" + ch_id;
	}
	
	//????????? ??????
	@RequestMapping(value = "/updateBoardInfo")
	public String updateBoard(@SessionAttribute(required = false) SessionValue sessionValue, Channel channel, Tag tag,
			Model model,@RequestParam(name="check",required = false) String check, Board board) {
		
		if (sessionValue == null)
			return "redirect:/member/login";
		if(check!=null)
			model.addAttribute("check", check);
	
		tag.setCh_id(channel.getCh_id());
		List<Tag> tagList = tagService.getTagList(tag);
		
		Board boardInfo = boardService.updateBoardSelect(board.getB_id());
		System.out.println(boardInfo);
		
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("tag", tagList);
		model.addAttribute("channel", channel);
		
		return "board/update";
	}
	
	@RequestMapping(value = "/update")
	public String boardUpdate(@SessionAttribute(required = false) SessionValue sessionValue,Channel channel, Board board) {
		/*
		 * System.out.println("?????? ???"); System.out.println(board);
		 */
		boardService.boardUpdate(board);
		/*
		 * System.out.println("?????? ??? DB???");
		 * System.out.println(boardService.updateBoardSelect(board.getB_id()));
		 */
		
		return "redirect:/board?ch_id=" + channel.getCh_id() + "&" + "b_id=" + board.getB_id();
	}
		
	@RequestMapping(value = "/getEmoticon")
	@ResponseBody
	public List<EmoticonList> getSelectedEmoticon(Emoticon emoticon) {
		System.out.println("---BoardController.getSelectedEmoticon()---");
		List<EmoticonList> emoticonList = emoticonService.getSeletedEmoticonList(emoticon);
		return emoticonList;
	}
}

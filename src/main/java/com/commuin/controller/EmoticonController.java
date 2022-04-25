package com.commuin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
import com.commuin.service.EmoticonService;
import com.commuin.service.GuestService;
import com.commuin.vo.Emoticon;
import com.commuin.vo.EmoticonList;
import com.commuin.vo.SessionValue;
import com.commuin.vo.User;
import com.commuin.vo.UserEmoticon;

@Controller
@RequestMapping("/emoticon")

public class EmoticonController {
	@Autowired
	EmoticonService emoticonService;

	@Autowired
	GuestService guestService;

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new LinkedHashMap<String, String>();
		System.out.println("---EmoticonController.searchConditionMap()---");
		conditionMap.put("제목", "title");
		conditionMap.put("업로더", "uploader");
		return conditionMap;
	}

	// 이모티콘 상점
	@RequestMapping()
	public String emoticonShop(@SessionAttribute(required = false) SessionValue sessionValue, Model model, User user,
			UserEmoticon userEmoticon, Emoticon emoticon, @RequestParam(name = "p", defaultValue = "1") int p) {
		System.out.println("---EmoticonController.emoticonShop()---");
		if (sessionValue == null)
			return "redirect:/member/login";
		if (emoticon.getSearchCondition() == null)
			emoticon.setSearchCondition("title");
		else {
			model.addAttribute("option", emoticon.getSearchCondition());
		}
		if (emoticon.getSearchKeyword() == null)
			emoticon.setSearchKeyword("");
		else {
			model.addAttribute("keyword", emoticon.getSearchKeyword());
		}
		user.setU_id(sessionValue.getSessionId());
		user.setU_name(sessionValue.getSessionName());
		// +해당조건에 맞는 이모티콘의 수를 가져온다.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(p);
		pageMaker.setPerPageNum(18);
		model.addAttribute("p", p);
		pageMaker.setTotalCount(emoticonService.getEmoticonCount(emoticon));
		// 그리고 그 조건에 맞는 이모티콘들을 가져온다.
		emoticon.setPageMaker(pageMaker);
		System.out.println("오미"+emoticon);
		List<Emoticon> getEmoticonList = emoticonService.getEmoticonList(emoticon);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("emoticon", getEmoticonList);

		// 만약 이모티콘의 아이디값이 0이 아니다면?
		if (emoticon.getE_id() != 0) {
			List<EmoticonList> emoticonList = emoticonService.getSeletedEmoticonList(emoticon);
			Emoticon emoticonInfo = emoticonService.getSeletedEmoticonInfo(emoticon);

			// 구매했으면 1 아니면 0이 등록됨
			int check = emoticonService.purchaseCheck(user, userEmoticon);

			model.addAttribute("emoticonList", emoticonList);
			model.addAttribute("emoticonInfo", emoticonInfo);
			model.addAttribute("check", check);
		}

		return "/emoticon/shop";
	}

	// 이모티콘 업로드페이지U
	@RequestMapping(value = "/upload")
	public String emoticonUpload(@SessionAttribute SessionValue sessionValue) {
		if (sessionValue == null)
			return "redirect:/login";
		return "/emoticon/upload";
	}

	/*
	 * u_name 유저닉네임,e_title 이모티콘 제목 el_name 이모티콘 파일 이름(들) el_path 이모티콘 파일이 저장될 경로 --
	 * image/emoticon/파일 이름.확장자 -- 이런형식으로 할 예정 el_thumbnail -> 기본값 0, 1->썸네일로 사용하겠음.
	 * 
	 * 2번째 방법으로는 썸네일을 emoticon table에 저장하고 emoticon_list table에 있는 thumbnail을 지우는
	 * 방법. 후자가 업로드할때 썸네일 이미지가 중복되지 않아서 편함 --- 1번의 방법의경우 이모티콘파일들 업로드 할때 썸네일용은 따로 걸러야함
	 * 
	 */
	@RequestMapping(value = "/uploadDo", method = RequestMethod.POST)
	public String emoticonUploadExecution(@SessionAttribute SessionValue sessionValue,
			@RequestParam("emoticonList") List<MultipartFile> emoticonList,
			@RequestParam("thumbnail") MultipartFile thumbnail, Emoticon emoticon, User user, HttpSession session)
			throws IllegalStateException, IOException {
		if (sessionValue == null)
			return "redirect:/login";
	
		String path = (String) session.getServletContext().getRealPath("/");
		user.setU_name(sessionValue.getSessionName());
		int uploadCheck = emoticonService.addEmoticon(user, emoticonList, thumbnail, emoticon, path);
		if (uploadCheck == 0)
			return "redirect:upload";

		return "redirect:/emoticon";
	}

	// 이모티콘 구매
	@RequestMapping("/buying")
	@ResponseBody
	public Map<String, String> emoticonCheck(@SessionAttribute(required = false) SessionValue sessionValue,
			Emoticon emoticon, User user, UserEmoticon userEmoticon) {
		System.out.println("EmoticonController.purchaseEmoticon()");
		if (sessionValue == null || userEmoticon.getE_id() == 0) {
			return null;
		}
		user.setU_name(sessionValue.getSessionName());
		Map<String, String> map = new HashMap<String, String>();
		if (emoticonService.purchaseCheck(user, userEmoticon) == 0) {
			if (sessionValue.getSessionPoint() < 100) {
				map.put("check", "2");
				return map;
			}
			emoticonService.purchaseEmoticon(userEmoticon);
			emoticon = emoticonService.getSeletedEmoticonInfo(emoticon);
			int down = guestService.changePointDownEmoticon(user);
			if (down == 1) {
				sessionValue.setSessionPoint(sessionValue.getSessionPoint() - 100);
			}
			map.put("check", "1");
			map.put("count", emoticon.getE_count() + "");
		} else {
			emoticonService.deleteEmoticon(userEmoticon);
			map.put("check", "0");
		}

		return map;
	}

	@ResponseBody
	@RequestMapping("/checkTitle")
	public int titleCheck(Emoticon emoticon) {
		return emoticonService.checkTitle(emoticon);
	}

}

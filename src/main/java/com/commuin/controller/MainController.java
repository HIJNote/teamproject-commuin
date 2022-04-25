package com.commuin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.commuin.persistence.MainDao;
import com.commuin.service.MainService;
import com.commuin.vo.Channel;

@Controller
public class MainController {

	@Autowired
	MainService mainService;
	@Autowired
	MainDao dao;
	/*
	 * 채널 + 채널에 담길 게시판데이터 넣어야함
	 * 
	 * 
	 */
	@RequestMapping(value = "/")
	public String mainPage(Model model) {
		List<Channel> channeList=mainService.getMainViewList();
		List<Channel> bestChannelList=mainService.getBestViewList();

		model.addAttribute("channel", channeList);
		model.addAttribute("bestChannel", bestChannelList);
		return "/main/main";
	}
	@RequestMapping(value = "/cannelList")
	@ResponseBody
	public List<Channel> cannelList() {	
		List<Channel> vo = dao.channelList();	
		return vo;
	}
}

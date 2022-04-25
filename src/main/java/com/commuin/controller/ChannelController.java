package com.commuin.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.commuin.service.ChannelService;
import com.commuin.service.SubscribeService;
import com.commuin.service.TagService;
import com.commuin.vo.Channel;
import com.commuin.vo.SessionValue;
import com.commuin.vo.Subscribe;
import com.commuin.vo.Tag;
import com.commuin.vo.User;

@Controller
@RequestMapping("/channel")
@SessionAttributes("chValue")
public class ChannelController {

	@Autowired
	ChannelService channelService;
	@Autowired
	TagService tagService;
	@Autowired
	SubscribeService subscribeService;

	/*
	 * 라이도버튼 생성
	 */
	/*
	 * @ModelAttribute("channelCategory") public List<String> channelCategory(){
	 * ArrayList<String> channelCategory=new ArrayList<String>(); String []
	 * category= {"게임","취미/생활","여행","음식","스포츠","연예/방송","스포츠","만화/애니","음악","뷰티"};
	 * for(String str : category) { channelCategory.add(str); } return
	 * channelCategory; }
	 */

	@ModelAttribute("channelCategory")
	public Map<String,String> channelCategory() {
		Map<String,String> channelCategory = new LinkedHashMap<String,String>();
		String[] category = { "게임", "취미/생활", "여행", "음식", "스포츠", "연예/방송", "스포츠", "만화/애니", "음악", "뷰티" 	};
		for (String str : category) {
			channelCategory.put(str,str);
		}
		return channelCategory;
	}
	 
	
	@RequestMapping
	public String channelList(@SessionAttribute(required = false) SessionValue sessionValue, Channel channel,
			Model model, @RequestParam(name = "search", defaultValue = "") String search, SessionStatus status,
			@RequestParam(name = "p", required = false) String p,User user) {
		if (p == null)
			status.setComplete();
		// 처음 출력시 전부 출력
		if (search.trim().equals("채널"))
			search = "";
		channel.setSearch(search);
		if (sessionValue != null)
			user.setU_name(sessionValue.getSessionName());
		else
			user.setU_name("");

		List<Channel> ch = channelService.getChannelList(channel, user);

		model.addAttribute("channel", ch);

		return "/channel/list";
	}

	@RequestMapping("/subscribe")
	public String subscribe(@SessionAttribute(required = false) SessionValue sessionValue, Channel channel,
			Subscribe subscribe) {
		if (sessionValue == null)
			return "redirect:/member/login";
		subscribe.setU_name(sessionValue.getSessionName());
		subscribe.setCh_id(channel.getCh_id());
		if (subscribeService.getSubscribeCheck(subscribe) == 1) {
			subscribeService.removeSubscribe(subscribe);
		} else {
			subscribeService.addSubscribe(subscribe);
		}
		
		return "redirect:/channel";
	}

//	채널만드는 화면
	@RequestMapping(value = "/creation")
	public String createChannel(@SessionAttribute(required = false) SessionValue sessionValue) {

		if (sessionValue.getSessionId() == null)
			return "redirect:/login";

		return "/channel/creation";
	}

	// 채널만들기위해 데이터값 받음
	@RequestMapping(value = "/creationDo", method = RequestMethod.POST)
	public String createChannelDo(@SessionAttribute SessionValue sessionValue, User user, Channel channel,
			Model model) {
		/*
		 * 데이터를 받아서 채널의 이름이 ""이거나 null이면
		 */
		if (channel.getCh_name().trim().equals("") || channel.getCh_name().trim() == null)
			return "redirect:/channel/creation";
		user.setU_name(sessionValue.getSessionName());
		user.setU_pt(sessionValue.getSessionPoint());

		// 채널이름있으면 다시 되돌아감
		if (channelService.checkChannelName(channel) == 1)
			return "redirect:/channel/creation";
		else {
			if (channelService.addChannel(user, channel) == 1)
				sessionValue.setSessionPoint(sessionValue.getSessionPoint() - 3000);
		}
		return "redirect:/channel/myChannel";
	}

	// 나의 채널 화면
	@RequestMapping(value = "/myChannel")
	public String manageChannel(@SessionAttribute SessionValue sessionValue, Channel channel,Tag tag, Model model) {
		if (sessionValue.getSessionId() == null)
			return "redirect:/member/login";
		if (channel.getCh_id() != 0) {
			model.addAttribute("show", 1);
			model.addAttribute("chValue", channelService.getChannel(channel));
			tag.setCh_id(channel.getCh_id());
			model.addAttribute("tag", tagService.getTagList(tag));
		}
		channel.setU_name(sessionValue.getSessionName());
		List<Channel> channelList=channelService.getMyChannelList(channel);
		for(Channel c:channelList) {
			System.out.println(c);
		}
		model.addAttribute("myChannel", channelList);

		return "/channel/myChannel";
	}

	/*
	 * @RequestMapping(value = "/addTag") public String addTag(@SessionAttribute
	 * SessionValue sessionValue, Tag tag,
	 * 
	 * @ModelAttribute("chValue") Channel channel) { if
	 * ((!channel.getU_name().equals(sessionValue.getSessionName())) ||
	 * tag.getTg_name().trim().equals("")) return "redirect:/member/login";
	 * tag.setCh_id(channel.getCh_id()); tagService.addTag(tag); return
	 * "redirect:/channel/myChannel?ch_id=" + channel.getCh_id(); }
	 */
	@RequestMapping(value = "/addTag")
	@ResponseBody
	public List<Tag> addTag(@ModelAttribute("chValue") Channel channel,Tag tag) {
		
		tag.setCh_id(channel.getCh_id());
		
		return tagService.addTag(tag);
	}

	// 채널의 중복이름 체크
	@ResponseBody
	@RequestMapping(value = "/nameCheck")
	public int nameCheck(Channel channel) {
		return channelService.checkChannelName(channel);
	}

	@ResponseBody
	@RequestMapping(value = "/tagCheck")
	public int tagCheck(Tag tag) {
		return tagService.getCheckTag(tag);
	}

	@ResponseBody
	@RequestMapping(value = "/introChange")
	public int changeIntro(@ModelAttribute("chValue") Channel channel) {
		if (channelService.changeIntro(channel) == 1)
			return 1;
		else
			return 0;
	}
	@ResponseBody
	@RequestMapping(value = "/tagDelete")
	public List<Tag> removeTag(@ModelAttribute("chValue") Channel channel,Tag tag) {
	
		return tagService.deleteAndgetTagList(tag,channel);
		
	}
	@ResponseBody
	@RequestMapping(value = "/tagChange")
	public List<Tag> changeTag(@ModelAttribute("chValue") Channel channel,Tag tag) {
		return tagService.updateAndgetTagList(tag,channel);
	}
	@ResponseBody
	@RequestMapping(value="/getTag")
	public List<Tag> getTag(@ModelAttribute("chValue") Channel channel,Tag tag) {
		System.out.println("getTag진입");
		tag.setCh_id(channel.getCh_id());
		List<Tag> tagList=tagService.getTagList(tag);
		return tagList;
	}

}

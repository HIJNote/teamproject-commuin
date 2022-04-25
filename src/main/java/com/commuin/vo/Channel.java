package com.commuin.vo;

import java.util.List;

//채널이 가지는 이름과 개설한 유저의 닉네임과 채널의 구독수와 등급(0-일반,1-메인,2-관리자)
public class Channel {

	private int ch_id;
	private String ch_name;
	private String u_name;
	private int ch_grade;
	private int ch_subscribe;
	private String search;
	private List<Tag> channelTagList;
	private List<Board> mainBoardList;
	private int subscribeCheck;
	private String ch_intro;
	private String ch_category;



	public String getCh_category() {
		return ch_category;
	}
	public void setCh_category(String ch_category) {
		this.ch_category = ch_category;
	}
	public String getCh_intro() {
		return ch_intro;
	}
	public void setCh_intro(String ch_intro) {
		this.ch_intro = ch_intro;
	}
	public int getSubscribeCheck() {
		return subscribeCheck;
	}
	public void setSubscribeCheck(int subscribeCheck) {
		this.subscribeCheck = subscribeCheck;
	}
	public List<Board> getMainBoardList() {
		return mainBoardList;
	}
	public void setMainBoardList(List<Board> mainBoardList) {
		this.mainBoardList = mainBoardList;
	}
	public List<Tag> getChannelTagList() {
		return channelTagList;
	}
	public void setChannelTagList(List<Tag> channelTagList) {
		this.channelTagList = channelTagList;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getCh_id() {
		return ch_id;
	}
	public void setCh_id(int ch_id) {
		this.ch_id = ch_id;
	}
	public String getCh_name() {
		return ch_name;
	}
	public void setCh_name(String ch_name) {
		this.ch_name = ch_name;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	
	public int getCh_grade() {
		return ch_grade;
	}
	public void setCh_grade(int ch_grade) {
		this.ch_grade = ch_grade;
	}
	public int getCh_subscribe() {
		return ch_subscribe;
	}
	public void setCh_subscribe(int ch_subscribe) {
		this.ch_subscribe = ch_subscribe;
	}
	@Override
	public String toString() {
		return "Channel [ch_id=" + ch_id + ", ch_name=" + ch_name + ", u_name=" + u_name + ", ch_grade=" + ch_grade
				+ ", ch_subscribe=" + ch_subscribe + ", search=" + search + ", subscribeCheck=" + subscribeCheck
				+ ", ch_intro=" + ch_intro + ", ch_category=" + ch_category + "]";
	}
	
	

	
}

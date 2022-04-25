package com.commuin.vo;

import java.sql.Timestamp;

import com.commuin.paging.PageMaker;

//어떤 이모티콘을 어떤 회원이 어떤 제목으로 올렸고 썸네일로 어떤것을 선택했는지와 
//해당 이모티콘의 가격,판매수,등록일 등
public class Emoticon {
	private int e_id;
	private String u_name;
	private String e_title;
	private String e_thumbnail;
	private String e_path;
	private int e_count;
	private int e_price;
	private Timestamp e_regdate;
	private int e_delete;
	
	private String searchCondition;
	private String searchKeyword;
	
	private String target;
	private PageMaker pageMaker;

//페이징
	
	public String getTarget() {
		return target;
	}

	public PageMaker getPageMaker() {
		return pageMaker;
	}

	public void setPageMaker(PageMaker pageMaker) {
		this.pageMaker = pageMaker;
	}

	public void setTarget(String target) {
		this.target = target;
	}


	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}



	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getE_title() {
		return e_title;
	}

	public void setE_title(String e_title) {
		this.e_title = e_title;
	}

	public String getE_thumbnail() {
		return e_thumbnail;
	}

	public void setE_thumbnail(String e_thumbnail) {
		this.e_thumbnail = e_thumbnail;
	}

	public String getE_path() {
		return e_path;
	}

	public void setE_path(String e_path) {
		this.e_path = e_path;
	}

	public int getE_count() {
		return e_count;
	}

	public void setE_count(int e_count) {
		this.e_count = e_count;
	}

	public int getE_price() {
		return e_price;
	}

	public void setE_price(int e_price) {
		this.e_price = e_price;
	}

	public Timestamp getE_regdate() {
		return e_regdate;
	}

	public void setE_regdate(Timestamp e_regdate) {
		this.e_regdate = e_regdate;
	}

	public int getE_delete() {
		return e_delete;
	}

	public void setE_delete(int e_delete) {
		this.e_delete = e_delete;
	}

	@Override
	public String toString() {
		return "Emoticon [pageMaker=" + pageMaker + "]";
	}

	

	



}

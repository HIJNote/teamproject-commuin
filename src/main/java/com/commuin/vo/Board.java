package com.commuin.vo;

import java.sql.Timestamp;

import com.commuin.paging.PageMaker;
import com.fasterxml.jackson.annotation.JsonFormat;

//해당 게시글이 어떤 채널에 속하며 어떤 제목,어떤 회원이 올렸고, 작성일은 언제며,
//신고수,삭제,조회수,좋아요수,댓글수,내용 등..
public class Board {

	private int b_id;
	private int ch_id;
	private String ch_name;
	private String b_title;
	private String u_name;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd") // (추가함)
	private Timestamp b_regdate;
	private Timestamp b_blinddate;
	private int b_warning;
	private int b_delete;
	private int b_view;
	private int b_follow;
	private int b_reply_count;
	private String b_content;
	private String b_tag;
	private int seq;
	private int b_accumulateboardCnt; // 누적 게시글 수 (추가함)
	private int b_TodayboardCnt; // 오늘 등록된 게시글 수 (추가함)
	private int b_Accumulate_Q_Cnt; // 누적 문의글 수   (추가함)
	private int b_Today_Q_Cnt; // 오늘 등록된 문의 글 수  (추가함)
	private Channel channel;
	private PageMaker pageMaker;

	private String searchCondition;
	private String searchKeyword;
	private String target;
	

	
//paging
	
	
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

	
//	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
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
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public Timestamp getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Timestamp b_regdate) {
		this.b_regdate = b_regdate;
	}
	public Timestamp getB_blinddate() {
		return b_blinddate;
	}
	public void setB_blinddate(Timestamp b_blinddate) {
		this.b_blinddate = b_blinddate;
	}
	public int getB_warning() {
		return b_warning;
	}
	public void setB_warning(int b_warning) {
		this.b_warning = b_warning;
	}
	public int getB_delete() {
		return b_delete;
	}
	public void setB_delete(int b_delete) {
		this.b_delete = b_delete;
	}
	public int getB_view() {
		return b_view;
	}
	public void setB_view(int b_view) {
		this.b_view = b_view;
	}
	public int getB_follow() {
		return b_follow;
	}
	public void setB_follow(int b_follow) {
		this.b_follow = b_follow;
	}
	public int getB_reply_count() {
		return b_reply_count;
	}
	public void setB_reply_count(int b_reply_count) {
		this.b_reply_count = b_reply_count;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_tag() {
		return b_tag;
	}
	public void setB_tag(String b_tag) {
		this.b_tag = b_tag;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getB_accumulateboardCnt() {
		return b_accumulateboardCnt;
	}
	public void setB_accumulateboardCnt(int b_accumulateboardCnt) {
		this.b_accumulateboardCnt = b_accumulateboardCnt;
	}
	public int getB_TodayboardCnt() {
		return b_TodayboardCnt;
	}
	public void setB_TodayboardCnt(int b_TodayboardCnt) {
		this.b_TodayboardCnt = b_TodayboardCnt;
	}
	public int getB_Accumulate_Q_Cnt() {
		return b_Accumulate_Q_Cnt;
	}
	public void setB_Accumulate_Q_Cnt(int b_Accumulate_Q_Cnt) {
		this.b_Accumulate_Q_Cnt = b_Accumulate_Q_Cnt;
	}
	public int getB_Today_Q_Cnt() {
		return b_Today_Q_Cnt;
	}
	public void setB_Today_Q_Cnt(int b_Today_Q_Cnt) {
		this.b_Today_Q_Cnt = b_Today_Q_Cnt;
	}
	public Channel getChannel() {
		return channel;
	}
	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	@Override
	public String toString() {
		return "Board [b_id=" + b_id + ", ch_id=" + ch_id + ", ch_name=" + ch_name + ", b_title=" + b_title
				+ ", u_name=" + u_name + ", b_regdate=" + b_regdate + ", b_blinddate=" + b_blinddate + ", b_warning="
				+ b_warning + ", b_delete=" + b_delete + ", b_view=" + b_view + ", b_follow=" + b_follow
				+ ", b_reply_count=" + b_reply_count + ", b_content=" + b_content + ", b_tag=" + b_tag + ", seq=" + seq
				+ ", b_accumulateboardCnt=" + b_accumulateboardCnt + ", b_TodayboardCnt=" + b_TodayboardCnt
				+ ", b_Accumulate_Q_Cnt=" + b_Accumulate_Q_Cnt + ", b_Today_Q_Cnt=" + b_Today_Q_Cnt + ", channel="
				+ channel + ", pageMaker=" + pageMaker + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", target=" + target + "]";
	}




	
	
	
}

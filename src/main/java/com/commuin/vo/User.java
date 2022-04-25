package com.commuin.vo;

import java.sql.Date;

public class User {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_email;
	private Date u_joindate;
	private int u_pt;
	private int u_lv;
	private int u_ex;
	private int u_count;
	private int u_state;
	private Date u_lastdate;
	private int allCnt;
	private int oldCnt;
	private int stopCnt;
	private int blackCnt;
	private int removeCnt;
	private int u_accumulateJoinCnt; // 누적 회원 수 cnt (추가함)
	private int u_TodayJoinCnt;    // 오늘 가입자 수 cnt (추가함)
	
	
	
	public Date getU_lastdate() {
		return u_lastdate;
	}

	public void setU_lastdate(Date u_lastdate) {
		this.u_lastdate = u_lastdate;
	}

	public int getU_accumulateJoinCnt() {
		return u_accumulateJoinCnt;
	}

	public void setU_accumulateJoinCnt(int u_accumulateJoinCnt) {
		this.u_accumulateJoinCnt = u_accumulateJoinCnt;
	}

	public int getU_TodayJoinCnt() {
		return u_TodayJoinCnt;
	}

	public void setU_TodayJoinCnt(int u_TodayJoinCnt) {
		this.u_TodayJoinCnt = u_TodayJoinCnt;
	}

	public String getU_id() {
		return u_id;
	}
	
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	public String getU_pw() {
		return u_pw;
	}
	
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	
	public String getU_name() {
		return u_name;
	}
	
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	
	public String getU_email() {
		return u_email;
	}
	
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	
	public Date getU_joindate() {
		return u_joindate;
	}
	
	public void setU_joindate(Date u_joindate) {
		this.u_joindate = u_joindate;
	}
	
	public int getU_pt() {
		return u_pt;
	}
	
	public void setU_pt(int u_pt) {
		this.u_pt = u_pt;
	}
	
	public int getU_lv() {
		return u_lv;
	}
	
	public void setU_lv(int u_lv) {
		this.u_lv = u_lv;
	}
	
	public int getU_ex() {
		return u_ex;
	}
	
	public void setU_ex(int u_ex) {
		this.u_ex = u_ex;
	}
	
	public int getU_count() {
		return u_count;
	}
	
	public void setU_count(int u_count) {
		this.u_count = u_count;
	}
	
	public int getU_state() {
		return u_state;
	}
	
	public void setU_state(int u_state) {
		this.u_state = u_state;
	}

	public int getAllCnt() {
		return allCnt;
	}

	public void setAllCnt(int allCnt) {
		this.allCnt = allCnt;
	}

	public int getOldCnt() {
		return oldCnt;
	}

	public void setOldCnt(int oldCnt) {
		this.oldCnt = oldCnt;
	}

	public int getStopCnt() {
		return stopCnt;
	}

	public void setStopCnt(int stopCnt) {
		this.stopCnt = stopCnt;
	}
	
	public int getBlackCnt() {
		return blackCnt;
	}

	public void setBlackCnt(int blackCnt) {
		this.blackCnt = blackCnt;
	}

	public int getRemoveCnt() {
		return removeCnt;
	}

	public void setRemoveCnt(int removeCnt) {
		this.removeCnt = removeCnt;
	}
	
	
}

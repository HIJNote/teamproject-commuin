package com.commuin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface HostService {
	public void mainInfo(HttpServletRequest req, Model model); // 관리자 메인 정보 조회
	public void userList(HttpServletRequest req, Model model); // 유저 리스트
	public void userNormal(HttpServletRequest req, Model model); // 상태 : 휴면 -> 정상 변경
	public void userStop(HttpServletRequest req, Model model); // 상태 : 정상 -> 정지 변경
	public void boardList(HttpServletRequest req, Model model); // 게시글 목록 리스트
	public void boardChange(HttpServletRequest req, Model model); // 신고 게시글 -> 일반 게시글 변경
	public void adminBoardInsert(HttpServletRequest req, Model model); // 공지글 작성
	public void adminChannelList(HttpServletRequest req, Model model); // 채널 리스트
	public void channelChange(HttpServletRequest req, Model model); // 채널 일반 -> 메인 승급
}
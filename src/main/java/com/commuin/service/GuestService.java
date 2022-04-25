package com.commuin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.commuin.vo.Channel;
import com.commuin.vo.User;

public interface GuestService {
	public void test();
	public int idCheck(String id);
	public int nameCheck(String name);
	public int emailCheck(String email);
	public void join(User userTest);
	public User loginCheck(User loginUserInfo);
	public List<Channel> subscribe(String userName);
	public String searchId(String u_email);
	public String searchPwd(String u_id);
	public int changePointDownChannel(User user);
	//이모티콘 구매후 포인트 감소
	public int changePointDownEmoticon(User user);
	//이메일 전송
	public void emailCheck(HttpServletRequest req, String u_email);
	
}

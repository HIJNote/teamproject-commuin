package com.commuin.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commuin.persistence.GuestDao;
import com.commuin.vo.Channel;
import com.commuin.vo.User;

@Service
public class GuestServiceImpl implements GuestService {
	@Autowired
	GuestDao dao;

	@Override
	public void test() {
		System.out.println("service 진입 성공!!");

		dao.select();

		System.out.println("dao 수행완료!!");
	}

	// id 실시간 체크
	@Override
	public int idCheck(String id) {
		int cnt = dao.idCheck(id);

		return cnt;
	}

	// 구독목록 체크
	public List<Channel> subscribe(String userName) {
		List<Channel> list = dao.subscribe(userName);

		return list;
	}

	// 닉네임 실시간 체크
	@Override
	public int nameCheck(String name) {
		int cnt = dao.nameCheck(name);

		return cnt;
	}

	// 이메일 실시간 체크
	@Override
	public int emailCheck(String email) {
		int cnt = dao.emailCheck(email);

		return cnt;
	}

	// 회원가입
	@Override
	public void join(User userTest) {
		// TODO Auto-generated method stub
		dao.join(userTest);
	}

	// 로그인하고 계정이 있다면 접속일과 오늘 날짜를 비교해서
	// 다르다면 포인트를 증가시키고 날짜를 업데이트하고 업데이트된 정보로 가져온다.
	@Override
	public User loginCheck(User loginUserInfo) {
	
		User user = dao.loginCheck(loginUserInfo);
		if (user == null)
			return null;
		else {
			Date date=new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dateToStr = dateFormat.format(date);
			String dateToStr2 = dateFormat.format(user.getU_lastdate());
			if(!dateToStr.equals(dateToStr2)) {
				dao.updatePoint(user);
				user=dao.updateAndSelectLastdate(user);
				return user;
			}		
			return user;
		}
		
	}

	@Override
	public String searchId(String u_email) {
		// TODO Auto-generated method stub
		return dao.searchId(u_email);
	}

	@Override
	public String searchPwd(String u_id) {
		// TODO Auto-generated method stub
		return dao.searchPwd(u_id);
	}
	/*
	 * 유저가 채널생성 성공시 포인트 3000 감소
	 */
	@Override
	public int changePointDownChannel(User user) {
		
		return dao.updatePointDownChannel(user);
	}
	//이모티콘 구매후 포인트 100 감소
	@Override
	public int changePointDownEmoticon(User user) {
		
		return dao.updatePointDownEmoticon(user);
	}
	
	//이메일 전송
	@Override
	public void emailCheck(HttpServletRequest req, String u_email) {
	 
		StringBuffer temp = new StringBuffer();
	    Random rnd = new Random();
	        
	    for(int i = 0; i < 6; i++) {
	        int rIndex = rnd.nextInt(2);
	        switch(rIndex) {
	        case 0:
	            // A-Z
	            temp.append((char) ((int) (rnd.nextInt(26)) + 65));
	            break;
	        case 1:
	            // 0-9
	            temp.append((rnd.nextInt(10)));
	            break;
	        }
	    }
	        
	    String key = temp.toString();
	    req.removeAttribute("key");
	    req.getSession().setAttribute("key", key);
	        
	    dao.sendmail(u_email, key);
	}
}

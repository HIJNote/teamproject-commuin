package com.commuin.persistence;

import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Channel;
import com.commuin.vo.User;

@Repository
public class GuestDaoImpl implements GuestDao{

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public int select() {
		System.out.println("dao 진입성공!!");
		GuestDao dao = sqlSession.getMapper(GuestDao.class);
		
		int cnt = dao.select();
		
		System.out.println("sql 완료 cnt : " + cnt);
		return cnt;
	}
	
	@Override
	public List<Channel> subscribe(String userName) {
		// TODO Auto-generated method stub
		List<Channel> list = sqlSession.selectList("guest"+".subscribeInfo", userName);
		
		for(Channel str : list) {
			System.out.println("채널 ID: " + str.getCh_id() + ", 채널 이름: " + str.getCh_name());
		}
		
		return list;
	}

	@Override
	public int idCheck(String id) {
		System.out.println("dao 진입성공!!");
		
		System.out.println("daoimpl, " + id);
		int cnt = sqlSession.selectOne("guest"+".idCheck", id);
		
		return cnt;
	}
	
	@Override
	public int nameCheck(String name) {
		System.out.println("dao 진입성공!!");
		
		System.out.println("daoimpl, " + name);
		int cnt = sqlSession.selectOne("guest"+".nameCheck", name);
		
		return cnt;
	}
	
	@Override
	public int emailCheck(String email) {
		System.out.println("dao 진입성공!!");
		
		System.out.println("daoimpl, " + email);
		int cnt = sqlSession.selectOne("guest"+".emailCheck", email.toString());
		System.out.println(sqlSession.selectOne("guest"+".emailCheck", email).toString());
		return cnt;
	}

	@Override
	public void join(User userTest) {
		// TODO Auto-generated method stub
		System.out.println("dao 매핑완료" + userTest.toString());
		
		sqlSession.selectOne("guest"+".join", userTest);
		int cnt = sqlSession.selectOne("guest"+".joinTest", userTest);
		System.out.println("결과: " + cnt + "," + userTest.getU_id() + "회원가입 완료");
	}

	@Override
	public User loginCheck(User loginUserInfo) {
		// TODO Auto-generated method stub
		System.out.println("로그인 매핑 완료"); 
		
		return sqlSession.selectOne("guest"+".loginCheck", loginUserInfo);
	}
	@Override
	public String searchId(String u_email) {
	    // TODO Auto-generated method stub
	    return sqlSession.selectOne("guest"+".searchId", u_email);
	}

    @Override
    public String searchPwd(String u_id) {
        // TODO Auto-generated method stub
        return sqlSession.selectOne("guest"+".searchPwd", u_id);
   }
    
//    유저의 날짜를 업데이트 하고 가져옴
    public User updateAndSelectLastdate(User user) {
    	sqlSession.update("guest.updateLastdate",user);
    	return sqlSession.selectOne("guest.selectLastdate",user);
    }
//    유저의 포인트 증가시킴
    public int updatePoint(User user) {
    	return sqlSession.update("guest.updatePoint", user);
    }
    //채널생성시 3000포인트 감소
    @Override
    public int updatePointDownChannel(User user) {
    	
    	return sqlSession.update("guest.updatePointDownChannel", user);
    }
    //이모티콘 구매후 100 감소
    @Override
    public int updatePointDownEmoticon(User user) {
    	
    	return sqlSession.update("guest.updatePointDownEmoticon",user);
    }
    
  //이메일 전송
  	@Override
  	public void sendmail(String u_email, String key) {
  		
  		try{
  			MimeMessage message = mailSender.createMimeMessage();
              String txt = "안녕하세요 인증번호입니다." 
    			+ "<br>인증번호 : " + key;
              message.setSubject("테스트 메일입니다~");
              message.setText(txt, "UTF-8", "html");
              message.setFrom(new InternetAddress("admin@mss.com"));
              message.addRecipient(RecipientType.TO, new InternetAddress(u_email));
              mailSender.send(message);
             
          }catch(Exception e){
              e.printStackTrace();
          }   
  	}
}

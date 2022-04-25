package com.commuin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commuin.persistence.ReplyDao;
import com.commuin.vo.Reply;
import com.commuin.vo.User;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDao replyDao;
	@Override
	public List<Reply> getMypageReplyList(User user,Reply reply){
		reply.setU_name(user.getU_name());
		
		return replyDao.selectMypageReplyList(reply);
	}
	@Override
	public int getMyReplyCount(User user,Reply reply) {
		reply.setU_name(user.getU_name());
		return replyDao.selectMyReplyCount(reply);
	}
}

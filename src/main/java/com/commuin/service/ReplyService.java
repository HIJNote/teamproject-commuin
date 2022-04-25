package com.commuin.service;

import java.util.List;

import com.commuin.vo.Reply;
import com.commuin.vo.User;

public interface ReplyService {

	List<Reply> getMypageReplyList(User user,Reply reply);
	int getMyReplyCount(User user,Reply reply);
}
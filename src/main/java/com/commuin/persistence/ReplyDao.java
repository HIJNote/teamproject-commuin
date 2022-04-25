package com.commuin.persistence;

import java.util.List;

import com.commuin.vo.Reply;


public interface ReplyDao {
	
	public List<Reply> selectMypageReplyList(Reply reply);
	public int selectMyReplyCount(Reply reply);
}

package com.commuin.persistence;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Reply;
@Repository
public class ReplyDaoImpl implements ReplyDao{
	@Autowired
	SqlSessionTemplate mybatis;
	@Override
	public List<Reply> selectMypageReplyList(Reply reply) {
		
		return mybatis.selectList("mypage.selectMypageReplyList", reply);
	}
	@Override
	public int selectMyReplyCount(Reply reply) {
		
		return mybatis.selectOne("mypage.selectReplyCount", reply);
	}
}

package com.commuin.persistence;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Follow;
@Repository
public class FollowDaoImpl implements FollowDao {
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public int selectFollow(Follow follow) {
		
		return mybatis.selectOne("follow.selectFollow", follow);
	}
	@Override
	public void insertFollow(Follow follow) {
		mybatis.insert("follow.insertFollow", follow);
	}
	@Override
	public void updateBoardFollow(Follow follow) {
		mybatis.update("follow.updateCountUp", follow);
	}
	@Override
	public int selectCount(Follow follow) {
		
		return mybatis.selectOne("follow.selectCount",follow);
	}
}

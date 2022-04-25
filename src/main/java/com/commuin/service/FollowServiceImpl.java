package com.commuin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commuin.persistence.FollowDao;
import com.commuin.vo.Follow;

@Service
public class FollowServiceImpl implements FollowService {
	@Autowired
	FollowDao followDao;
	@Override
	public int checkFollow(Follow follow) {
		return followDao.selectFollow(follow);
	}
	@Override
	public void insertFollow(Follow follow) {
		followDao.insertFollow(follow);
		followDao.updateBoardFollow(follow);
		
	}
	@Override
	public int getCount(Follow follow) {
		return followDao.selectCount(follow);
	}
	
	
}

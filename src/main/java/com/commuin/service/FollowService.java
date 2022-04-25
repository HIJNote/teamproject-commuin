package com.commuin.service;

import com.commuin.vo.Follow;

public interface FollowService {

	int checkFollow(Follow follow);
	void insertFollow(Follow follow);
	public int getCount(Follow follow) ;

}
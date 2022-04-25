package com.commuin.persistence;

import com.commuin.vo.Follow;

public interface FollowDao {

	public int selectFollow(Follow follow);
	public void insertFollow(Follow follow);
	public void updateBoardFollow(Follow follow);
	public int selectCount(Follow follow);

}

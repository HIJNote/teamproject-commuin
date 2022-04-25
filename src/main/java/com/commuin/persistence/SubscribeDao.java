package com.commuin.persistence;

import com.commuin.vo.Subscribe;

public interface SubscribeDao {

	public int selectSubscribe(Subscribe subscribe);
	public void insertsubscribe(Subscribe subscribe);
	public void deletesubscribe(Subscribe subscribe);
	
}

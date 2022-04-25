package com.commuin.service;

import com.commuin.vo.Subscribe;

public interface SubscribeService {

	int getSubscribeCheck(Subscribe subscribe);
	void addSubscribe(Subscribe subscribe);
	void removeSubscribe(Subscribe subscribe);

}
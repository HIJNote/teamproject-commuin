package com.commuin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commuin.persistence.SubscribeDao;
import com.commuin.vo.Subscribe;

@Service
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	SubscribeDao subscribeDao;
	
	@Override
	public int getSubscribeCheck(Subscribe subscribe) {
		return subscribeDao.selectSubscribe(subscribe);
	}

	@Override
	public void addSubscribe(Subscribe subscribe) {
		if(getSubscribeCheck(subscribe)==0)
		
		subscribeDao.insertsubscribe(subscribe);
	}

	@Override
	public void removeSubscribe(Subscribe subscribe) {
		if(getSubscribeCheck(subscribe)==1)
		subscribeDao.deletesubscribe(subscribe);
	}

	
}

package com.commuin.service;

import java.util.List;

import com.commuin.vo.Channel;

public interface MainService {

	List<Channel> getMainViewList();
	List<Channel> getBestViewList();
}
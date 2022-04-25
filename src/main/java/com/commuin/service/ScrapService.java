package com.commuin.service;

import java.util.List;

import com.commuin.vo.Scrap;
import com.commuin.vo.User;

public interface ScrapService {

	List<Scrap> getMypageScrapList(User user,Scrap scrap);
	int updateScrap(Scrap scrap);
	int checkScrap(Scrap scrap);
	int getMyScrapCount(User user,Scrap scrap);
	
}
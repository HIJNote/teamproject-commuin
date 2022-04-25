package com.commuin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commuin.persistence.ScrapDao;
import com.commuin.vo.Scrap;
import com.commuin.vo.User;

@Service
public class ScrapServiceImpl implements ScrapService {
	@Autowired
	ScrapDao scrapDao;
	@Override
	public List<Scrap> getMypageScrapList(User user,Scrap scrap){
		scrap.setU_name(user.getU_name());
		return scrapDao.selectMypageScrapList(scrap);
	}
	@Override
	public int updateScrap(Scrap scrap) {
		//있다면
		if(scrapDao.selectCheck(scrap)==1) {
			scrapDao.deleteCheck(scrap);
			return 0;
		}else {
			scrapDao.insertCheck(scrap);
			return 1;
		}
	}
	@Override
	public int checkScrap(Scrap scrap) {
		
		return scrapDao.selectCheck(scrap);
	}
	@Override
	public int getMyScrapCount(User user,Scrap scrap) {
		scrap.setU_name(user.getU_name());
		return scrapDao.selectMyScrapCount(scrap);
	}
}

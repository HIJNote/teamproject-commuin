package com.commuin.persistence;

import java.util.List;

import com.commuin.vo.Scrap;

public interface ScrapDao {

	public List<Scrap> selectMypageScrapList(Scrap scrap);
	public int selectCheck(Scrap scrap);
	public void insertCheck(Scrap scrap);
	public void deleteCheck(Scrap scrap);
	public int selectMyScrapCount(Scrap scrap);
}

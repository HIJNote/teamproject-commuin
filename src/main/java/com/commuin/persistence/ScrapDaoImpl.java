package com.commuin.persistence;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Scrap;

@Repository
public class ScrapDaoImpl implements ScrapDao {
	@Autowired
	SqlSessionTemplate mybatis;

	@Override
	public List<Scrap> selectMypageScrapList(Scrap scrap) {
		return mybatis.selectList("mypage.selectMypageScrapList", scrap);
	}

	@Override
	public int selectCheck(Scrap scrap) {
		
		return mybatis.selectOne("scrap.selectScrapCheck", scrap);
	}

	@Override
	public void insertCheck(Scrap scrap) {
		mybatis.insert("scrap.insertScrap", scrap);
	}

	@Override
	public void deleteCheck(Scrap scrap) {
		mybatis.insert("scrap.deleteScrap", scrap);
	}
	@Override
	public int selectMyScrapCount(Scrap scrap) {
		
		return mybatis.selectOne("mypage.selectScrapCount", scrap);
	}
}

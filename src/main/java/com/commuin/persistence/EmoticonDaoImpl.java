package com.commuin.persistence;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Emoticon;
import com.commuin.vo.EmoticonList;
import com.commuin.vo.UserEmoticon;

@Repository
public class EmoticonDaoImpl implements EmoticonDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void uploadEmoticon(Emoticon emoticon) {
		
		mybatis.insert("EmoticonDao.uploadEmoticon", emoticon);
	}

	@Override
	public int getEmoticonId(Emoticon emoticon) {
		
		return mybatis.selectOne("EmoticonDao.getEmoticonId", emoticon);
		
	}

	@Override
	public void uploadEmoticonList(EmoticonList emoticonList) {
		mybatis.insert("EmoticonDao.uploadEmoticonList",emoticonList);
		
	}
	//이모티콘 리스트 구함
	@Override
	public List<Emoticon> getEmoticonList(Emoticon emoticon) {
		
		return mybatis.selectList("EmoticonDao.getEmoticonList",emoticon);
	}
	//이모티콘 리스트의 수를 구함
@Override
	public int selectCount(Emoticon emoticon) {
		
		return mybatis.selectOne("EmoticonDao.selectCount",emoticon);
	}
	


	@Override
	public List<EmoticonList> getSeletedEmoticonList(Emoticon emoticon) {
		
		return mybatis.selectList("EmoticonDao.getSeletedEmoticonList", emoticon);
	}
	@Override
	public Emoticon getSeletedEmoticonInfo(Emoticon emoticon) {
		
		return mybatis.selectOne("EmoticonDao.getSeletedEmoticonInfo", emoticon);
	}
	@Override
	public int purchaseCheck(UserEmoticon userEmoticon) {
		
		return mybatis.selectOne("EmoticonDao.purchaseCheck",userEmoticon);
	}

	@Override
	public void deleteEmoticon(UserEmoticon userEmoticon) {
		mybatis.delete("EmoticonDao.deleteEmoticon", userEmoticon);
	}

	@Override
	public void purchaseEmoticon(UserEmoticon userEmoticon) {
		mybatis.insert("EmoticonDao.purchaseEmoticon", userEmoticon);
		mybatis.update("EmoticonDao.updateCount", userEmoticon);
	}
	@Override
	public List<UserEmoticon> selectMypageEmoticonList(UserEmoticon userEmoticon) {
	
		return mybatis.selectList("mypage.selectMypageEmoticonList", userEmoticon);
	}
	
	/*
	 * ue_name으로 조인을통해 e_id,e_path를 구한다.
	 * 
	 */
	@Override
	public List<UserEmoticon> selectEmoticonList(UserEmoticon userEmoticon) {	
		return mybatis.selectList("EmoticonDao.selectEmoticonList", userEmoticon);
	}
	@Override
	public int checkTitle(Emoticon emoticon) {
		
		return mybatis.selectOne("EmoticonDao.checkTitle", emoticon);
	}
	@Override
	public int selectMyEmoticonCount(UserEmoticon userEmoticon) {
		
		return mybatis.selectOne("mypage.selectEmoticonCount", userEmoticon);
	}
	
}

package com.commuin.persistence;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Tag;

/*
 * insertTagTrigger --- 채널 생성시 바로 생김
 * selectCheckTag --- 해당 태그가 있는지 검사 있으면1 없으면0
 * insertTag --- 태그를 새로 추가함
 * selectTagList --- ch_id와 일치하는 태그리스트를 가져옴
 * 
 */
@Repository
public class TagDaoImpl implements TagDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insertTagTrigger(Tag tag) {
		System.out.println("TagDaoImpl.insertTagTrigger(tag) --- 실행");
		System.out.println(tag);
		mybatis.insert("TagDao.insertTagTrigger", tag);
		
	}

	@Override
	public int selectCheckTag(Tag tag) {

		return mybatis.selectOne("TagDao.selectCheckTag", tag);
	}

	@Override
	public void insertTag(Tag tag) {
		mybatis.insert("TagDao.insertTag", tag);
	}

	@Override
	public List<Tag> selectTagList(Tag tag) {

		return mybatis.selectList("TagDao.selectTagList", tag);
	}
	@Override
	public int updateTagBefore(Tag tag) {
		
		return mybatis.update("TagDao.updateTagBefore", tag);
	}
	@Override
	public int deleteTag(Tag tag) {
		
		return mybatis.delete("TagDao.deleteTag", tag);
	}
	@Override
	public int selectTagBefore(Tag tag) {
		
		return mybatis.selectOne("TagDao.selectTagBefore");
	}
	@Override
	public int updateTag(Tag tag) {
		
		return mybatis.update("TagDao.updateTag", tag);
	}
	@Override
	public int updateBoardTag(Tag tag) {
		
		return mybatis.update("TagDao.updateBoardTag",tag);
	}

}

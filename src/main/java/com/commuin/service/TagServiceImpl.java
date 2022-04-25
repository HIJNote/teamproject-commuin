package com.commuin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commuin.persistence.TagDao;
import com.commuin.vo.Channel;
import com.commuin.vo.Tag;

@Service
public class TagServiceImpl implements TagService {

	@Autowired
	TagDao dao;

	@Override
	public void addTagTrigger(Tag tag) {
		System.out.println("TagServiceImpl.dao.insertTagTrigger(tag) --- 실행");
		dao.insertTagTrigger(tag);
	}

	@Override
	public int getCheckTag(Tag tag) {
		
		return dao.selectCheckTag(tag);
	}

	/* 폼형식
	 * @Override public void addTag(Tag tag) { if (getCheckTag(tag) == 0) if
	 * (!tag.getTg_name().trim().equals("")) dao.insertTag(tag); }
	 */
	@Override
	public List<Tag> addTag(Tag tag) {
		if (getCheckTag(tag) == 0)
			if (!tag.getTg_name().trim().equals("")) {
				dao.insertTag(tag);
				return getTagList(tag);
			}
		return null;
	}

	@Override
	public List<Tag> getTagList(Tag tag) {

		return dao.selectTagList(tag);
	}

	@Override
	public List<Tag> deleteAndgetTagList(Tag tag, Channel channel) {
		String tagName=tag.getTg_name().trim();
		if (tagName.equals("전체")||tagName.equals("공지")||tagName.equals(""))
			return null;
		
		tag.setCh_id(channel.getCh_id());
		System.out.println("삭제"+channel);
		System.out.println("태그"+tag);
		dao.updateTagBefore(tag);
		dao.deleteTag(tag);
		return getTagList(tag);
	}
	//태그를 바꾸기 전 바꿀 이름이 있는지 체크
	@Override
	public List<Tag> updateAndgetTagList(Tag tag,Channel channel) {
		String tagName=tag.getTg_change().trim();
		if (tagName.equals("전체")||tagName.equals("공지")||tagName.equals(""))
			return null;
		tag.setCh_id(channel.getCh_id());
		//바꿀 이름과 현재 가지고 있는 태그를 비교해서 반환되는 값이 없다면?
		// 해당 태그를 가지는 게시글의 태그를 바꾸고, 현재 태그를 바꿈
		if (dao.selectTagBefore(tag) == 0) {
			dao.updateBoardTag(tag);
			dao.updateTag(tag);
			return getTagList(tag);
		} else {			
			return null;
		}
	}
}

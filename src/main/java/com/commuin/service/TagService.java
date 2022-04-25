package com.commuin.service;

import java.util.List;

import com.commuin.vo.Channel;
import com.commuin.vo.Tag;


public interface TagService {

	public void addTagTrigger(Tag tag);

	public int getCheckTag(Tag tag);

	/* 폼형식 public void addTag(Tag tag); */
	
	public List<Tag> addTag(Tag tag);
	public List<Tag> getTagList(Tag tag);
	//태그를 삭제 후 목록을 가져옴
	public List<Tag> deleteAndgetTagList(Tag tag,Channel channel);
	//태그 업데이트 후 목록 가져옴
	public List<Tag> updateAndgetTagList(Tag tag,Channel channel); 
	
}

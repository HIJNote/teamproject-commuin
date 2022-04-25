package com.commuin.persistence;
import java.util.List;
import com.commuin.vo.Tag;

public interface TagDao {
	public void insertTagTrigger(Tag tag);
	/*
	 * 해당 ch_id와 tg_name이 있는 태그를 검사한다.
	 */
	public int selectCheckTag(Tag tag);
	public void insertTag(Tag tag);
	public List<Tag> selectTagList(Tag tag);
//	태그를 지우기 전에 해당 태그에 해당하는 게시글 태그를 '전체'로 바꾼후 지운다.
	public int updateTagBefore(Tag tag);
	public int deleteTag(Tag tag);
	/*
	 * 태그를 수정한다.
	 */
	public int updateTag(Tag tag);
	public int selectTagBefore(Tag tag);
	public int updateBoardTag(Tag tag);
	
}

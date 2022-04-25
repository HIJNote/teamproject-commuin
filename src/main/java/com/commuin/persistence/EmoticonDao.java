package com.commuin.persistence;

import java.util.List;

import com.commuin.vo.Emoticon;
import com.commuin.vo.EmoticonList;
import com.commuin.vo.UserEmoticon;

public interface EmoticonDao {

//	public void uploadEmoticon(String u_name,String e_title,String e_thumbnail,String e_path);
	public void uploadEmoticon(Emoticon emoticon);
	public int getEmoticonId(Emoticon emoticon);
	public void uploadEmoticonList(EmoticonList emoticonList);
	public List<Emoticon> getEmoticonList(Emoticon emoticon);

	public List<EmoticonList> getSeletedEmoticonList(Emoticon emoticon);
	public Emoticon getSeletedEmoticonInfo(Emoticon emoticon);
	public int purchaseCheck(UserEmoticon userEmoticon);
	public void purchaseEmoticon(UserEmoticon userEmoticon);
	public void deleteEmoticon(UserEmoticon userEmoticon); 
	public List<UserEmoticon> selectMypageEmoticonList(UserEmoticon userEmoticon);
	//해당조건에 맞는 이모티콘 개수를 가져옴
	public int selectCount(Emoticon emoticon);
	
	//이모티콘 제목 검사
	public int checkTitle(Emoticon emoticon);
	
	public List<UserEmoticon> selectEmoticonList(UserEmoticon userEmoticon);
	
	//내가보유하고있는 이모티콘 수
	public int selectMyEmoticonCount(UserEmoticon userEmoticon);
	
}

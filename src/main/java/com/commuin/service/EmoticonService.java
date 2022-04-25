package com.commuin.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.commuin.vo.Emoticon;
import com.commuin.vo.EmoticonList;
import com.commuin.vo.User;
import com.commuin.vo.UserEmoticon;

public interface EmoticonService {

	//---업로드
	public int addEmoticon(User user,List<MultipartFile> emoticonList,
			MultipartFile thumbnail,Emoticon emoticon,String path) throws IllegalStateException, IOException;
	public void uploadEmoticon(Emoticon emoticon);
	public int getEmoticonId(Emoticon emoticon);
	public void uploadEmoticonList(EmoticonList emoticonList);
	//---업로드끝
	public List<Emoticon> getEmoticonList(Emoticon emoticon);
	public int getEmoticonCount(Emoticon emoticon);
	public List<EmoticonList> getSeletedEmoticonList(Emoticon emoticon);
	public Emoticon getSeletedEmoticonInfo(Emoticon emoticon);
	public int purchaseCheck(User user,UserEmoticon userEmoticon);
	public void purchaseEmoticon(UserEmoticon userEmoticon);
	public void deleteEmoticon(UserEmoticon userEmoticon); 
	//마이페이지에서 자신이 구매한 이모티콘 정보 가져옴
	public List<UserEmoticon> getMypageEmoticonList(User user,UserEmoticon userEmoticon);
	public List<UserEmoticon> getUserEmoticonList(UserEmoticon userEmoticon);
	//이모티콘 제목 검사
	public int checkTitle(Emoticon emoticon);
	public int getMyEmoticonCount(User user,UserEmoticon userEmoticon);
	
 }
	
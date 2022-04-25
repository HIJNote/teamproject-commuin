package com.commuin.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.commuin.persistence.EmoticonDao;
import com.commuin.vo.Emoticon;
import com.commuin.vo.EmoticonList;
import com.commuin.vo.User;
import com.commuin.vo.UserEmoticon;

@Service
public class EmoticonServiceImpl implements EmoticonService {

	@Autowired
	EmoticonDao dao;

	//업로드
	@Override
	public int addEmoticon(User user, List<MultipartFile> emoticonList, MultipartFile thumbnail, Emoticon emoticon,String path) throws IllegalStateException, IOException {
		System.out.println("업로더 닉네임:"+user.getU_name());
		System.out.println("패스경로"+path);
		System.out.println("정보"+emoticon);
		//변수선언
		String ext;
		String fileName;
		File uploadFile;
		//File tomcatFile;
		
		
		// 파일저장경로
		//사용하면 다른 컴퓨터에서 또 바꿔야하고 DB에 들어갈때도 문제가됨
		
		//String tomcatURL=path;
		String basicPath="C:\\commuinProject\\commuin_project_Hwang\\src\\main\\webapp\\";
		//DB에 저장될 경로값(파일명 제외)
		String savePath="resources/image/emoticon/";
		//지금 저장되는곳
		String uploadPath = basicPath+savePath;
		
		System.out.println("------------------------");
		System.out.println("emoticonUploadExecution() process...");
		System.out.println("------------------------");
		System.out.println("이모티콘 제목:"+emoticon.getE_title());
		System.out.println("------------------------");
		System.out.println("썸네일 이모티콘 파일 원본:"+thumbnail.getOriginalFilename());
		System.out.println("------------------------");
		System.out.println("이모티콘 원본 목록");
		for(MultipartFile emo : emoticonList ) {
			System.out.println(emo.getOriginalFilename());
		}
		System.out.println("------------------------");
		System.out.println("업로드경로"+uploadPath);
		
		/*
		 * 파일 업로드 전 확장자 체크
		 */
		ext = thumbnail.getOriginalFilename().substring(thumbnail.getOriginalFilename().lastIndexOf(".") + 1);
		//썸네일 확장자명 체크
		if (!(ext.equals("jpg") || ext.equals("gif") || ext.equals("png") || ext.equals("jpeg"))) {
			return 0;
		}
		//파일목록 확장자명 체크
		for (MultipartFile file : emoticonList) {

			// 파일확장자명 ex) txt, png, gif ...
			ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
			// 만약 확장자명이 다르다 -> 프론트단에서 스크립트 수정한 경우. 되돌림
			if (!(ext.equals("jpg") || ext.equals("gif") || ext.equals("png") || ext.equals("jpeg"))) {
				return 0;
			}
		}
		
		/*
		 * ------------------------------업로드 시작------------------------------
		 */
		
		/*
		 * 단일파일
		 */
		ext = thumbnail.getOriginalFilename().substring(thumbnail.getOriginalFilename().lastIndexOf(".") + 1);
		// 업로드된 파일 이름 , 확장자 제외
		fileName = thumbnail.getOriginalFilename();
		// 업로드된 파일이름을 UUID를 이용하여 고유 아이디로 바꿈
		fileName = UUID.randomUUID().toString();
		// 고유아이디로 바뀐이름+ "." + 확장자를 파일이름으로 재설정
		fileName = fileName + "." + ext;
		// 파일생성 위치/이름
		uploadFile = new File(uploadPath, fileName);
		// 업로드
		thumbnail.transferTo(uploadFile);
		/*
		 * tomcatFile=new File(tomcatURL,fileName); thumbnail.transferTo(tomcatFile);
		 */
		//등록되면 해당 thumnail에 해당하는 이모티콘 아이디(int) 받아오기
		Emoticon emoticonVO=new Emoticon();
		EmoticonList emoticonListVO=new EmoticonList();
		emoticonVO.setE_title(emoticon.getE_title());
		emoticonVO.setU_name(user.getU_name());
		emoticonVO.setE_thumbnail(fileName);
		emoticonVO.setE_path(savePath+fileName);
		uploadEmoticon(emoticonVO);
		int uploadEmoticonId=getEmoticonId(emoticonVO);
		
		System.out.println("현재 업로드된 uploadEmoticonId -->"+uploadEmoticonId);
		
		/*
		 * 다중파일
		 */
		for (MultipartFile file : emoticonList) {
			
			ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
			
			fileName = file.getOriginalFilename();
			
			fileName = UUID.randomUUID().toString();
			
			fileName = fileName + "." + ext;
			
			uploadFile = new File(uploadPath, fileName);
			file.transferTo(uploadFile);
			
			/*
			 * tomcatFile=new File(tomcatURL,fileName); file.transferTo(tomcatFile);
			 */
			 
			
			//등록되면 해당 thumnail에 해당하는 이모티콘 아이디(int) 를 통해 같이 저장됨
			emoticonListVO.setE_id(uploadEmoticonId);
			emoticonListVO.setEl_name(fileName);
			emoticonListVO.setEl_path(savePath+fileName);
			uploadEmoticonList(emoticonListVO);
		}
		return 1;
	}
	@Override
	public void uploadEmoticon(Emoticon emoticon) {
	
		dao.uploadEmoticon(emoticon);
	}

	@Override
	public int getEmoticonId(Emoticon emoticon) {
	
		int emoticonId = dao.getEmoticonId(emoticon);
		return emoticonId;
	}

	@Override
	public void uploadEmoticonList(EmoticonList emoticonList) {
		dao.uploadEmoticonList(emoticonList);
	}
	//업로드
	@Override
	public int getEmoticonCount(Emoticon emoticon) {
		
		return dao.selectCount(emoticon);
	}

	@Override
	public List<Emoticon> getEmoticonList(Emoticon emoticon) {
		
		return dao.getEmoticonList(emoticon);
	}
	@Override
	public List<EmoticonList> getSeletedEmoticonList(Emoticon emoticon) {
		
		return dao.getSeletedEmoticonList(emoticon);
	}

	@Override
	public Emoticon getSeletedEmoticonInfo(Emoticon emoticon) {

		return dao.getSeletedEmoticonInfo(emoticon);
	}

	@Override
	public int purchaseCheck(User user,UserEmoticon userEmoticon) {
		userEmoticon.setU_name(user.getU_name());
		return dao.purchaseCheck(userEmoticon);
	}
	@Override
	public void deleteEmoticon(UserEmoticon userEmoticon) {
		dao.deleteEmoticon(userEmoticon);
	}
	
	@Override
	public void purchaseEmoticon(UserEmoticon userEmoticon) {
	dao.purchaseEmoticon(userEmoticon);
	}
	@Override
	public List<UserEmoticon> getMypageEmoticonList(User user,UserEmoticon userEmoticon) {
		userEmoticon.setU_name(user.getU_name());
		return dao.selectMypageEmoticonList(userEmoticon);
	}
	@Override
	public List<UserEmoticon> getUserEmoticonList(UserEmoticon userEmoticon) {
		
		return dao.selectEmoticonList(userEmoticon);
	}
	@Override
	public int checkTitle(Emoticon emoticon) {
		emoticon.setE_title(emoticon.getE_title().trim());
		return dao.checkTitle(emoticon);
	}
	@Override
	public int getMyEmoticonCount(User user,UserEmoticon userEmoticon) {
		userEmoticon.setU_name(user.getU_name());
		return dao.selectMyEmoticonCount(userEmoticon);
	}
}

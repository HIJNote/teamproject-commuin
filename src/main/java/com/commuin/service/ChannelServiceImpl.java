package com.commuin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commuin.persistence.ChannelDao;
import com.commuin.persistence.SubscribeDao;
import com.commuin.persistence.TagDao;
import com.commuin.vo.Channel;
import com.commuin.vo.Subscribe;
import com.commuin.vo.Tag;
import com.commuin.vo.User;
@Service
public class ChannelServiceImpl implements ChannelService {
	@Autowired
	ChannelDao channelDao;
	@Autowired
	TagDao tagDao;	
	@Autowired
	SubscribeDao subscribe;
	@Autowired
	GuestService guestService;
	@Autowired
	TagService tagService;
	
	
	@Override
	public int checkChannelName(Channel channel) {
		
		return channelDao.selectCheckChannelName(channel);
	}
	/*
	 * 유저의 포인트가 3000이상이면 유저의 포인트 3000 감소하고
	 * 채널을 생성한다. + 전체,공지 태그를 추가한다.
	 */
	@Override
	public int addChannel(User user,Channel channel) {
		if(!(user.getU_pt()>=3000))
			return 0;
		String [] category= {"게임","취미/생활","여행","음식","스포츠","연예/방송","스포츠","만화/애니","음악","뷰티"};
		int check=0;
		for(String test : category) {
			if(test.equals(channel.getCh_category()))
				check++;
		}
		if(check==0)
			return 0;
		channel.setU_name(user.getU_name());
		channelDao.insertChannel(channel);
		guestService.changePointDownChannel(user);
		int ch_id = getChannelId(channel);
		Tag tag=new Tag();	
		tag.setCh_id(ch_id);
		tag.setTg_name("전체");
		tagService.addTagTrigger(tag);
		tag.setTg_name("공지");
		tagService.addTagTrigger(tag);
		return 1;
		
	}
	@Override
	public List<Channel> getChannelList(Channel channel,User user) {	
		Subscribe sub=new Subscribe();
		List<Channel> chList=channelDao.selectChannelList(channel);
		List<Channel> returnCh=new ArrayList<Channel>();
		for(Channel ch: chList) {
			System.out.println(ch);
			sub.setCh_id(ch.getCh_id());
			sub.setU_name(user.getU_name());
			int check=subscribe.selectSubscribe(sub);

			Channel copy=new Channel();
			copy.setSubscribeCheck(check);
			copy.setCh_id(ch.getCh_id());
			copy.setCh_name(ch.getCh_name());
			copy.setU_name(ch.getU_name());
			copy.setCh_intro(ch.getCh_intro());
			copy.setCh_category(ch.getCh_category());
			copy.setCh_subscribe(ch.getCh_subscribe());

			returnCh.add(copy);
		}
		
		return returnCh;
	}
	
	//채널 아이디를 가져온다
	@Override
	public int getChannelId(Channel channel) {
		
		return channelDao.selectChannelId(channel);
	}
	/*
	 * 나의채널 정보+해당 아이디 채널의 태그목록
	 * 1.채널목록을 불러온다
	 * 2.채널목록의 아이디에 해당하는 태그목록을 불러온다
	 * 3.새로운 객체를 만들고 저장한다?
	 */
	@Override
	public List<Channel> getMyChannelList(Channel channel) {
		/*
		 * 채널의 아이디,이름,생성자이름,구독자수,태그이름들(리스트형태)를 저장할 객체 생성
		 */
		List<Channel> chInfoAll=new ArrayList<Channel>();
		/*
		 * 
		 */
		List<Channel> chList=channelDao.selectMyChannelList(channel);
		for(Channel channelInfo:chList) {
			Tag tag=new Tag();
			tag.setCh_id(channelInfo.getCh_id());
//			System.out.println("채널아이디 "+channelInfo.getCh_id());
			List<Tag> tagList=tagDao.selectTagList(tag);
			/*
			 * for(Tag tagListTest : tagList) { System.out.println("태그이름 "+
			 * tagListTest.getTg_name()); }
			 */
			Channel chInfo=new Channel();
			chInfo.setCh_id(channelInfo.getCh_id());
			chInfo.setCh_name(channelInfo.getCh_name());
			chInfo.setU_name(channelInfo.getU_name());
			chInfo.setCh_name(channelInfo.getCh_name());
			chInfo.setCh_grade(channelInfo.getCh_grade());
			chInfo.setCh_intro(channelInfo.getCh_intro());
			chInfo.setChannelTagList(tagList);
			
			chInfoAll.add(chInfo);
		
		}
		/*
		 * for(Channel ch: chInfoAll) { System.out.println(ch); }
		 */
		
		
		return chInfoAll;
	}
	@Override
	public Channel getChannel(Channel channel) {
		
		return channelDao.selectChannel(channel);
	}
	
	@Override
	public int changeIntro(Channel channel) {
		System.out.println("channel-->changeIntro");
		return channelDao.updateIntro(channel);
	}
	
}

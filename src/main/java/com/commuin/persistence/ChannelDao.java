	package com.commuin.persistence;

import java.util.List;

import com.commuin.vo.Channel;

public interface ChannelDao {

	//생성, 채널정보가져오기, 태그추가, 해당채널에 같은 태그 있으면 경고
	int insertChannel(Channel channel);

	List<Channel> selectChannelList(Channel channel);
	

	int selectCheckChannelName(Channel channel);
	
	int selectChannelId(Channel channel);
	
	List<Channel> selectMyChannelList(Channel channel);
	
	Channel selectChannel(Channel channel);
	
	//채널 소개글을 수정함
	int updateIntro(Channel channel);
	

}
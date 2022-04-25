package com.commuin.service;

import java.util.List;

import com.commuin.vo.Channel;
import com.commuin.vo.User;

public interface ChannelService {

	public int checkChannelName(Channel channel);
	public int addChannel(User user,Channel channel);
	public List<Channel> getChannelList(Channel channel,User user);
	public int getChannelId(Channel channel);
	public List<Channel> getMyChannelList(Channel channel);
	public Channel getChannel(Channel channel);
	public int changeIntro(Channel channel);
}

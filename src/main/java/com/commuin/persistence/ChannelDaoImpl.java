package com.commuin.persistence;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Channel;

@Repository
public class ChannelDaoImpl implements ChannelDao {
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int selectCheckChannelName(Channel channel) {

		return mybatis.selectOne("ChannelDao.checkName", channel);
	}

	@Override
	public int insertChannel(Channel channel) {

		return mybatis.insert("ChannelDao.insertChannel", channel);
	}


	@Override
	public List<Channel> selectChannelList(Channel channel) {

		return mybatis.selectList("ChannelDao.selectChannelList", channel);
	}
	
	@Override
	public int selectChannelId(Channel channel) {
		
		return mybatis.selectOne("ChannelDao.selectChannelId",channel);
	}
	@Override
	public List<Channel> selectMyChannelList(Channel channel) {
		
		return mybatis.selectList("ChannelDao.selectMyChannelList", channel);
	}
	@Override
	public Channel selectChannel(Channel channel) {
		
		return mybatis.selectOne("ChannelDao.selectChannel", channel);
	}
	@Override
	public int updateIntro(Channel channel) {
		
		return mybatis.update("ChannelDao.updateIntro",channel);
	}
}

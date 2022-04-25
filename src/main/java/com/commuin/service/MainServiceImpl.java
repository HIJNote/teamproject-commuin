package com.commuin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commuin.persistence.MainDao;
import com.commuin.vo.Board;
import com.commuin.vo.Channel;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	MainDao mainDao;
	@Override
	public List<Channel> getMainViewList(){
		/*
		 * 1. 채널구한다 2.해당채널로 가지는 게시글 구한다 3.새로운 채널에 합친다
		 */
		List<Channel> channelList=mainDao.selectChannelList();
		List<Channel> mainViewList=new ArrayList<Channel>();
		for(Channel ch : channelList) {
			Channel channel=new Channel();			
			channel.setCh_id(ch.getCh_id());
			channel.setCh_name(ch.getCh_name());
			channel.setCh_grade(ch.getCh_grade());
			channel.setCh_intro(ch.getCh_intro());
			Board board=new Board();
			board.setCh_name(ch.getCh_name());
			List<Board> boardList=mainDao.selectBoardList(board);
			channel.setMainBoardList(boardList);
			mainViewList.add(channel);
		}
		
		return mainViewList;
	}
	@Override
	public List<Channel> getBestViewList(){
		List<Channel> channelList=mainDao.selectBestChannel();
		List<Channel> bestViewList=new ArrayList<Channel>();
		for(Channel ch : channelList) {
			Channel channel=new Channel();			
			channel.setCh_id(ch.getCh_id());
			channel.setCh_name(ch.getCh_name());
			channel.setCh_grade(ch.getCh_grade());
			channel.setCh_intro(ch.getCh_intro());
			Board board=new Board();
			board.setCh_name(ch.getCh_name());
			List<Board> boardList=mainDao.selectBoardList(board);
			channel.setMainBoardList(boardList);
			bestViewList.add(channel);
		}
		
		
		return bestViewList;
	}
}

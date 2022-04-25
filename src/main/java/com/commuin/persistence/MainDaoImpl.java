package com.commuin.persistence;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Board;
import com.commuin.vo.Channel;

@Repository
public class MainDaoImpl implements MainDao{

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<Channel> selectChannelList() {
		
		return mybatis.selectList("main.selectChannelList");
	}

	@Override
	public List<Board> selectBoardList(Board board) {
		if(board.getCh_name().equals("베스트 게시글"))
			return mybatis.selectList("main.selectBestList", board);
		
		return mybatis.selectList("main.selectBoardList", board);
	}
	@Override
	public List<Channel> selectBestChannel(){
		return mybatis.selectList("main.selectBestChannel");
	}
	@Override
	public List<Channel> channelList() {
		
		List<Channel> vo = mybatis.selectList("main.channelList");
		
		return vo;
	}

}

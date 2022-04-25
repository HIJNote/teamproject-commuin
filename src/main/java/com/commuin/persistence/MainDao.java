package com.commuin.persistence;

import java.util.List;

import com.commuin.vo.Board;
import com.commuin.vo.Channel;

/*
 * 1.채널목록 가졍모
 * 2.채널이름에 해당하는 게시판 이름 가져옴
 * 3.새로운 채널목록을 만들고 차례차례 저장한다
 */
public interface MainDao {

	public List<Channel> selectChannelList();
	public List<Board> selectBoardList(Board board);
	public List<Channel> selectBestChannel();
	public List<Channel> channelList(); // 메인 접솏 주요 채널 조회
}

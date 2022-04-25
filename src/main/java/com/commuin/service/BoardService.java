package com.commuin.service;

import java.util.List;

import com.commuin.vo.Board;
import com.commuin.vo.Reply;
import com.commuin.vo.User;

public interface BoardService {
	public Board boardInsert(Board board);
	public Board getBoard(Board board);

	// 해당 채널의 게시글의 총 숫자. 태그,검색어 등 종합해서 계산해야함
	public int getBoardCount(Board board);
	//페이징 태그,검색어 등 종합해서 계산해야함
	public List<Board> getBoardList(Board board);
	//각채널에해당하는 공지글 출력
	public List<Board> getNoticeList(Board board);
	
	public int reply(int b_id);
	public List<Reply> replyList(int b_id);
	
	List<Board> getMypageBoardList(User user,Board board);
	
	//추가
	public int boardDelete(String b_id);
	public int checkPoint(String u_id);
	
	public int getMyBoardCount(User user,Board board);
	
	//게시글 수정
	public Board updateBoardSelect(int b_id);
	public Board boardUpdate(Board board);
}

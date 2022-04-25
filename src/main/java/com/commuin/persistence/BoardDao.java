package com.commuin.persistence;

import java.util.List;

import com.commuin.vo.Board;
import com.commuin.vo.Reply;

public interface BoardDao {
	public Board boardInsert(Board board);

	public Board selectBoard(Board board);

	// 페이징
	public List<Board> selectBoardList(Board board);
	// 페이징할 게시글의 숫자
	public int selectBoardCount(Board board);
	List<Board> selectMypageBoardList(Board board);
	List<Board> selectNoticeBoardList(Board board);
	
	public int reply(int b_id);
	public List<Reply> replyList(int b_id);

	//추가
	public int boardDelete(String b_id);
	public int checkPoint(String u_id);
	
	//내가 등록한 게시글 수
	public int selectMyBoardCount(Board board);
	
	//게시글 수정
	public Board updateBoardSelect(int b_id);
	public Board boardUpdate(Board board);
}

package com.commuin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.commuin.persistence.BoardDao;
import com.commuin.vo.Board;
import com.commuin.vo.Reply;
import com.commuin.vo.User;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	/*
	 * 글쓰기
	 */
	@Override
	public Board boardInsert(Board board) {
		// TODO Auto-generated method stub
		return dao.boardInsert(board);
	}

	@Override
	public Board getBoard(Board board) {

		return dao.selectBoard(board);
	}


//페이징 하기전 채널의 게시글 수 가져옴
	@Override
	public int getBoardCount(Board board) {
		
		return dao.selectBoardCount(board);
	}
//페이징 시작
	@Override
	public List<Board> getBoardList(Board board) {
		
		return dao.selectBoardList(board);
	}
	//공지글
	@Override
	public List<Board> getNoticeList(Board board) {
		
		return dao.selectNoticeBoardList(board);
	}

	// 댓글
	@Override
	public int reply(int b_id) {
		// TODO Auto-generated method stub
		return dao.reply(b_id);
	}

	@Override
	public List<Reply> replyList(int b_id) {
		// TODO Auto-generated method stub
		return dao.replyList(b_id);
	}
	
	@Override
	public List<Board> getMypageBoardList(User user,Board board){
		board.setU_name(user.getU_name());
		return dao.selectMypageBoardList(board);
	}
		
	//게시글 삭제
	@Override
	public int boardDelete(String b_id) {
		// TODO Auto-generated method stub
		int cnt = dao.boardDelete(b_id);
		return cnt;
	}
	
	@Override
	public int checkPoint(String u_id) {
		// TODO Auto-generated method stub
		int cnt = dao.checkPoint(u_id);
		return cnt;
	}	
	
	@Override
	public int getMyBoardCount(User user,Board board) {
		board.setU_name(user.getU_name());
		return dao.selectMyBoardCount(board);
	}

	//게시글 수정
	@Override
	public Board updateBoardSelect(int b_id) {
		// TODO Auto-generated method stub
		return dao.updateBoardSelect(b_id);
	}

	@Override
	public Board boardUpdate(Board board) {
		// TODO Auto-generated method stub
		return dao.boardUpdate(board);
	}
	
	
}

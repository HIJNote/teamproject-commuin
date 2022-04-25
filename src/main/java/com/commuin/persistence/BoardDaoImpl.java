package com.commuin.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Board;
import com.commuin.vo.Reply;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	SqlSessionTemplate mybatis;

	// 게시글 추가후 해당 게시글을 가져옴
	@Override
	public Board boardInsert(Board board) {

		// 추가
		sqlSession.selectOne("BoardDao" + ".boardInsert", board);

		// 가져오기
		Board boardInfo = sqlSession.selectOne("BoardDao" + ".boardSelect", board);
		return boardInfo;
	}

	// 게시글을 누르면 조회수를 증가시키고 가져온다
	@Override
	public Board selectBoard(Board board) {
		mybatis.update("BoardDao.updateBoardView", board);
		return mybatis.selectOne("BoardDao.selectBoard", board);
	}


	/*
	 * 페이징+검색+타겟+태그로 가져오기 위함
	 */
	@Override
	public List<Board> selectBoardList(Board board) {
		
		List<Board> list =mybatis.selectList("BoardDao.selectBoardList", board);
		
		return list;
	}

	// 채널 이름에 해당하는 모든 게시글들의 수를 받아옴. 페이징 하기전 totalCount 구하기 위해서임.
	@Override
	public int selectBoardCount(Board board) {

		return mybatis.selectOne("BoardDao.selectBoardCount", board);
	}

	@Override
	public List<Board> selectNoticeBoardList(Board board) {
		
		return mybatis.selectList("BoardDao.selectNoticeBoardList",board);
	}
	
	/*
	 * 댓글
	 */
	@Override
	public int reply(int b_id) {

		return mybatis.selectOne("BoardDao.reply", b_id);
	}

	@Override
	public List<Reply> replyList(int b_id) {

		return mybatis.selectList("BoardDao.replyList", b_id);
	}
	
	@Override
	public List<Board> selectMypageBoardList(Board board){
		return mybatis.selectList("mypage.selectMypageBoardList", board);
	}
	
	//게시글 삭제
	@Override
	public int boardDelete(String b_id) {
		// TODO Auto-generated method stub
		int cnt = sqlSession.update("BoardDao.boardDelete", b_id);
		return cnt; 
	}
		
	@Override
	public int checkPoint(String u_id) {
		// TODO Auto-generated method stub
		int cnt = sqlSession.selectOne("BoardDao.checkPoint", u_id);
		return cnt;
	}
	@Override
	public int selectMyBoardCount(Board board) {
		System.out.println(board.getU_name());
		int a=mybatis.selectOne("mypage.selectBoardCount",board);
		System.out.println(a);
		return a;
	}

	//게시글 수정
	@Override
	public Board updateBoardSelect(int b_id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("BoardDao.updateBoardSelect", b_id);
	}

	@Override
	public Board boardUpdate(Board board) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("BoardDao.boardUpdate", board);
	}
	
	
}

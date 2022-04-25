package com.commuin.persistence;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.commuin.vo.Board;
import com.commuin.vo.Channel;
import com.commuin.vo.Chart;
import com.commuin.vo.Emoticon;
import com.commuin.vo.Reply;
import com.commuin.vo.User;

@Repository
public class HostDaoImpl implements HostDao {
	@Autowired
	SqlSession sqlSession;

	// �̸�Ƽ�� �Ǹ� ����
	@Override
	public ArrayList<Emoticon> emoticonInfo() {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		ArrayList<Emoticon> vo = dao.emoticonInfo();

		return vo;
	}

	// �� �� �湮�� �� ��ȸ
	@Override
	public ArrayList<Chart> dayInfo(int month) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		ArrayList<Chart> vo = dao.dayInfo(month); 

		return vo;
	}

	// ���� ȸ�� ������, ���� ȸ�� ���� ��, ���� ȸ�� �� ��ȸ
	@Override
	public ArrayList<User> joinInfo() {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		ArrayList<User> vo = dao.joinInfo();

		return vo;
	}

	// ���� ��ϵ� �Խñ�, ���� ��ϵ� �Խñ� ��, ���� �Խñ� �� ��ȸ
	@Override
	public ArrayList<Board> boardInfo() {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		ArrayList<Board> vo = dao.boardInfo();

		return vo;
	}

	// ���� ��ϵ� ���� ��, ���� ��ϵ� ���� �� ��, ���� ���� �� ��
	@Override
	public ArrayList<Board> boardQuestionInfo() {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		ArrayList<Board> vo = dao.boardQuestionInfo();

		return vo;
	}

	// ȸ�� ���� 1 ~ 5�� ��ȸ
	@Override
	public ArrayList<User> userRank() {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		ArrayList<User> vo = dao.userRank();

		return vo;
	}

	// ȸ�� ����Ʈ
	@Override
	public ArrayList<User> userAllList() {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		ArrayList<User> vo = dao.userAllList();

		return vo;
	}

	// ȸ�� ��
	@Override
	public ArrayList<User> userCnt() {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		ArrayList<User> vo = dao.userCnt();

		return vo;
	}

	// ȸ�� �޸� ����Ʈ
	@Override
	public ArrayList<User> userOldList() {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		ArrayList<User> vo = dao.userOldList();

		return vo;
	}

	// ���� : �޸� -> ���� ����
	@Override
	public int userNormal(String name) {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		int cnt = dao.userNormal(name);

		return cnt;
	}

	// ���� : ���� -> ���� ����
	@Override
	public int userStop(String name) {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		int cnt = dao.userStop(name);

		return cnt;
	}

	// ȸ�� ���� ��ȸ
	@Override
	public User userInfo(String name) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		User vo = dao.userInfo(name);
		
		return vo;
	}

	// ��ü �Խñ� ��ȸ
	@Override
	public ArrayList<Board> boardAllList() {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		ArrayList<Board> vo = dao.boardAllList();
		
		return vo;
	}

	//��ü ������ ��ȸ
	@Override
	public ArrayList<Board> b_Announcement_List() {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		ArrayList<Board> vo = dao.b_Announcement_List();
		
		return vo;
	}
	
	//��ü ���Ǳ� ��ȸ
	@Override
	public ArrayList<Board> b_Question_List() {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		ArrayList<Board> vo = dao.b_Question_List();
		
		return vo;
	}
	
	//��ü ����ε� �� ��ȸ
	@Override
	public ArrayList<Board> b_Delete_List() {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		ArrayList<Board> vo = dao.b_Delete_List();
		
		return vo;
	}

	//�Խñ� �� ����
	@Override
	public Board board_Info(int b_id) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		Board vo = dao.board_Info(b_id);
		
		return vo;
	}
	
	//�Ű� �Խñ� -> �Ϲ� �Խñ� ����
	@Override
	public int board_D_Change(Board vo) {
		HostDao dao = sqlSession.getMapper(HostDao.class);

		int cnt = dao.board_D_Change(vo);

		return cnt;
	}
	
	//�Ϲ� �Խñ� -> �Ű� �Խñ� ����
	@Override
	public int board_R_Change(Board vo) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		int cnt = dao.board_R_Change(vo);

		return cnt;
	}
	
	// ������ �ۼ�
	@Override
	public int adminBoardInsert(Board vo) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		int cnt = dao.adminBoardInsert(vo);

		return cnt;
	}
	
	//��� ����
	@Override
	public ArrayList<Reply> reply_Info(int b_id) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		ArrayList<Reply> vo = dao.reply_Info(b_id);
		
		return vo;
	}
	
	// ����ۼ�
	@Override
	public int replyInsert(Reply vo) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		dao.replyInsert(vo);
		int cnt = sqlSession.selectOne("com.commuin.persistence.HostDao.replyId", vo);
		
		return cnt;
	}
	// �Խñ� ��� �� 1 �߰�
	@Override
	public int board_Reply_Count_Update(Reply vo) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		int cnt = dao.board_Reply_Count_Update(vo);
		
		return cnt;
	}
	// ��� �� ��������
	@Override
	public int reply_Count(int b_id) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		int cnt = dao.reply_Count(b_id);
		
		return cnt;
	}
	
	//추가
	@Override
	public int replyBoardPoint(String u_name) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		int cnt = dao.replyBoardPoint(u_name);
		
		return cnt;
	}

	@Override
	public void replyDelete(Reply vo) {
		// TODO Auto-generated method stub
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		dao.replyDelete(vo);
	}

	@Override
	public int boardReplyCountDown(Reply vo) {
		// TODO Auto-generated method stub
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		int cnt = dao.boardReplyCountDown(vo);
		System.out.println("down 완료 " + cnt);
		return cnt;
	}
	//채널 리스트
	@Override
	public ArrayList<Channel> adminChannelList() {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		ArrayList<Channel> c_All_List = dao.adminChannelList();
		
		return c_All_List;
	}
		
	// 채널 일반 -> 메인 승급
	@Override
	public int channelChange(@Param("channel") Channel channel) {
		HostDao dao = sqlSession.getMapper(HostDao.class);
		
		int cnt = dao.channelChange(channel);
		
		return cnt;
	}
}

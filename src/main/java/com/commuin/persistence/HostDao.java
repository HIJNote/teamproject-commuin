package com.commuin.persistence;

import java.util.ArrayList;

import com.commuin.vo.Emoticon;
import com.commuin.vo.Reply;
import com.commuin.vo.User;
import com.commuin.vo.Board;
import com.commuin.vo.Channel;
import com.commuin.vo.Chart;

public interface HostDao {
	public ArrayList<Emoticon> emoticonInfo(); // �̸�Ƽ�� �Ǹ� ����
	public ArrayList<Chart> dayInfo(int month); // �� �� �湮�� �� ��ȸ
	public ArrayList<User> joinInfo(); // ���� ȸ�� ������, ���� ȸ�� ���� ��, ���� ȸ�� �� ��ȸ
	public ArrayList<Board> boardInfo(); // ���� ��ϵ� �Խñ�, ���� ��ϵ� �Խñ� ��, ���� �Խñ� �� ��ȸ
	public ArrayList<Board> boardQuestionInfo(); // ���� ��ϵ� ���� ��, ���� ��ϵ� ���� �� ��, ���� ���� �� ��
	public ArrayList<User> userRank(); // ȸ�� ���� 1 ~ 5�� ��ȸ
	public ArrayList<User> userAllList(); // ȸ�� ����Ʈ
	public ArrayList<User> userCnt(); // ȸ�� �� ��ȸ
	public ArrayList<User> userOldList(); // ȸ�� �޸� ����Ʈ
	public int userNormal(String name); // ���� : �޸� -> ���� ����
	public int userStop(String name); // ���� : ���� -> ���� ����
	public User userInfo(String name); // ȸ�� ���� ��ȸ
	public ArrayList<Board> boardAllList(); // ��ü �Խñ� ��ȸ
	public ArrayList<Board> b_Announcement_List(); // ��ü ������ ��ȸ
	public ArrayList<Board> b_Question_List(); // ��ü ���Ǳ� ��ȸ
	public ArrayList<Board> b_Delete_List(); // ��ü ����ε�� ��ȸ
	public Board board_Info(int b_id); // �Խñ� �� ���� 
	public int board_D_Change(Board vo); //�Ű� �Խñ� -> �Ϲ� �Խñ� ����
	public int board_R_Change(Board vo); //�Ϲ� �Խñ� -> �Ű� �Խñ� ����
	public int adminBoardInsert(Board vo); // ������ �ۼ�
	public ArrayList<Reply> reply_Info(int b_id); // ��� ����
	public int replyInsert(Reply vo); // ��� �ۼ�
	public int board_Reply_Count_Update(Reply vo); // �Խñ� ��� cnt + 1
	public int reply_Count(int b_id);
	public ArrayList<Channel> adminChannelList(); //채널 리스트
	public int channelChange(Channel channel); // 채널 일반 -> 메인 승급
	//추가
	public int replyBoardPoint(String u_name);
	public void replyDelete(Reply vo);
	public int boardReplyCountDown(Reply vo);
}

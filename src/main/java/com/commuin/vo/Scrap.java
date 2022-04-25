package com.commuin.vo;

import java.sql.Timestamp;

//어떤 유저가 해당 게시글을 스크랩 했는지
public class Scrap {
	private int sc_id;
	private int b_id;
	private String u_name;
	private Timestamp sc_date;
	private Board board;
	private Channel channel;
	
	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public int getSc_id() {
		return sc_id;
	}

	public void setSc_id(int sc_id) {
		this.sc_id = sc_id;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public Timestamp getSc_date() {
		return sc_date;
	}

	public void setSc_date(Timestamp sc_date) {
		this.sc_date = sc_date;
	}

	@Override
	public String toString() {
		return "Scrap [sc_id=" + sc_id + ", b_id=" + b_id + ", u_name=" + u_name + ", sc_date=" + sc_date + ", board="
				+ board + ", channel=" + channel + "]";
	}

}

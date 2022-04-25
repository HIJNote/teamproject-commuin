package com.commuin.vo;

// 어떤 회원이 해당 채널을 구독했는지
public class Subscribe {
	private int s_num;
	private int ch_id;
	private String u_name;

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public int getCh_id() {
		return ch_id;
	}

	public void setCh_id(int ch_id) {
		this.ch_id = ch_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	@Override
	public String toString() {
		return "Subscribe [s_num=" + s_num + ", ch_id=" + ch_id + ", u_name=" + u_name + "]";
	}

}

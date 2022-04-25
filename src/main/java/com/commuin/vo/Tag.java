package com.commuin.vo;

//어떤 채널에 어떤 태그가 있는지...
public class Tag {
	private int tg_id;
	private String tg_name;
	private int ch_id;
	//태그이름을 바꾸기위해 만듬
	private String tg_change;

	

	public String getTg_change() {
		return tg_change;
	}

	public void setTg_change(String tg_change) {
		this.tg_change = tg_change;
	}

	public int getTg_id() {
		return tg_id;
	}

	public void setTg_id(int tg_id) {
		this.tg_id = tg_id;
	}

	public String getTg_name() {
		return tg_name;
	}

	public void setTg_name(String tg_name) {
		this.tg_name = tg_name;
	}

	public int getCh_id() {
		return ch_id;
	}

	public void setCh_id(int ch_id) {
		this.ch_id = ch_id;
	}

	@Override
	public String toString() {
		return "Tag [tg_id=" + tg_id + ", tg_name=" + tg_name + ", ch_id=" + ch_id + ", tg_change=" + tg_change + "]";
	}


	

}

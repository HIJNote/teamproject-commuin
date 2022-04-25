package com.commuin.vo;

// 어떤유저가 어떤이모티콘을 구입했는지.
public class UserEmoticon {
	private int ue_id;
	private String u_name;
	private int e_id;
	Emoticon emoticon;

	public int getUe_id() {
		return ue_id;
	}

	public void setUe_id(int ue_id) {
		this.ue_id = ue_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
	}

	public Emoticon getEmoticon() {
		return emoticon;
	}

	public void setEmoticon(Emoticon emoticon) {
		this.emoticon = emoticon;
	}

	@Override
	public String toString() {
		return "UserEmoticon [ue_id=" + ue_id + ", u_name=" + u_name + ", e_id=" + e_id + ", emoticon=" + emoticon
				+ "]";
	}

}

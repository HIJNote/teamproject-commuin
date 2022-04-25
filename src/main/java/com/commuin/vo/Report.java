package com.commuin.vo;

//어떤 게시글을 어떤 회원이 신고했는지
public class Report {
private int re_id;
private int b_id;
private String u_name;
private String u_id;
private String re_reason;



public String getU_id() {
	return u_id;
}
public void setU_id(String u_id) {
	this.u_id = u_id;
}
public String getRe_reason() {
	return re_reason;
}
public void setRe_reason(String re_reason) {
	this.re_reason = re_reason;
}
public int getRe_id() {
	return re_id;
}
public void setRe_id(int re_id) {
	this.re_id = re_id;
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
@Override
public String toString() {
	return "Report [re_id=" + re_id + ", b_id=" + b_id + ", u_name=" + u_name + ", u_id=" + u_id + ", re_reason="
			+ re_reason + "]";
}



}

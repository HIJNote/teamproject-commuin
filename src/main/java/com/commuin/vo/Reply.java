package com.commuin.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
/*
 * rp type => 0 이면 텍스트 / 1이면 이미지
 */
//어떤 게시글에 어떤회원이 어떤 내용의 글을 어떤 그룹에, 계층에, 순서....
public class Reply {
private int rp_id;
private int b_id;
private String u_name;
private String rp_content;
@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd") // (추가함)
private Timestamp rp_regdate;
private int rp_hierarchy;
private int rp_order;
private int rp_group;
private int rp_delete;
private int rp_type;
private Board board;



public Board getBoard() {
	return board;
}
public void setBoard(Board board) {
	this.board = board;
}
public int getRp_type() {
	return rp_type;
}
public void setRp_type(int rp_type) {
	this.rp_type = rp_type;
}
public int getRp_id() {
	return rp_id;
}
public void setRp_id(int rp_id) {
	this.rp_id = rp_id;
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
public String getRp_content() {
	return rp_content;
}
public void setRp_content(String rp_content) {
	this.rp_content = rp_content;
}
public Timestamp getRp_regdate() {
	return rp_regdate;
}
public void setRp_regdate(Timestamp rp_regdate) {
	this.rp_regdate = rp_regdate;
}
public int getRp_hierarchy() {
	return rp_hierarchy;
}
public void setRp_hierarchy(int rp_hierarchy) {
	this.rp_hierarchy = rp_hierarchy;
}
public int getRp_order() {
	return rp_order;
}
public void setRp_order(int rp_order) {
	this.rp_order = rp_order;
}
public int getRp_group() {
	return rp_group;
}
public void setRp_group(int rp_group) {
	this.rp_group = rp_group;
}
public int getRp_delete() {
	return rp_delete;
}
public void setRp_delete(int rp_delete) {
	this.rp_delete = rp_delete;
}
@Override
public String toString() {
	return "Reply [rp_id=" + rp_id + ", b_id=" + b_id + ", u_name=" + u_name + ", rp_content=" + rp_content
			+ ", rp_regdate=" + rp_regdate + ", rp_hierarchy=" + rp_hierarchy + ", rp_order=" + rp_order + ", rp_group="
			+ rp_group + ", rp_delete=" + rp_delete + ", rp_type=" + rp_type + "]";
}



}

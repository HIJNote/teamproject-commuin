package com.commuin.vo;

//어떤 게시글에 어떤 회원이 좋아요를 했는지
public class Follow {
private int f_id;
private int b_id;
private String u_name;
public int getF_id() {
	return f_id;
}
public void setF_id(int f_id) {
	this.f_id = f_id;
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
	return "Follow [f_id=" + f_id + ", b_id=" + b_id + ", u_name=" + u_name + "]";
}


}

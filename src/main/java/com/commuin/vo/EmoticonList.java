package com.commuin.vo;
//해당 이모티콘id에  속하는 이모티콘 파일들과 경로
public class EmoticonList {
private int el_id;
private int e_id;
private String el_name;
private String el_path;
public int getEl_id() {
	return el_id;
}
public void setEl_id(int el_id) {
	this.el_id = el_id;
}
public int getE_id() {
	return e_id;
}
public void setE_id(int e_id) {
	this.e_id = e_id;
}
public String getEl_name() {
	return el_name;
}
public void setEl_name(String el_name) {
	this.el_name = el_name;
}
public String getEl_path() {
	return el_path;
}
public void setEl_path(String el_path) {
	this.el_path = el_path;
}
@Override
public String toString() {
	return "EmoticonList [el_id=" + el_id + ", e_id=" + e_id + ", el_name=" + el_name + ", el_path=" + el_path + "]";
}

}

package com.st.bean;

import java.util.List;

public class Layjson {
	
	
private int code = 0;
private String msg = "";
private int count = 0;//总数据行数并不是每次查询出来的
private List data;
public List getData() {
	
	return data;
}
public void setData(List data) {
	//总数据行数并不是每次查询出来的
	this.data=data;
	
}

public int getCode() {
	return code;
}
public String getMsg() {
	return msg;
}

public int getCount() {
	return count;
}
public void setCode(int code) {
	this.code = code;
}

public void setMsg(String msg) {
	this.msg = msg;
}
public void setCount(int count) {
	this.count = count;
}
public Layjson(List data) {
	super();
//	if(data !=null) {
//		this.count=data.size();
//	}
	this.data=data;
}


}

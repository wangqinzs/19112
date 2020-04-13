package com.st.bean;

import java.util.ArrayList;
import java.util.List;

public class User {
	

public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getLatlogintime() {
		return latlogintime;
	}
	public void setLatlogintime(String latlogintime) {
		this.latlogintime = latlogintime;
	}
	
private String userid;
private String username;
private String userpass;
private String sex;
private String birthday;
private String tel;
private String state;
private String createtime;
private String latlogintime;
private String position;
private List roles;
public List getRoles() {
	return roles;
}
/**
 * 获得用户的所有权限
 * @return
 */
public List allPermissions() {
	List list=new ArrayList();
	for(int i=0;i<roles.size();i++) {
		Role_Bean role=(Role_Bean)roles.get(i);
		list.addAll(role.getPermissions());
	}
	return list;
}
public void setRoles(List roles) {
	this.roles = roles;
}
public List<String> permissionCodes(){
	List<Permission> list=allPermissions();
	List<String> list_code=new ArrayList();
	for(Permission p:list) {
		list_code.add(p.getPerm_code());
	}
	return list_code;
}
}

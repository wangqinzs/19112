package com.st.bean;

import java.util.List;

public class Role_Bean {
private String role_id;
private String role_code;
private String role_name;
private String state;
private List permissions;


public List getPermissions() {
	return permissions;
}
public void setPermissions(List permissions) {
	this.permissions = permissions;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getRole_id() {
	return role_id;
}
public void setRole_id(String role_id) {
	this.role_id = role_id;
}
public String getRole_code() {
	return role_code;
}
public void setRole_code(String role_code) {
	this.role_code = role_code;
}
public String getRole_name() {
	return role_name;
}
public void setRole_name(String role_name) {
	this.role_name = role_name;
}

}

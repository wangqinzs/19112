package com.st.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.st.bean.User;

public interface UserDao {
	List terrjson();
	
	int getCount(Map params);

	void addUser(Map params);

	void deleteUser(Map params);

	void updateUser(Map params);
	void Fenghao(User user);
	void Jiefeng(User user);
	List selectAllUser();

	List checkUser(Map params);
	User updateuser(User userid);
	// 定义dao层的业务方法
	List getUser(Map params);

	User getuser(String username);
}

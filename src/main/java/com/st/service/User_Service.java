package com.st.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.st.bean.User;
import com.st.dao.UserDao;
import com.st.util.Page;
import com.st.util.UUidutil;
@Service
public class User_Service {
@Autowired
UserDao userd;


	public List terrjson() {
		return userd.terrjson();
	}
	public void addUser(@RequestParam Map params) {
		// TODO Auto-generated method stub
		UUidutil.putuuid(params);
		//将密码通过MD5盐值加密
		
		SimpleHash sh=new SimpleHash("md5", "123456", params.get("uuid"));
	params.put("userpass", sh.toString());
		userd.addUser(params);

	}
	public void deleteUser(String userid) {
		// TODO Auto-generated method stub
		userd.deleteUser(null);
	}

	public void deleteUser(Map params) {
		// TODO Auto-generated method stub
		//params.put("state", "1");
	userd.deleteUser(params);

	}

	
	public void updateUser(Map params) {
		// TODO Auto-generated method stub
      userd.updateUser(params);
	}

	public List<User> getAllUser() {
		System.out.println("userservlice实现类");
		// TODO Auto-generated method stub
		return userd.selectAllUser();
	}

	

	public List<User> getUser(String checkinfo) {
		// 将参数封装成map形式
		Map map=new HashMap();
		map.put("checktext", checkinfo);
		//将封装好的map传入给dao执行查询并返回list
	List list=userd.getUser(map);
		return list;
	}

	public List<User> getUser(Map params) {
		// TODO Auto-generated method stub
		Page.pageParams(params);
		
		List list=userd.getUser(params);
		return list;
	}
	/**
	 * 查询总共的数据条数
	 */
	public int getCount(Map params) {
	// TODO Auto- generated method stub
	int count=userd.getCount(params);
	return count;
	}


	public List<User> getUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}
	public String getUser(String username, String userpass) {
		// TODO Auto-generated method stub
		return null;
	}
	public void Fenghao(User user) {
		// TODO Auto-generated method stub
		userd.Fenghao(user);
	}
	public void Jiefeng(User user) {
		// TODO Auto-generated method stub
		userd.Jiefeng(user);
	}
	public User getuser(String username) {
		// TODO Auto-generated method stub
		return userd.getuser(username);
	}
}

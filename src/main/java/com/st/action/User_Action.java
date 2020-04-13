package com.st.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.Layjson;
import com.st.bean.User;
import com.st.service.User_Service;

@Controller
@RequestMapping("/sys")
public class User_Action {
	@Autowired
	User_Service users;

	@RequestMapping("/houtai")
	public String houtai() {
		return "sys/houtai";
	}

	@RequestMapping("/user_page")
	public String user_page() {
		return "sys/user_page";
	}

	@RequestMapping("/xml")
	public String xmlgetuser() {
		return "sys/2";
	}

	@RequestMapping("/userlist")
	@ResponseBody
	public Layjson alluser(@RequestParam Map params) {
//查询总的数据有多少行
		int count = users.getCount(params);
		System.out.println("count" + count);
		List listuser = users.getUser(params);
		System.out.println("listuser" + listuser);
		Layjson layjson = new Layjson(listuser);
		layjson.setData(listuser);
		layjson.setCount(count);

		return layjson;

	}

	

	@RequestMapping("/adduser")
	@ResponseBody
	public void addUser(@RequestParam Map params) {
		users.addUser(params);

	}

	@RequestMapping("/deleteuser")
	@ResponseBody
	public void deleteUser(@RequestParam Map params) {
		users.deleteUser(params);
		System.out.println("---删除成功");

	}

	@RequestMapping("/updateuser")
	@ResponseBody
	public void updateUser(@RequestParam Map params) {
		System.out.println("4");
		users.updateUser(params);

	}

	@RequestMapping("/fenghao")
	@ResponseBody
	public void Fenghao(User user) {

		users.Fenghao(user);
		System.out.println(user);

	}

	@RequestMapping("/jiefeng")
	@ResponseBody
	public void Jiefeng(User user) {

		users.Jiefeng(user);
		System.out.println(user);

	}
}

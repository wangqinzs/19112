package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.Layjson;
import com.st.bean.User;
import com.st.service.CoustomerService;
import com.st.util.Context;

@Controller
@RequestMapping("/sys")
public class CoustomerAction {
	@Autowired
	CoustomerService cous;

	@RequestMapping("/cou")

	public String coustomer() {
		return "sys/coustomer";
	}

	@RequestMapping("/coupublic")

	public String coustomerpub() {
		return "sys/publiccoustomer";
	}
	@RequestMapping("/privatelist")

	public String privatelist() {
		return "sys/privatecoustomer";
	}
	@RequestMapping("/mycou")

	public String mycou() {
		return "sys/mycoustomer";
	}
	
	@RequestMapping("/coustomerlist")
	@ResponseBody
	public Layjson coustomerlist(@RequestParam Map params) {

		int count = cous.getCount(params);
		System.out.println("count" + count);
		List listuser = cous.getcoustomer(params);

// 通过request向前台传值--作用域对象可以通过方法参数注入
		Layjson layjson = new Layjson(listuser);
		layjson.setData(listuser);
		layjson.setCount(count);

		return layjson;

	}

	@RequestMapping("/addcoustomer")
	@ResponseBody
	public void addcoustomer(@RequestParam Map params) {
		cous.addcoustomer(params);

	}

	@RequestMapping("/deletecoustomer")
	@ResponseBody
	public void deletecoustomer(@RequestParam Map params) {
		cous.deletecoustomer(params);

	}

	@RequestMapping("/updatecoustomer")
	@ResponseBody
	public void updatecoustomer(@RequestParam Map params) {

		cous.updatecoustomer(params);

	}

	@RequestMapping("/fenghaoc")
	@ResponseBody
	public void Fenghaoc(Map params) {

		cous.Fenghao(params);

	}

	@RequestMapping("/jiefengc")
	@ResponseBody
	public void Jiefengc(Map params) {

		cous.Jiefeng(params);

	}
//查询公海客户
	@RequestMapping("/publiccoustomerlist")
	@ResponseBody
	public Layjson publiccoustomerlist(@RequestParam Map params) {

		int count = cous.getCountpublic(params);

		List listuser = cous.getcoustomerpublic(params);
		Layjson layjson = new Layjson(listuser);
		layjson.setData(listuser);
		layjson.setCount(count);

		return layjson;

	}
//执行跟单的方法
	@RequestMapping("/coutomer_private")
	@ResponseBody
	public void coutomer_private(@RequestParam Map params, HttpSession session) {
		User user = new User();
		user.setUserid("2");
		session.setAttribute(Context.LOGIN_USER, user);
		cous.coutomer_private(params, session);

	}
//查询跟单客户信息
	@RequestMapping("/privatetable")
	@ResponseBody
	public Layjson privatetable(@RequestParam Map params,HttpSession session) {
		User user = new User();
		user.setUserid("2");
		session.setAttribute(Context.LOGIN_USER, user);
		int count = cous.getCountprivate(params,session);

		List listuser = cous.getcoustomerprivate(params,session);
		Layjson layjson = new Layjson(listuser);
		layjson.setData(listuser);
		layjson.setCount(count);

		return layjson;

	}
	//执行放弃客户
	@RequestMapping("/delprivate")
	@ResponseBody
	public void delprivate(@RequestParam Map params, HttpSession session) {
		User user = new User();
		user.setUserid("2");
		session.setAttribute(Context.LOGIN_USER, user);
		cous.delprivate(params, session);

	}
	
	//我的客户
	@RequestMapping("/mytable")
	@ResponseBody
	public Layjson mytable(@RequestParam Map params,HttpSession session) {
		User user = new User();
		user.setUserid("2");
		session.setAttribute(Context.LOGIN_USER, user);
		int count = cous.getmyCount(params,session);

		List listuser = cous.getmycoustomer(params,session);
		Layjson layjson = new Layjson(listuser);
		layjson.setData(listuser);
		layjson.setCount(count);

		return layjson;

	}
	

}
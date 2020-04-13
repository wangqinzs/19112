package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.bean.User;
import com.st.dao.CoustomerDao;
import com.st.util.Context;
import com.st.util.Page;
import com.st.util.UUidutil;
@Service
public class CoustomerService {
	@Autowired
	CoustomerDao coud;
	public void Jiefeng(Map params) {
		// TODO Auto-generated method stub
		coud.Jiefeng(params);
	}

	public void Fenghao(Map params) {
		// TODO Auto-generated method stub
		coud.Fenghao(params);
	}

	public void updatecoustomer(Map params) {
		// TODO Auto-generated method stub
		coud.updatecoustomer(params);
	}

	

	public void deletecoustomer(Map params) {
		// TODO Auto-generated method stub
		coud.deletecoustomer(params);
	}

	public void addcoustomer(Map params) {
		// TODO Auto-generated method stub
		UUidutil.putuuid(params);
		coud.addcoustomer(params);
	}

	public List getcoustomer(Map params) {
		// TODO Auto-generated method stub
Page.pageParams(params);
		
		List list=coud.getcoustomer(params);
		return list;
	}

	public int getCount(Map params) {
		int count=coud.getCount(params);
		return count;
	}

	public int getCountpublic(Map params) {
		// TODO Auto-generated method stub
		Context.PUBLIC_YES(params);
		Context.STATE_DEL_NO(params);
		int count=coud.getCountpublic(params);
		return count;
	}

	public List getcoustomerpublic(Map params) {
		// TODO Auto-generated method stub
Page.pageParams(params);
Context.STATE_DEL_NO(params);
		Context.PUBLIC_YES(params);
		List list=coud.getcoustomerpublic(params);
		return list;
	}

	public void coutomer_private(Map params, HttpSession session) {
		// TODO Auto-generated method stub
		Context.PUBLIC_NO(params);
		Context.STATE_DEL_NO(params);
		params.put("userid", ((User)session.getAttribute(Context.LOGIN_USER)).getUserid());
		coud.coutomer_private(params);
	}

	public int getCountprivate(Map params, HttpSession session) {
		// TODO Auto-generated method stub
		params.put("userid", ((User)session.getAttribute(Context.LOGIN_USER)).getUserid());
		Context.PUBLIC_NO(params);
		Context.STATE_DEL_NO(params);
		int count=coud.getCountprivate(params);
		return count;
	}

	public List getcoustomerprivate(Map params, HttpSession session) {
		// TODO Auto-generated method stub
		Page.pageParams(params);
		Context.PUBLIC_NO(params);
		Context.STATE_DEL_NO(params);
		params.put("userid", ((User)session.getAttribute(Context.LOGIN_USER)).getUserid());

		List list=coud.getcoustomerprivate(params);
		return list;
	}

	public void delprivate(Map params, HttpSession session) {
		// TODO Auto-generated method stub
		Context.PUBLIC_YES(params);
		Context.STATE_DEL_YES(params);
		params.put("userid", ((User)session.getAttribute(Context.LOGIN_USER)).getUserid());
		coud.delprivate(params);
	}

	public int getmyCount(Map params, HttpSession session) {
		// TODO Auto-generated method stub
		params.put("userid", ((User)session.getAttribute(Context.LOGIN_USER)).getUserid());
		Context.PUBLIC_NO(params);
		Context.STATE_DEL_NO(params);
		int count=coud.getmyCount(params);
		return count;
	}

	public List getmycoustomer(Map params, HttpSession session) {
		// TODO Auto-generated method stub
		Page.pageParams(params);
		Context.PUBLIC_NO(params);
		Context.STATE_DEL_NO(params);
		params.put("userid", ((User)session.getAttribute(Context.LOGIN_USER)).getUserid());

		List list=coud.getmycoustomer(params);
		return list;
	}

	

}

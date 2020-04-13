package com.st.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.st.bean.Role_Bean;
import com.st.dao.Role_Dao;
import com.st.util.Page;
import com.st.util.UUidutil;
@Service
public class Role_Service {
@Autowired
Role_Dao roled;
	
	public void role_perm(String role_id, String perms) {
		List list=toList(role_id,perms);
		Map map=new HashMap();
		map.put("perms", list);
		map.put("role_id", list);
		roled.role_perm(map);
		
	}
	private List toList(String  role_id,String  perms) {
		List list=new ArrayList();
	String [] perm_arr=	perms.split(",");
	
		for(String str:perm_arr) {
			Map map=new HashMap();
			if(!str.trim().equals("")) {
			map.put("perm",str);
			map.put("role_id",role_id);
			list.add(map);
			}
		}
		return list;
	}
	public void updateeole(Map params) {
		// TODO Auto-generated method stub
		roled.updaterole(params);
	}
	public void deleterole(Map params) {
		// TODO Auto-generated method stub
		roled.deleterole(params);
	}
	
	
	public int getCount(Map params) {
		// TODO Auto-generated method stub
		int count=roled.getCount(params);
		return count;
	}
	public List getRole(Map params) {
		// TODO Auto-generated method stub
	Page.pageParams(params);
		
		List list=roled.getRole(params);
		return list;
	}

	
	public void addrole(Map params) {
		// TODO Auto-generated method stub
		UUidutil.putuuid(params);
		roled.addrole(params);
		
		
	}
	public List role_list(Map params) {
		// TODO Auto-generated method stub
		return roled.role_list(params);
	}
	public List getrole(String checktext) {
		// TODO Auto-generated method stub
		return null;
	}
	public void Fenghao(Map params) {
		// TODO Auto-generated method stub
		roled.Fenghao(params);
	}
	public void Jiefeng(Map params) {
		// TODO Auto-generated method stub
		roled.Jiefeng(params);
	}
	public List treejson() {
		// TODO Auto-generated method stub
		return roled.treejson();
	}

	

}

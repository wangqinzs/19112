package com.st.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.Bumendao;
import com.st.util.Page;
import com.st.util.UUidutil;
@Service
public class BUmenService {
	@Autowired
	Bumendao bumend;
	public int getCount(Map params) {
		// TODO Auto-generated method stub
		int count=bumend.getCount(params);
		return count;
	}

	public List getbumen(Map params) {
		// TODO Auto-generated method stub
Page.pageParams(params);
		
		List list=bumend.getbumen(params);
		return list;
	}

	public void addbumen(Map params) {
		UUidutil.putuuid(params);
		bumend.addbumen(params);
		
	}

	public void deletebumen(Map params) {
		// TODO Auto-generated method stub
		bumend.deletebumen(params);
	}

	public void updatebumen(Map params) {
		// TODO Auto-generated method stub
		bumend.updatebumen(params);
	}

	public void Fenghao(Map params) {
		// TODO Auto-generated method stub
		bumend.Fenghao(params);
	}

	public void Jiefeng(Map params) {
		// TODO Auto-generated method stub
		bumend.Jiefeng(params);
	}

	

}

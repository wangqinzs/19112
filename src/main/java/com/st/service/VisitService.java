package com.st.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.VisitDao;
import com.st.util.Page;
import com.st.util.UUidutil;
@Service
public class VisitService {
@Autowired
VisitDao visitd;
	public void updatevisit(Map params) {
		// TODO Auto-generated method stub
		visitd.updatevisit(params);
	}

	public void deletevisit(Map params) {
		// TODO Auto-generated method stub
		visitd.deletevisit(params);
	}

	public void addvisit(Map params) {
		// TODO Auto-generated method stub
		UUidutil.putuuid(params);
		visitd.addvisit(params);
	}

	public List getvisit(Map params) {
		// TODO Auto-generated method stub
Page.pageParams(params);
		
		List list=visitd.getvisit(params);
		return list;
	}

	public int getCount(Map params) {
		int count=visitd.getCount(params);
		return count;
	}

}

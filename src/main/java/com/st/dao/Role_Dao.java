package com.st.dao;

import java.util.List;
import java.util.Map;

import com.st.bean.Role_Bean;
import com.st.bean.User;

public interface Role_Dao {


	List role_list(Map params);

	void role_perm(Map map);
	int getCount(Map params);

	void addrole(Map params);

	List getRole(Map params);

	void deleterole(Map params);

	void updaterole(Map params);

	void Fenghao(Map params);

	void Jiefeng(Map params);

	List treejson();

}

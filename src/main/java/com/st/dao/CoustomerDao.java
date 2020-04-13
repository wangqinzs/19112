package com.st.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface CoustomerDao {

	void Jiefeng(Map params);

	void Fenghao(Map params);

	void updatecoustomer(Map params);

	void deletecoustomer(Map params);

	void addcoustomer(Map params);

	List getcoustomer(Map params);

	int getCount(Map params);

	int getCountpublic(Map params);

	List getcoustomerpublic(Map params);

	void coutomer_private(Map params);

	int getCountprivate(Map params);

	List getcoustomerprivate(Map params);

	void delprivate(Map params);

	int getmyCount(Map params);

	List getmycoustomer(Map params);

}

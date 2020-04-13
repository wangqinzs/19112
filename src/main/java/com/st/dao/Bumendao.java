package com.st.dao;

import java.util.List;
import java.util.Map;

public interface Bumendao {

	void updatebumen(Map params);

	void Jiefeng(Map params);

	void Fenghao(Map params);

	void deletebumen(Map params);

	void addbumen(Map params);

	List getbumen(Map params);

	int getCount(Map params);

}

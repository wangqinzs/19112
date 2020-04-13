package com.st.dao;

import java.util.List;
import java.util.Map;

public interface VisitDao {

	int getCount(Map params);

	List getvisit(Map params);

	void addvisit(Map params);

	void deletevisit(Map params);

	void updatevisit(Map params);

}

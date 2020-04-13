package com.st.util;

import java.util.Map;

public class Context {
public static final int STATE_DEL_NO=1;
	
	public static final int STATE_DEL_YES=0;
	public static final int PUBLIC_NO=1;
	
	public static final int PUBLIC_YES=0;
	public static final String LOGIN_USER="login_user";
	public  static void PUBLIC_NO(Map map) {
		map.put("public", PUBLIC_NO);
	}
	public  static void PUBLIC_YES(Map map) {
		map.put("public", PUBLIC_YES);
	}
	public  static void STATE_DEL_YES(Map map) {
		map.put("state", STATE_DEL_YES);
	}
	public  static void STATE_DEL_NO(Map map) {
		map.put("state", STATE_DEL_NO);
	}
}

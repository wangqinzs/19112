package com.st.util;

import java.util.Map;
import java.util.UUID;

public class UUidutil {
public static void putuuid(Map params) {
	UUID uuid=UUID.randomUUID();
	params.put("uuid", uuid.toString());
	
}
}

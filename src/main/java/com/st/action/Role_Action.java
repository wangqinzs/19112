package com.st.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.Layjson;
import com.st.bean.Role_Bean;
import com.st.bean.User;
import com.st.service.Role_Service;
@Controller
@RequestMapping("/sys")
public class Role_Action {
	@Autowired
	Role_Service roles;
	

@RequestMapping("/role")
	
	public String role() {
		return "sys/role";
	}
@RequestMapping("/index")

public String index() {
	return "sys/index";
}
@RequestMapping("/fenpei")

public String fenpei() {
	return "sys/fenpei";
}


	//跳轉到分配權限頁面
	@RequestMapping("/role_perm_page/{role_id}")
	public String role_perm_page(@PathVariable String role_id,HttpServletRequest request) {
	request.setAttribute("role_id",role_id);
		return "sys/index";
	}
	/**
	 * 保存分配的权限
	 */
	@RequestMapping("/role_perm/{role_id}/{perms}")
	public void role_perm(@PathVariable String role_id,@PathVariable String perms) {
		System.out.println(role_id);
		System.out.println(perms);
		roles.role_perm( role_id, perms);
	}
	/**
	 * 查询权权限线数据
	 * @return
	 */
	@RequestMapping("/treejson")
	@ResponseBody
	public List treejson() {
List list=	roles.treejson();
	System.out.println("Role_Action.treejson()"+list);
		return list;
	}
	

@RequestMapping("/rolelist")
@ResponseBody
public Layjson allrole(@RequestParam Map params) {

int count=roles.getCount(params);
System.out.println("count"+count);
	List listuser = roles.getRole(params);
	System.out.println("listuser"+listuser);

	// 通过request向前台传值--作用域对象可以通过方法参数注入
	Layjson layjson = new Layjson(listuser);
	layjson.setData(listuser);
	layjson.setCount(count);
	

    
	return layjson;

}



@RequestMapping("/addrole")
@ResponseBody
public void addrole(@RequestParam Map params) {
	roles.addrole(params);

}

@RequestMapping("/deleterole")
@ResponseBody
public void deleterole(@RequestParam Map params) {
	roles.deleterole(params);

}

@RequestMapping("/updaterole")
@ResponseBody
public void updateUser(@RequestParam Map params) {
	System.out.println("4");
	roles.updateeole(params);
	

}
@RequestMapping("/fenghaor")
@ResponseBody
public void Fenghaor(Map params) {

	roles.Fenghao(params);

	
}
@RequestMapping("/jiefengr")
@ResponseBody
public void Jiefengr(Map params) {

	roles.Jiefeng(params);

	
}


}

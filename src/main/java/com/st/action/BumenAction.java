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
import com.st.service.BUmenService;
import com.st.service.Role_Service;
@Controller
@RequestMapping("/sys")
public class BumenAction {
	@Autowired
	BUmenService bumens;
	

@RequestMapping("/bumen")
	
	public String bumen() {
		return "sys/bumen";
	}

	
	
	

@RequestMapping("/bumenlist")
@ResponseBody
public Layjson bumenlist(@RequestParam Map params) {

int count=bumens.getCount(params);
System.out.println("count"+count);
	List listuser = bumens.getbumen(params);
	

	// 通过request向前台传值--作用域对象可以通过方法参数注入
	Layjson layjson = new Layjson(listuser);
	layjson.setData(listuser);
	layjson.setCount(count);
	

    
	return layjson;

}



@RequestMapping("/addbumen")
@ResponseBody
public void addbumen(@RequestParam Map params) {
	bumens.addbumen(params);

}

@RequestMapping("/deletebumen")
@ResponseBody
public void deletebumen(@RequestParam Map params) {
	bumens.deletebumen(params);

}

@RequestMapping("/updatebumen")
@ResponseBody
public void updatebumen(@RequestParam Map params) {
	System.out.println("4");
	bumens.updatebumen(params);
	

}
@RequestMapping("/fenghaob")
@ResponseBody
public void Fenghaob(Map params) {

	bumens.Fenghao(params);

	
}
@RequestMapping("/jiefengb")
@ResponseBody
public void Jiefengb(Map params) {

	bumens.Jiefeng(params);

	
}


}

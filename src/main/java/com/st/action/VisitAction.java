package com.st.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.bean.Layjson;
import com.st.service.VisitService;

@Controller
@RequestMapping("/sys")
public class VisitAction {
	@Autowired
	VisitService visits;
@RequestMapping("/visit")
	
	public String visit() {
		return "sys/visit";
	}
	@RequestMapping("/visitlist")
	@ResponseBody
	public Layjson visitlist(@RequestParam Map params) {

	int count=visits.getCount(params);
	System.out.println("count"+count);
		List listuser = visits.getvisit(params);
		System.out.println("listuser"+listuser);

		// 通过request向前台传值--作用域对象可以通过方法参数注入
		Layjson layjson = new Layjson(listuser);
		layjson.setData(listuser);
		layjson.setCount(count);
		

	    
		return layjson;

	}



	@RequestMapping("/addvisit")
	@ResponseBody
	public void addvisit(@RequestParam Map params) {
		visits.addvisit(params);

	}

	@RequestMapping("/deletevisit")
	@ResponseBody
	public void deletevisit(@RequestParam Map params) {
		visits.deletevisit(params);

	}

	@RequestMapping("/updatevisit")
	@ResponseBody
	public void updatevisit(@RequestParam Map params) {
		
		visits.updatevisit(params);
		

	}

		
	
}

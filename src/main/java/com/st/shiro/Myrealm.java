package com.st.shiro;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;

import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.st.bean.Permission;
import com.st.bean.User;
import com.st.service.User_Service;
import com.st.util.Context;



@Component

public class Myrealm extends AuthorizingRealm {
	@Autowired
User_Service rs;

	
	/*
	 * @Autowired HttpSession session;
	 */
	 /**
	  * 需要权限时shiro会自动调用该方法
	  */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("-------获取权限");
		Subject sub=SecurityUtils.getSubject();
		User user=(User)sub.getSession().getAttribute(Context.LOGIN_USER);
		System.out.println("Myrealm.doGetAuthorizationInfo()"+user.getRoles()+"---------"+user.getRoles().size());
		// 需要一个字符串集合
		List<String> list =user.permissionCodes();
		 SimpleAuthorizationInfo sai = new SimpleAuthorizationInfo();
		 sai.addStringPermissions(list);
			return sai;
	}
		/*
		 * String username=(String)SecurityUtils.getSubject().getPrincipal(); List
		 * list=rs.getPermByUsername(username);//permbean对象的一个集合
		  SimpleAuthorizationInfo sai = new SimpleAuthorizationInfo();
		// 需要一个字符串集合
		/*
		 * List<String> str_permlist=getpermlist(list);
		 * sai.addStringPermissions(str_permlist);
		 */
		
	
	
	/*
	 * private List<String> getpermlist(List list){ List<Permission>
	 * pblist=(List<Permission>)list; List<String> str_permlist=new
	 * ArrayList<String>(); for(Permission pb: pblist) {
	 * str_permlist.add(pb.getPerm_code()); } return str_permlist; }
	 */
	@Override
	//登录认证,登录成功返回对象，登陆失败抛出异常。
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 获得用户名密码
		
		  String username=token.getPrincipal().toString();
		  String userpass =new String((char[])token.getCredentials());
		 
		/*
		 * SimpleHash sh=new SimpleHash("d5",userpass); sh=new SimpleHash("md5",
		 * userpass, username); sh=new SimpleHash("md5", userpass, username,12);
		 * System.out.println("Myrealm.doGetAuthenticationInfo()"+sh);
		 */
		 
		  //通过用户名查询用户的相关信息数据验证是否正确 
		   User user=rs.getuser(username) ;
		   System.out.println(user.allPermissions().size());
		  
		   //用户输入的是123456，休要将用户输入的密码加密成md5字符串和数据库中的数据进行校验，如果登陆成功
		   SimpleHash sh=new SimpleHash("md5", userpass, user.getUserid());
		   if( sh.toString() . equals(user.getUserpass())) { 
			   Subject sub=SecurityUtils.getSubject();
				 sub.getSession().setAttribute(Context.LOGIN_USER, user);
		return new SimpleAuthenticationInfo(username, userpass, getName());
	}else {
		throw new AuthenticationException( "登陆失败");
	}

}}

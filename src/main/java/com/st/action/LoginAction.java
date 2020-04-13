package com.st.action;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.service.User_Service;

@Controller
//@RequestMapping("/sys")
public class LoginAction {
	

	@RequestMapping("/loginpage")
	public String tologin() {
		return "loginpage";
	}
	@RequestMapping("/zhuce1")
	public String zhuce11() {
		return "zhuce";
	}
	/*
	 * @RequestMapping("/zhuce")
	 * 
	 * @ResponseBody public void zhuce(@RequestParam Map map, HttpServletResponse
	 * response) throws IOException {
	 * 
	 * // System. out . printIn("随机生成的密码为: "+getStringRandom(6)); // System. out .
	 * print1n("获得的邮箱”+ map。get("email")); UUID uuid = UUID. randomUUID(); map.
	 * put("userid", uuid. toString()); String mm = getStringRandom(6); try {
	 * testemail((String)map.get("email"), mm); //密码加密 SimpleHash sh = new
	 * SimpleHash("md5", mm, "hua", 7); map. put("userpass",sh. toString()); System.
	 * out.println("注册加密后的map:" + map); User_Service.addUser (map); response.
	 * getWriter() . write("注册成功,请在录邮箱完成最后一步认证" ); } catch (Exception e) { e.
	 * printStackTrace(); response . getWriter() . write("注册失败,请稍后再试"); }
	 * 
	 */
	// 生成任意位数的随机数字和字母的字符串,区分大小写
		// length为指定位数
	/*
	 * private String getStringRandom(int length) { String val = ""; Random random =
	 * new Random(); for (int i = 0; i < length; i++) { String charOrNum =
	 * random.nextInt(2) % 2 == 0 ? "char" : "num"; // 输出字母还是数字 if
	 * ("char".equalsIgnoreCase(charOrNum)) { // 输出是大写字母还是小写字母 int temp =
	 * random.nextInt(2) % 2 == 0 ? 65 : 97; val += (char) (random.nextInt(26) +
	 * temp); } else if ("num".equalsIgnoreCase(charOrNum)) { val +=
	 * String.valueOf(random.nextInt(10)); } } return val; }
	 * 
	 * private void testemail(String email, String userpass) throws
	 * MessagingException, IOException { System. out . println("email的" + email);
	 * Properties props = new Properties( ); //设置服务器的服务 props.setProperty(
	 * "mail.host", " smtp.163. com"); props.
	 * setProperty("mail Itransport. protocol", "smtp"); props .
	 * setProperty("mail. smtp. auth", "true"); Session session = Session.
	 * getInstance(props, new Authenticator() {
	 * 
	 * @Override protected PasswordAuthentication getPasswordAuthentication() {
	 * return new PasswordAuthentication("wangqiwukepidi@163. com",
	 * "VNUQCKRILLVKFDA" ); } });
	 */


	@RequestMapping("/login")
	public String login(@RequestParam Map params) {
		//生成令牌
		UsernamePasswordToken token=new UsernamePasswordToken(params.get("username").toString(),params.get("userpass").toString());//使用用户名密码生成令牌
		//当前用户拿着令牌去认证登录
		Subject sub=SecurityUtils.getSubject();//获取当前访问用户的对象
		try {
		sub.login(token);//开始登录执行登录方法realm
		return "sys/houtai";
		
		}catch (AuthenticationException e) {
			//捕捉到异常，登陆失败
			return "tologin";
		}
		
		}
		
	
}

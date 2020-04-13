<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/zhuce.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
</head>
<body>
	
	
	<div class="quanbu" style="height: 750px">
		<div class="zhuce_1">
			<div align="center" >
				<img src="img/lougou.jpg" style="width:80px; height:80px;">
			</div>
			<div class="top">
				<h5 class="zi">注册雅轩账号</h5>
			</div>


			<form class="layui-form" action="addzhuce" id="test" method="post">
				<input type="hidden" name="param" value="zhuanfa" />
				<div class="layui-form-item">
					<label class="layui-form-label">手机号</label>
					<div class="layui-input-block">
						<input type="text" name="tel" id="tel" required
							lay-verify="required|phone" placeholder="请输入手机号当作登录账户"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
						<input type="text" name="username" id="username" required
							lay-verify="required/norepeat" placeholder="请输入账户"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-inline">
						<input type="password" name="userpass" id="userpass" required
							lay-verify="required" placeholder="请输入密码" autocomplete="off"
							class="layui-input">

					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-inline">
						<input type="password" name="userpass1" id="userpass1" required
							lay-verify="required" placeholder="请再次输入密码" autocomplete="off"
							class="layui-input">

					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn layui-btn-warm" lay-submit
							lay-filter="btn_tijiao" style="width: 200px">立即提交</button>

					</div>
				</div>

			</form>


		</div>
	</div>
	</div>
	</div>
	</div>


	<script type="text/javascript" src="static/layui/layui.all.js"></script>
	<script type="text/javascript">
/* 	var form=layui.form;
	//自定义
	form.varify({
		norepeat:function(value,item){
			var msg="";
			$.ajax({
				url:"User",
			data:{"param=norepeat&username"+value}
			async:false,
			success:function(d){
				//0-数据库中没有重复信息
				
				//1-代表数据库中已经有此信息
				if(d==0){
					msg:"用户名被占用";
					return msg;
				}
				
				
			}
				
			});
			
		}
		
		
	});
	
	 */
	
	
		 var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var $ = layui.jquery;
		form.on('submit(btn_tijiao)', function(data) {
			var df = data.field;
			var tel = df.tel;
			var username = df.username;
			var userpass = df.userpass;
			var userpass1 = df.userpass1;
			var result;
			if (userpass == userpass1) {
				$.ajaxSettings.async = false;
				$.post("addzhuce", {
					"param" : "zhuceuser",
					"username" : username,
					"tel" : tel,
					"userpass" : userpass,
				}, function(d) {
						result =d;
				}) ;
			} else if (userpass != userpass1) {
				layer.msg("你输入的密码不一致")
				return false;
			}
			if(result=="success"){
				return true;
			}else if(result=="fail"){
				layer,msg("你的账号已经存在，请换一个账号注册");
				return false;
			}
		}); 
	</script>
</body>
</html>
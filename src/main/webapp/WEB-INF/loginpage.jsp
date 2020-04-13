<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/denglu.css" />
<link rel="stylesheet" href="layui/css/layui.css">

</head>
<body>
	
	<div class="div_zhong" style=height:100%>
		<img src="img/app.jpg" style=height:100%>
		</div>
		<div class="div_denglu"style="background-color:#489AD3;opacity:0.8;filter:alpha(opacity=80);">
		 <div class="divzi">
	<h1 style="color: #022A51">后台管理员登录</h1>
	</div>
			<form action="login" method="post" class="layui-form">

				<input type="hidden" name="param" value="denglu" class="layui-input" />

				<div class="layui-form-item">
					<label class="layui-form-label">账号</label>
					<div class="layui-input-block">
						<input type="text" name="username" placeholder="请输入账号"
							autocomplete="off" class="layui-input"
							>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">
						<input type="password" name="userpass" placeholder="请输入密码"
							autocomplete="off" class="layui-input" lay-verify="required">
					</div>
				</div>
				
				<div class="submitDiv">
					<div class="layui-input-block">
						<button class="layui-btn layui-btn-radius" lay-submit lay-filter="form_btn" style="width:285px;display:block;margin:0 auto">立即提交</button>
					</div>
				</div>
				
			</form>
			
		</div>
	

	<script type="text/javascript" src="js/jquery-3.4.1.min .js"></script>
	<script src="layui/layui.all.js"></script>
	<script type="text/javascript">
		var form = layui.form;
		form.on('submit(form_btn)', function(data) {

		});
	<%if ("fail".equals(request.getAttribute("fail"))) {%>
		alert("登录失败");
	<%}%>
		${'button'}.click(function(){
var data=form.val("loginform");

			})
	</script>


</body>
</html>

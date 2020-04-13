<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>后台</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css">

</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">layui 后台布局</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="sys/index">控制台</a></li>
				<li class="layui-nav-item"><a href="javascript:;" page="sys/index">权限管理</a></li>
				<li class="layui-nav-item"><a href="">用户</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> 贤心
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;" page="sys/cou">客户管理</a>
						<dl class="layui-nav-child">


							<dd>
								<a href="javascript:;" page='sys/coupublic'>公海客户</a>
							</dd>
							<dd>
								<a href="javascript:;" page='sys/privatelist'>跟单客户</a>
							</dd>
							<dd>
								<a href="javascript:;" page='sys/mycou'>我的客户</a>
							</dd>

						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"
						page="sys/bumen">部门管理</a>
						<dl class="layui-nav-child">

						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"
						page="sys/visit">回访记录管理</a>
						<dl class="layui-nav-child">

						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;"
						page="sys/role">角色管理</a></li>
					<li class="layui-nav-item"><a href="javascript:;"
						page="sys/user_page">用户管理</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<iframe style="width: 98%; height: 98%;" src=""></iframe>
		</div>


	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min .js"></script>
	<script src="layui/layui.all.js"></script>
	<script>
		//点击一个含有page属性的标签让ifr ame标签的显示的页面发生变化变成当前被点击的标签的page属性|

		var $ = layui.jquery;
		$("[page]").click(function() {
			$("iframe").attr("src", $(this).attr("page"));
		});
		//JavaScript代码区域
		var layer = layui.layer;
		layui.use('element', function() {
			var element = layui.element;

		});
		$("#clbtn").click(function() {
			$.post("User", {
				"param" : "login",

			}, function(d) {
				layer.msg(d);
			})
		})
	</script>
</body>
</html>
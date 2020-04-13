<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>

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
<title>部门表</title>
<link rel="stylesheet" href="layui/css/layui.css">


</head>
<body>

	<div id="test3" class="demo-transfer"></div>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 30px;">
		<legend>角色分配</legend>
	</fieldset>

	<button class="layui-btn layui-btn-sm" id="save">保存</button>

	<script type="text/javascript" src="js/jquery-3.4.1.min .js"></script>
	<script src="layui/layui.all.js"></script>
	<script>
		layui
				.use(
						[ 'transfer', 'layer', 'util' ],
						function() {
							var $ = layui.$, transfer = layui.transfer, layer = layui.layer, util = layui.util;

							//模拟数据
							var data1 = [ {
								"value" : "1",
								"title" : "李白"
							}, {
								"value" : "2",
								"title" : "杜甫"
							}, {
								"value" : "3",
								"title" : "苏轼"
							}, {
								"value" : "4",
								"title" : "李清照"
							}, {
								"value" : "5",
								"title" : "鲁迅",
								"disabled" : true
							}, {
								"value" : "6",
								"title" : "巴金"
							}, {
								"value" : "7",
								"title" : "冰心"
							}, {
								"value" : "8",
								"title" : "矛盾"
							}, {
								"value" : "9",
								"title" : "贤心"
							} ]

							//显示搜索框
							transfer.render({
								elem : '#test3',
								data : data1,
								title : [ '角色', '分配' ],
								showSearch : true

							})

						});

		$("#save").click(function() {
			var role_id = $("[name='userid']").val();
			var checkData = tree.getChecked('perm_tree');
			var perms = "";
			console.log(role_id);
			for (var i = 0; i < checkData.length; i++) {
				perms += checkData[i].id + ',';
				var children = checkData[i].children;
				for (var j = 0; j < children.length; j++) {
					perms += children[j].id + ',';
				}
			}
			location.href = "sys/role_perm/" + role_id + "/" + perms;

			console.log(perms);
		});
	</script>




</body>
</html>
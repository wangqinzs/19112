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
<title>Insert title here</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>

	<input type="hidden" name="role_id" value="${role_id}" />
	<div id="test1" class="demo-tree demo-tree-box"></div>
	
	<button class="layui-btn layui-btn-sm" id="save">保存</button>
	<script src="layui/layui.all.js"></script>
	<script>
		var $ = layui.jquery;
		var table = layui.table;
		var upload = layui.upload;
		var tree = layui.tree;
		var testTree;
		$.ajaxSettings.async = false;
		$.post("sys/treejson", function(d) {
			testTree = d;
			console.log(d);
		});
		//常规用法
		tree.render({
			id : "perm_tree",
			elem : '#test1' //默认是点击节点可进行收缩
			,
			data : testTree,
			showCheckbox : true

		});
		//给保存按钮生成事件

		$("#save").click(function() {
			var role_id = $("[name='role_id']").val();
		//点击保存按钮获取已经选中的数据
			var checkData = tree.getChecked('perm_tree');
			//将数据发送到后台
			var perms = "";
			console.log(role_id);
			for (var i = 0; i < checkData.length; i++) {
				perms += checkData[i].id + ',';
				var children = checkData[i].children;
				for (var j = 0; j < children.length; j++) {
					perms += children[j].id + ',';
				}
			}
			location.href = "sys/role_perm/" + role_id +"/"+perms;
			
console.log(perms);
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>

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
<title>角色表</title>
<link rel="stylesheet" href="layui/css/layui.css">


</head>
<body>

	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">

    <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon"> 增加</i></button>
 
<button class="layui-btn layui-btn-sm" lay-event="del"><i class="layui-icon">删除</i></button>
 

<button class="layui-btn layui-btn-sm" lay-event="select"><i class="layui-icon ">查询&#xe615;</i></button>
<button class="layui-btn layui-btn-sm" lay-event="perm">分配权限</button>

	
  </div>
<input type="text" name="checktext" id="checktext" required
					lay-verify="required" placeholder="请输入" autocomplete="off"
					class="layui-input">
</script>


		<div id="editdiv" hidden="">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline">
						<input  name="erole_name" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">编号</label>
					<div class="layui-input-inline">
						<input  name="erole_code" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				
</div>

			</div>
		</form>
	</div>
	
	
<script type="textml" id="adddiv">
		<div>
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">角色</label>
					<div class="layui-input-inline">
						<input  name="role_name" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">编号</label>
					<div class="layui-input-inline">
						<input  name="role_code" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>

			</div>
		</form>
	</div>
		</script>
	
<script type="text/htmL" id="rowbar">

<a class="layui-btn layui-btn-xs"lay-event="edit">编辑</a>
 <a class="layui-btn layui-btn-xs" lay-event="fenghao">封号</a>
</script>

	<script type="text/html" id="rowbar2">

<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
 <a class="layui-btn layui-btn-xs" lay-event="jiefeng">解封</a>
</script>


	<table class="layui-table" lay-filter="test"
		lay-data="{url:'sys/rolelist',method:'post',id:'rolelist',toolbar:'#toolbarDemo',page:true,}">
		<thead>
			<tr>

				<th lay-data="{checkbox:true}"></th>
				<th lay-data="{field:'role_id'}">ID</th>
				<th lay-data="{field:'role_code'}">编号</th>
				<th lay-data="{field:'role_name'}">用户名</th>
<th
					lay-data="{field:'state',templet:function(d){
				if(d.state==0){
				return '正常';
				}else{
				return '封号';
				}
				}}">状态</th>
		
			
				<th
					lay-data="{templet:function(d){
				if(d.state==0){
				return $('#rowbar').html();
				}else{
				return $('#rowbar2').html();
				}
				}}">操作</th>


			</tr>
		</thead>
	</table>

	<!--弹出层  -->



	<script type="text/javascript" src="js/jquery-3.4.1.min .js"></script>
	<script src="layui/layui.all.js"></script>
	<script>

	var table=layui.table;
		table.on('toolbar(test)', function(obj) {
		
					
			
			switch (obj.event) {
			case 'perm':
				
				if (checkStatus.data.length==1) {
					
					console.log("1");
					//獲取參數
					location.href = "sys/role_perm_page/"
							+ checkStatus.data[0].role_id;
				}
						
				break;
			}
		});
		

		table.on('tool(test)', function(obj) {
			var data = obj.data;
			//console . log(obj)
			if (obj.event ==='jiefeng') {
			$. post("jeifengr" ,{id:data.role_id} , function(d){
			table.reload("rolelist");
			})
			}else if (obj.event === 'fenghao') {
			$. post("fenghaor" , {id:data.role_id},function(d){
			table.reload("rolelist");
			})
			}else if(obj.event ==='edit'){
				 $('[name="erole_name"]').val(data.role_name);
				 $('[name="erole_code"]').val(data.role_code);
				  
				layer.open({
					type : 1,
					offset : 'auto',
					id : 'edit_win',//防止重复弹出
					content : $('#editdiv'),
					btn : [ '保存', '关闭' ],
					btnAlign : 'c', //按钮居中
					title : '编辑用户信息',
					shade : [ 0.8, '#393D49' ],
					btn1 : function() {
						//保存信息的方法
						//发送参数
						$.post("sys/updaterole", {"role_id":data.role_id,
							"role_name" : $('[name="erole_name"]').val(),
							"role_code" : $('[name="erole_code"]').val()
							

						}, function(d) {
							//提示信息
							layer.msg('编辑成功', {
								time : 2000, //3s后自动关闭
							});
							table.reload('rolelist', {
								where : {

								}
							});
							//表格重新读取
						});
					},
					btn2 : function() {
						layer.closeAll();
					}
				});
				
			}
			});


		
		table.on('toolbar(test)', function(obj) {
			var checkStatus = table.checkStatus(obj.config.id);
			var cs = table.checkStatus("rolelist");
			switch (obj.event) {
			case 'select':
				table.reload("rolelist", {
					where : {
						checktext : $("#checktext").val()
					}
				})
break;
			case 'add':
				//点击新增
				layer.open({
					type : 0,
					offset : 'auto',
					id : 'add_win',//防止重复弹出
					content : $('#adddiv').html(),
					btn : [ '保存', '关闭' ],
					btnAlign : 'c', //按钮居中
					title : '新增用户信息',
					shade : [ 0.8, '#393D49' ],
					btn1 : function() {
						//保存信息的方法
						//发送参数
						$.post("sys/addrole", {
							"role_name" : $('[name="role_name"]').val(),
							"role_code" : $('[name="role_code"]').val(),
							
						}, function(d) {
							//提示信息
							layer.msg('新增成功', {
								time : 3000, //3s后自动关闭
							});
							table.reload('rolelist', {
								where : {

								}
							});
							//表格重新读取
						});
					},
					btn2 : function() {
						layer.closeAll();
					}
				});
				break;
			case 'del':
				if (cs.data.length == 0) {
					layer.msg('请先选中数据', {
						time : 2000, //3s后自动关闭
					});
				} else {
					layer.confirm('只能删除非正常状态的角色，确定要删除吗?', function(index) {
						var idtext="";
						for(var i=0;i<cs.data.length;i++){
						console.log(cs.data[i].id);	
						idtext+="'"+cs.data[i].role_id+"',";
				
							}
						idtext+="''";
						console.log(idtext);	
						$.post("sys/deleterole",
							{ids:idtext}, function(d) {
							layer.msg("你已经成功删除" , {
								
							
								time : 2000, //2s后自动关闭
							});
							table.reload('rolelist', {
								where : {
									'checktext' : $("#checktext").val()
								}
							});
						})
						layer.close(index);
					});
					
				}

				break;

			//自定义头工具栏右侧图标 - 提示
case 'perm':
	if (checkStatus.data.length == 0) {
		layer.msg('请先选中数据', {
			time : 2000, //3s后自动关闭
		});
	}
	else {
					
					//獲取參數
					location.href = "sys/role_perm_page/"
							+ checkStatus.data[0].role_id;
				
	}
				break;
				
			}
			;
		});
		 
	</script>




</body>
</html>
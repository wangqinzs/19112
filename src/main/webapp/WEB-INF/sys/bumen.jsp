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
<title>部门表</title>
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
					<label class="layui-form-label">部门名称</label>
					<div class="layui-input-inline">
						<input  name="ebmname" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">经理</label>
					<div class="layui-input-inline">
						<input  name="emanager" lay-verify="required" autocomplete="off" class="layui-input">
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
					<label class="layui-form-label">部门名称</label>
					<div class="layui-input-inline">
						<input  name="bmname" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">经理</label>
					<div class="layui-input-inline">
						<input  name="manager" lay-verify="required" autocomplete="off" class="layui-input">
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
		lay-data="{url:'sys/bumenlist',method:'post',id:'bumenlist',toolbar:'#toolbarDemo',page:true,}">
		<thead>
			<tr>

				<th lay-data="{checkbox:true}"></th>
				
				<th lay-data="{field:'bmname'}">部门名称</th>
				<th lay-data="{field:'manager'}">经理</th>
				
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
		
					
			var checkStatus = table.checkStatus(obj.config.id);
			switch (obj.event) {
			case 'perm':
				
				if (checkStatus.data.length==1) {
					
					console.log("1");
					//獲取參數
					location.href = "role_perm_page/"
							+ checkStatus.data[0].role_id;
				}
						
				break;
			}
		});
		

		table.on('tool(test)', function(obj) {
			var data = obj.data;
			//console . log(obj)
			if (obj.event ==='jiefeng') {
			$. post("jeifengb" ,{id:data.bmid} , function(d){
			table.reload("bumenlist");
			layer.msg("已解封")
			})
			}else if (obj.event === 'fenghao') {
			$. post("fenghaob" , {id:data.bmid},function(d){
			table.reload("bumenlist");
			layer.msg("已封禁")
			})
			}else if(obj.event ==='edit'){
				 $('[name="ebmname"]').val(data.bmname);
				 $('[name="emanager"]').val(data.manager);
				  
				layer.open({
					type : 0,
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
						$.post("sys/updatebumen", {"bmid":data.bmid,
							"bmname" : $('[name="ebmname"]').val(),
							"manager" : $('[name="emanager"]').val()
							

						}, function(d) {
							//提示信息
							layer.msg('编辑成功', {
								time : 3000, //3s后自动关闭
							});
							table.reload('bumenlist', {
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
			var cs = table.checkStatus("bumenlist");
			switch (obj.event) {
			case 'select':
				table.reload("bumenlist", {
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
						$.post("sys/addbumen", {
							"bmname" : $('[name="bmname"]').val(),
							"manager" : $('[name="manager"]').val(),
							
						}, function(d) {
							//提示信息
							layer.msg('新增成功', {
								time : 3000, //3s后自动关闭
							});
							table.reload('bumenlist', {
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
					layer.confirm('只能删除非正常状态的信息，确定要删除吗?', function(index) {
						var idtext="";
						for(var i=0;i<cs.data.length;i++){
						console.log(cs.data[i].id);	
						idtext+="'"+cs.data[i].bmid+"',";
				
							}
						idtext+="''";
						console.log(idtext);	
						$.post("sys/deletebumen",
							{ids:idtext}, function(d) {
							layer.msg('删除成功', {
								time : 2000, //3s后自动关闭
							});
							table.reload('bumenlist', {
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

			}
			;
		});

		 
	</script>




</body>
</html>
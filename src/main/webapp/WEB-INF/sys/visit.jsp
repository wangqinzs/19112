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
 
 <button class="layui-btn layui-btn-sm" lay-event="edit"><i class="layui-icon"> 修改</i></button>
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
					<label class="layui-form-label">回访时间</label>
					<div class="layui-input-inline">
 <input type="text" class="layui-input" id="test1" name="evisit_time" lay-verify="required" autocomplete="off">

					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">回访内容</label>
					<div class="layui-input-inline">
						<input  name="evisit_info" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">编号</label>
					<div class="layui-input-inline">
						<input  name="evisit_pattem" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">编号</label>
					<div class="layui-input-inline">
						<input  name="evisit_pay" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">回访金额</label>
					<div class="layui-input-inline">
						<input  name="evisit_money" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>

			</div>
		</form>
	</div>
	
	

		<div id="adddiv" hidden="">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">回访时间</label>
					<div class="layui-input-inline">
 <input type="text" class="layui-input" id="test2" name="visit_time" lay-verify="required" autocomplete="off">
						
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">回访内容</label>
					<div class="layui-input-inline">
						<input  name="visit_info" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">编号</label>
					<div class="layui-input-inline">
						<input  name="visit_pattem" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">编号</label>
					<div class="layui-input-inline">
						<input  name="visit_pay" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">回访金额</label>
					<div class="layui-input-inline">
						<input  name="visit_money" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>

			</div>
		</form>
	</div>
	
		
<script type="text/htmL" id="rowbar">

<a class="layui-btn layui-btn-xs"lay-event="edit">编辑</a>
 <a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
</script>

	<script type="text/html" id="rowbar2">

<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
 <a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
</script>


	<table class="layui-table" lay-filter="test"
		lay-data="{url:'sys/visitlist',method:'post',id:'visitlist',toolbar:'#toolbarDemo',page:true,}">
		<thead>
			<tr>

				<th lay-data="{checkbox:true}"></th>
				
				<th lay-data="{field:'visit_time'}">回访时间</th>
				<th lay-data="{field:'visit_info'}">回访内容信息</th>
				<th lay-data="{field:'visit_pattem'}">客户是否回应</th>
				<th lay-data="{field:'visit_pay'}">是否下单</th>
				<th lay-data="{field:'visit_money'}">下单金额</th>

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
	var laydate = layui.laydate;
	var table=layui.table;
		table.on('toolbar(test)', function(obj) {
		
					
			var checkStatus = table.checkStatus(obj.config.id);
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
			table.reload("visitlist");
			})
			}else if(obj.event ==='edit'){
				 $('[name="evisit_time"]').val(data.visit_time);
				 $('[name="evisit_info"]').val(data.visit_info);
				 $('[name="evisit_pattem"]').val(data.visit_pattem);
				 $('[name="evisit_pay"]').val(data.visit_pay);
				 $('[name="evisit_money"]').val(data.visit_money);
				
				  
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
						$.post("sys/updatevisit", {"visit_id":data.visit_id,
							"visit_time" : $('[name="evisit_time"]').val(),
							"visit_info" :  $('[name="evisit_info"]').val(),
							"visit_pattem" : $('[name="evisit_pattem"]').val(),
							"visit_pay" : $('[name="evisit_pay"]').val(),
							"visit_money" :$('[name="evisit_money"]').val()
							

						}, function(d) {
							//提示信息
							layer.msg('编辑成功', {
								time : 2000, //3s后自动关闭
							});
							table.reload('visitlist', {
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
			var cs = table.checkStatus("visitlist");
			switch (obj.event) {
			case 'select':
				table.reload("visitlist", {
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
					content : $('#adddiv'),
					btn : [ '保存', '关闭' ],
					btnAlign : 'c', //按钮居中
					title : '新增用户信息',
					shade : [ 0.8, '#393D49' ],
					btn1 : function() {
						//保存信息的方法
						//发送参数
						$.post("sys/addvisit", {
							"visit_time" : $('[name="visit_time"]').val(),
							"visit_info" :  $('[name="visit_info"]').val(),
							"visit_pattem" : $('[name="visit_pattem"]').val(),
							"visit_pay" : $('[name="visit_pay"]').val(),
							"visit_money" :$('[name="visit_money"]').val()
							
						}, function(d) {
							//提示信息
							layer.msg('新增成功', {
								time : 3000, //3s后自动关闭
							});
							table.reload('visitlist', {
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
					layer.confirm('这些记录非常重要，确定要删除吗?', function(index) {
						var idtext="";
						for(var i=0;i<cs.data.length;i++){
						console.log(cs.data[i].id);	
						idtext+="'"+cs.data[i].visit_id+"',";
				
							}
						idtext+="''";
						console.log(idtext);	
						$.post("sys/deletevisit",
							{ids:idtext}, function(d) {
							layer.msg("你已经成功删除", {
								
							
								time : 2000, //2s后自动关闭
							});
							table.reload('visitlist', {
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
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  
			  //执行一个laydate实例
			  laydate.render({
			    elem: '#test1' //指定元素
			  });
			});
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  
			  //执行一个laydate实例
			  laydate.render({
			    elem: '#test2' //指定元素
			  });
			});
			
	</script>




</body>
</html>
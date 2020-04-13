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
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>用户列表</title>
<link rel="stylesheet" href="layui/css/layui.css">


</head>
<body>

<script type="text/html" id="toolbarDemo">

  <div class="layui-btn-container">
<shiro:hasPermission name="user_add">
    <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon"> 增加</i></button>
</shiro:hasPermission>
<shiro:hasPermission name="user_del">
    <button class="layui-btn layui-btn-sm" lay-event="del"><i class="layui-icon">删除</i></button>
    </shiro:hasPermission>
<shiro:hasPermission name="user_set">
<button class="layui-btn layui-btn-sm" lay-event="edit"><i class="layui-icon"> 修改</i></button>
    </shiro:hasPermission>
<shiro:hasPermission name="user_list">
<button class="layui-btn layui-btn-sm" lay-event="select"><i class="layui-icon ">查询&#xe615;</i></button>
<input type="text" name="checktext" id="checktext" required
					lay-verify="required" placeholder="请输入" autocomplete="off"
					class="layui-input">
</shiro:hasPermission>
<button class="layui-btn layui-btn-sm" lay-event="perm">分配角色</button>
	
  </div>

</script>

	<script type="text/htmL" id="rowbar">
<shiro:hasPermission name="user_set">
<a class="layui-btn layui-btn-xs"lay-event="edit">编辑</a>
 </shiro:hasPermission>
 <a class="layui-btn layui-btn-xs" onclick="fenghao()">封号</a>
</script>

	<script type="text/html" id="rowbar2">
<shiro:hasPermission name="user_set">
<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
 </shiro:hasPermission>
 <a class="layui-btn layui-btn-xs" onclick="jiefeng()">解封</a>
</script>
	<div id="ddd" hidden="">
		<div id="test3" class="demo-transfer"></div>
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 30px;">
			<legend>角色分配</legend>
		</fieldset>
	</div>

	<div id="editdiv" hidden="">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline">
						<input name="eusername" lay-verify="required" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-inline">
						<input name="euserpass" lay-verify="required" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-inline">
						<input name="esex" lay-verify="required" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">电话</label>
					<div class="layui-input-inline">
						<input name="etel" lay-verify="required" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">生日</label>
					<div class="layui-input-inline">
						<input name="ebirthday" lay-verify="required" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">职位</label>
					<div class="layui-input-inline">
						<input name="eposition" lay-verify="required" autocomplete="off"
							class="layui-input">
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
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-inline">
						<input  name="username" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-inline">
						<input  name="userpass" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-inline">
						<input  name="sex" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">电话</label>
					<div class="layui-input-inline">
						<input  name="tel" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">生日</label>
					<div class="layui-input-inline">
						<input  name="birthday" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">职位</label>
					<div class="layui-input-inline">
						<input  name="position" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
		</form>
	</div>
		</script>
		
<div id="test3" class="demo-transfer" hidden=""></div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>角色分配</legend>
</fieldset>
	<table class="layui-table" lay-filter="test"
		lay-data="{url:'sys/userlist',method:'post',id:'userlist',toolbar:'#toolbarDemo',page:true,}">
		<thead>
			<tr>

				<th lay-data="{checkbox:true}"></th>

				<th lay-data="{field:'username'}">用户名</th>
				<th lay-data="{field:'userpass'}">密码</th>
				<th lay-data="{field:'tel'}">手机号</th>
				<th lay-data="{field:'sex'}">性别</th>
				<th lay-data="{field:'birthday'}">出生日期</th>
				<th
					lay-data="{field:'state',templet:function(d){
				if(d.state==0){
				return '正常';
				}else{
				return '封号';
				}
				}}">状态</th>
				<th lay-data="{field:'createtime'}">注册时间</th>
				<th lay-data="{field:'latlogintime'}">最后登录时间</th>
				<th lay-data="{field:'position'}">职位</th>
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






	<script type="text/javascript" src="js/jquery-3.4.1.min .js"></script>
	<script src="layui/layui.all.js"></script>
	<script type="text/javascript">
		var table = layui.table;

		table.on('tool(test)', function(obj) {
			var data = obj.data;
			//console . log(obj)
			if (obj.event ==='jiefeng') {
			$. post("jeifeng" ,{id:data.userid} , function(d){
			table.reload("userlist");
			})
			}else if (obj.event === 'fenghao') {
			$. post("fenghao" , {id:data.userid},function(d){
			table.reload("userlist");
			})
			}else if(obj.event ==='edit'){
				 $('[name="eusername"]').val(data.username);
				 $('[name="euserpass"]').val(data.userpass);
				  $('[name="esex"]').val(data.sex);
				   $('[name="etel"]').val(data.tel);
				    $('[name="ebirthday"]').val(data.birthday);
				    $('[name="eposition"]').val(data.position);
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
						$.post("sys/updateuser", {"userid":data.userid,
							"username" : $('[name="eusername"]').val(),
							"userpass" : $('[name="euserpass"]').val(),
							"sex" : $('[name="esex"]').val(),
							"tel" : $('[name="etel"]').val(),
							"birthday" : $('[name="ebirthday"]').val(),
"position" : $('[name="eposition"]').val()
						}, function(d) {
							//提示信息
							layer.msg('编辑成功', {
								time : 3000, //3s后自动关闭
							});
							table.reload('userlist', {
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
			var cs = table.checkStatus("userlist");
			switch (obj.event) {
			case 'select':
				table.reload("userlist", {
					where : {
						checktext : $("#checktext").val()
					}
				})

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
						$.post("sys/adduser", {
							"username" : $('[name="username"]').val(),
							"userpass" : $('[name="userpass"]').val(),
							"sex" : $('[name="sex"]').val(),
							"tel" : $('[name="tel"]').val(),
							"birthday" : $('[name="birthday"]').val(),
"position" : $('[name="position"]').val()
						}, function(d) {
							//提示信息
							layer.msg('新增成功', {
								time : 3000, //3s后自动关闭
							});
							table.reload('userlist', {
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
					layer.confirm('只能删除非正常状态的账号，确定要删除吗?', function(index) {
						var idtext="";
						for(var i=0;i<cs.data.length;i++){
						console.log(cs.data[i].id);	
						idtext+="'"+cs.data[i].userid+"',";
				
							}
						idtext+="''";
						console.log(idtext);	
						$.post("sys/deleteuser",
							{ids:idtext}, function(d) {
							layer.msg('删除成功', {
								time : 2000, //3s后自动关闭
							});
							table.reload('userlist', {
								where : {
									'checktext' : $("#checktext").val()
								}
							});
						})
						layer.close(index);
					});
					
				}

				break;
			case 'perm':
				if (cs.data.length == 0) {
					layer.msg('请先选中数据', {
						time : 2000, //3s后自动关闭
					});
				}
				else {
								location.href = "sys/fenpei"
										;
							
				}
							break;
							

			//自定义头工具栏右侧图标 - 提示

			}
			;
		});
	</script>




</body>
</html>
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
<title>用户管理系统</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">

    <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon"> 增加</i></button>
 
<button class="layui-btn layui-btn-sm" lay-event="del"><i class="layui-icon">删除</i></button>
 

<button class="layui-btn layui-btn-sm" lay-event="select"><i class="layui-icon ">查询&#xe615;</i></button>
<button class="layui-btn layui-btn-sm" lay-event="perm">分配权限</button>
   <button class="layui-btn layui-btn-sm" lay-event="private"><i class="layui-icon"> 跟单</i></button>
	
  </div>
<input type="text" name="checktext" id="checktext" required
					lay-verify="required" placeholder="请输入" autocomplete="off"
					class="layui-input">
</script>


	<div id="editdiv" hidden="">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">客户姓名</label>
					<div class="layui-input-inline">
						<input name="ecoustomer_name" lay-verify="required"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">联系人</label>
					<div class="layui-input-inline">
						<input name="ecoustomer_man" lay-verify="required"
							autocomplete="off" class="layui-input">
					</div>

				</div>
				<div class="layui-inline">
					<label class="layui-form-label">电话</label>
					<div class="layui-input-inline">
						<input name="ecoustomer_tel" lay-verify="required"
							autocomplete="off" class="layui-input">
					</div>

				</div>
				<div class="layui-inline">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-inline">
						<input name="ecoustomer_email" lay-verify="required"
							autocomplete="off" class="layui-input">
					</div>

				</div>
				<div class="layui-inline">
					<label class="layui-form-label">地址</label>
					<div class="layui-input-inline">
						<input name="ecoustomer_addr" lay-verify="required"
							autocomplete="off" class="layui-input">
					</div>

				</div>

				<div class="layui-inline">
					<label class="layui-form-label">负责人</label>
					<div class="layui-input-inline">
						<input name="ecoustomer_user" lay-verify="required"
							autocomplete="off" class="layui-input">
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
					<label class="layui-form-label">客户姓名</label>
					<div class="layui-input-inline">
						<input  name="coustomer_name" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">联系人</label>
					<div class="layui-input-inline">
						<input  name="coustomer_man" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">电话</label>
					<div class="layui-input-inline">
						<input  name="coustomer_tel" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-inline">
						<input  name="coustomer_email" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
<div class="layui-inline">
					<label class="layui-form-label">地址</label>
					<div class="layui-input-inline">
						<input  name="coustomer_addr" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>

<div class="layui-inline">
					<label class="layui-form-label">负责人</label>
					<div class="layui-input-inline">
						<input  name="ecoustomer_user" lay-verify="required" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
		</form>
	</div>
		</script>

	<script type="text/htmL" id="rowbar">

<a class="layui-btn layui-btn-xs"lay-event="edit">编辑</a>
<a class="layui-btn layui-btn-xs" lay-event="private">跟单</a>
</script>

	<script type="text/html" id="rowbar2">

<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
<a class="layui-btn layui-btn-xs" lay-event="private">跟单</a>
</script>

	<table class="layui-table" lay-filter="test"
		lay-data="{url:'sys/publiccoustomerlist',toolbar:'#toolbarDemo',id:'publiccoustomerlist',page: true}">
		<thead>
			<tr>

				<th lay-data="{checkbox:true}"></th>

				<th lay-data="{field:'coustomer_name'}">客户姓名</th>
				<th lay-data="{field:'coustomer_man'}">联系人</th>
				<th lay-data="{field:'coustomer_tel'}">电话</th>
				<th lay-data="{field:'coustomer_email'}">邮箱</th>
				<th lay-data="{field:'coustomer_addr'}">地址</th>
				<th
					lay-data="{field:'coustomer_public',templet:function(d){
				if(d.coustomer_public==0){
				return '是';
				}else{
				return '否';
				}
				}}"}">是否是公海客户</th>
				<th lay-data="{field:'coustomer_grand'}">等级</th>
				<th lay-data="{field:'create_time'}">创造时间</th>
				<th lay-data="{field:'coustomer_user'}">负责人</th>

				


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
	<script>
		var table = layui.table;
		table.on('toolbar(test)', function(obj) {

			var checkStatus = table.checkStatus(obj.config.id);
			switch (obj.event) {
			case 'perm':

				if (checkStatus.data.length == 1) {

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
			if (obj.event === 'private') {
				layer.confirm('确定要跟单'+data.coustomer_name+'此客户吗', 
						function(index){
					/*发送请求，将该客户变成登录用户变成跟单客户  */
					$.post("sys/coutomer_private",data,function() {
						
						layer.msg('成功跟单', {icon: 6});
						table.reload("publiccoustomerlist");
					})
				})
				
			}else if (obj.event === 'edit') {
				$('[name="ecoustomer_name"]').val(data.coustomer_name);
				$('[name="ecoustomer_man"]').val(data.coustomer_man);
				$('[name="ecoustomer_tel"]').val(data.coustomer_tel);
				$('[name="ecoustomer_email"]').val(data.coustomer_email);
				$('[name="ecoustomer_addr"]').val(data.coustomer_addr);

				$('[name="ecoustomer_user"]').val(data.coustomer_user);

				layer.open({
					type : 1,
					offset : 'auto',
					id : 'edit_win',//防止重复弹出
					content : $('#editdiv'),
					btn : [ '保存', '关闭' ],
					btnAlign : 'c', //按钮居中
					title : '编辑客户信息',
					shade : [ 0.8, '#393D49' ],
					btn1 : function() {
						//保存信息的方法
						//发送参数
						$.post("sys/updatecoustomer", {
							"coustomer_id" : data.coustomer_id,
							"coustomer_name" : $('[name="ecoustomer_name"]')
									.val(),
							"coustomer_man" : $('[name="ecoustomer_man"]')
									.val(),
							"coustomer_tel" : $('[name="ecoustomer_tel"]')
									.val(),
							"coustomer_email" : $('[name="ecoustomer_email"]')
									.val(),
							"coustomer_addr" : $('[name="ecoustomer_addr"]')
									.val(),

							"coustomer_user" : $('[name="ecoustomer_user"]')
									.val()

						}, function(d) {
							//提示信息
							layer.msg('编辑成功', {
								time : 2000, //3s后自动关闭
							});
							table.reload('publiccoustomerlist', {
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
			var cs = table.checkStatus("publiccoustomerlist");
			switch (obj.event) {
			case 'select':
				table.reload("publiccoustomerlist", {
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
						$.post("sys/addcoustomer",
								{
									"coustomer_name" : $(
											'[name="coustomer_name"]').val(),
									"coustomer_man" : $(
											'[name="coustomer_man"]').val(),
									"coustomer_tel" : $(
											'[name="coustomer_tel"]').val(),
									"coustomer_email" : $(
											'[name="coustomer_email"]').val(),
									"coustomer_addr" : $(
											'[name="coustomer_addr"]').val(),

									"coustomer_user" : $(
											'[name="coustomer_user"]').val()

								}, function(d) {
									//提示信息
									layer.msg('新增成功', {
										time : 3000, //3s后自动关闭
									});
									table.reload('publiccoustomerlist', {
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
						var idtext = "";
						for (var i = 0; i < cs.data.length; i++) {
							console.log(cs.data[i].id);
							idtext += "'" + cs.data[i].role_id + "',";

						}
						idtext += "''";
						console.log(idtext);
						$.post("sys/deletecoustomer", {
							ids : idtext
						}, function(d) {
							layer.msg("你已经成功删除" + data.length + "条数据 ", {

								time : 2000, //2s后自动关闭
							});
							table.reload('publiccoustomerlist', {
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
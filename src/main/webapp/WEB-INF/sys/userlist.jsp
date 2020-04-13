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
<link rel="stylesheet" href="../layui/css/layui.css">

</head>
<body>
	<table class="layui-table" lay-filter="userlist"
		lay-data="{url:'sys/getUser',toolbar:'#toolbarDemo',id:'userlist',page: true}">
		<thead>
			<tr>
				<th lay-data="{type:'checkbox'}"></th>
				<th
					lay-data="{field:'user_id',align:'center', sort: true,hide:'true'}">ID</th>
				<th
					lay-data="{field:'user_email',align:'center',templet:function(d){
					var email=d.user_email;
					if (String(email).indexOf('@') > 0) { 
　　　		　			var str = email.split('@');
　　　　　　				_s = ''; 
　　　　					if (str[0].length > 3) {
　　　　　　					for (var i = 0; i < str[0].length - 3; i++) { 
　　　　　　　					　_s += '*'; 
　　　　　					}} 
　　　　				var new_email = str[0].substr(0, 3) + _s + '@' + str[1] 
　　					} 
　　					return new_email				
				}}">email账号</th>
				<th lay-data="{field:'user_name',align:'center'}">昵称</th>
				<th lay-data="{field:'branch_name',align:'center'}">部门</th>
				<th
					lay-data="{field:'user_status',align:'center',templet:'#statusTpl', sort: true}">状态</th>
				<th
					lay-data="{fixed: 'right',align:'center',width: 165,templet:'#rightTpl'}">操作</th>
			</tr>
		</thead>
	</table>


	<div style="display: none" id="shuttle1"></div>

	<!-- 自定义工具条 -->
	<script type="text/html" id="statusTpl">
    {{#  if(d.user_status ==0 ){ }}
    <p style="color: #FFB800">离&ensp;职</p>
    {{#  } else { }}
    <p style="color: #666">在&ensp;职</p>
    {{#  } }}
</script>
	<!-- 侧边栏 -->
	<script type="text/html" id="rightTpl">
    {{#  if(d.user_status !=0 ){ }}
	<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="role" data-method="notice" >授职</a>
	<a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="status">停用</a>
    {{#  } else { }}
	<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="status">恢复</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{#  } }}
</script>
	<!-- 上边栏 -->
	<script type="text/html" id="toolbarDemo">
<div class="layui-input-inline" >
	<input type="text" id="checktext" name="title" 
		lay-verify="required" placeholder="请输入关键字查询"  class="layui-input" autocomplete="off">
</div>
<div class="layui-btn-container layui-input-inline">
<button class="layui-btn layui-btn-normal" lay-event="check">查询数据</button>
<button class="layui-btn layui-btn-normal" lay-event="branch">分配部门</button>
<button class="layui-btn layui-btn-normal" lay-event="add">添加用户</button>
<button class="layui-btn layui-btn-primary" lay-event="return">返回刷新</button>
</div>
</script>

	<!-- <script type="text/html" id="barDemo">
<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="look" data-method="notice" >查看</a>
<a class="layui-btn layui-bg-orange layui-btn-xs" lay-event="status">封号</a>
<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>右边栏 -->
	<form hidden="" class="layui-form" action="" id="addBranchUser">
		<div class="layui-form-item">
			<input type="hidden" name="" class="" value="" id="hid_id">
			<div class="">
				<select name="xiala" lay-verify="required" id="xiala"
					lay-filter="test">
					<option value="">请选择部门</option>
				</select>
			</div>
		</div>
	</form>

	<!-- add -->
	<div hidden id='addUser'>
		<form class="layui-form" style="transform: translateY(20px)">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">账号邮箱：</label>
					<div class="layui-input-inline">
						<input type="text" id='add_email' name="add_email" required
							placeholder="请输入邮箱账号" autocomplete="off"
							lay-verify="required|haveEmail|email" class="layui-input"
							style="width: 220px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">账号昵称：</label>
					<div class="layui-input-inline">
						<input type="text" id='add_name' name="add_name" required
							placeholder="请输入昵称" autocomplete="off" lay-verify="required|name"
							class="layui-input" style="width: 220px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">账号密码：</label>
					<div class="layui-input-inline">
						<input type="password" id='add_pass1' name="add_pass1"
							class="layui-input" placeholder="请输入密码" autocomplete="off"
							required lay-verify="required|pass" style="width: 220px">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">确认密码：</label>
					<div class="layui-input-inline">
						<input type="password" id='add_pass2' name="add_pass2"
							class="layui-input" placeholder="请再次输入密码" autocomplete="off"
							required lay-verify="required|pass|confirmPass"
							style="width: 220px">
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../layui/layui.all.js"></script>
	<script type="text/javascript">
		var layer = layui.layer;
		var $ = layui.jquery;
		var form = layui.form;
		var table = layui.table;
		var transfer = layui.transfer;
		//监听行工具事件
		table.on('tool(userlist)', function(obj) {
			var data = obj.data;
			if (obj.event === 'role') {
				var user_id = data.user_id;
				layer.open({
					type : 1,
					title : "授职 ",
					content : $("#shuttle1"),
					btn : [ "关闭" ],
					closeBtn : false,
					area : [ '480px', '500px' ],
					skin : 'layui-layer-lan',
					shade : 0,
					anim : 6,
					success : function() {
						var data1;
						var data2;
						$.ajax({
							type : "post",
							url : "sys/getLeftData",
							async : false,
							success : function(d) {
								data1 = d;
							}
						});
						$.ajax({
							type : "post",
							url : "sys/getRightData",
							async : false,
							data : {
								"user_id" : user_id,
							},
							success : function(d) {
								data2 = d;
							}
						});
						//渲染
						transfer.render({
							title : [ '未分配', '已分配' ],
							elem : '#shuttle1',
							data : data1,
							value : data2,
							id : 'demo1',
							onchange : function(objdata, index) {
								var arr = [ 'left', 'right' ];
								var roleData = "";
								console.log(objdata)
								if (arr[index] == 'left') {
									for (var i = 0; i < objdata.length; i++) {
										console.log("添加" + objdata[i].value);
										roleData += objdata[i].value + ",";
									}
									$.ajax({
										type : "post",
										url : "sys/addUserRole",
										async : false,
										data : {
											"user_id" : user_id,
											"roleData" : roleData,
										},
									});

								} else {
									for (var i = 0; i < objdata.length; i++) {
										console.log("删除" + objdata[i].value);
										roleData += objdata[i].value + ",";
									}
									$.ajax({
										type : "post",
										url : "sys/delUserRole",
										async : false,
										data : {
											"user_id" : user_id,
											"roleData" : roleData,
										},
									});
								}
							}
						});
					},

				})
			} else if (obj.event === 'del') {
				var status = data.status;
				if (status == 0) {
					layer.confirm('真的确定要删除此员工的数据吗！？', {
						icon : 5
					}, function(index) {
						layer.close(index);
						var user_id = data.user_id;
						//console.log(user_id);
						$.post("sys/delUser", {
							"user_id" : user_id
						}, function() {
							layer.msg("你已经成功删除一条ID为 " + user_id + " 员工数据 ", {
								icon : 6
							});
						});
						table.reload("userlist");
					});
				} else {
					layer.msg('用户并没有离职，不可以删除！？', {
						icon : 5
					})
				}
			} else if (obj.event === 'status') {
				var user_status = data.user_status;
				var user_id = data.user_id;
				if (user_status == 0) {
					layer.confirm('员工是否在职！？', {
						icon : 3
					}, function(index) {
						layer.close(index);
						$.post("sys/updUserStatus", {
							"user_status" : '1',
							"user_id" : user_id
						});
						table.reload("userlist");
					})
				} else {
					layer.confirm('员工是否已离职！？', {
						icon : 7
					}, function(index) {
						layer.close(index);
						$.post("sys/updUserStatus", {
							"user_status" : '0',
							"user_id" : user_id
						});
						table.reload("userlist");
					})
				}
			}
		})
		//头工具栏事件
		table
				.on(
						'toolbar(userlist)',
						function(obj) {
							var checkStatus = table.checkStatus(obj.config.id);
							switch (obj.event) {
							case 'add':
								layer.open({
									type : 1,
									title : "添加管理员信息 ",
									content : $("#addUser"),
									btn : [ "保存", "取消" ],
									closeBtn : false,
									area : [ '400px', '400px' ],
									skin : 'layui-layer-lan',
									shade : 0,
									anim : 6,
									success : function(layero) {
										$(':focus').blur();
										// 添加form标识
										layero.addClass('layui-form');
										// 将保存按钮改变成提交按钮
										layero.find('.layui-layer-btn0').attr({
											'lay-filter' : 'formDemo',
											'lay-submit' : ''
										});
										form.render();
									},
									yes : function() {
										form.on('submit(formDemo)', function(data) {
											//表单数据formData
											var formData = data.field;
											var user_name = formData.add_name;
											var user_email = formData.add_email;
											var user_pass = formData.add_pass1;
											$.ajax({
												type : "post",
												url : "sys/addUser",
												async : false,
												data : {
													"user_email" : user_email,
													"user_name" : user_name,
													"user_pass" : user_pass,
												},
												success : function() {
													layer.closeAll();
													layer.msg("你已经成功添加一个名为 " + user_name
															+ " 的管理员 ", {
														icon : 1
													});
													$("#add_name").val("");
													$("#add_email").val("");
													$("#add_pass1").val("");
													$("#add_pass2").val("");
												}
											});
											table.reload("userlist");
										})
									}
								});
								break;
							case 'check':
								var checktext = $("#checktext").val();
								if (checktext.length > 0) {
									table.reload("userlist", {
										url : "sys/getUser",
										where : {
											"checktext" : checktext
										},
										page : {
											curr : 1
										//重新从第 1 页开始
										}
									});
									$("#checktext").val(checktext);
								} else {
									layer.msg("请输入关键字后再查询。。", {
										icon : 7
									});
								}
								break;
							case 'branch':
								var data = checkStatus.data;
								if (data.length < 1) {
									layer.msg("请选择数据后再分配部门。。 ", {
										icon : 7
									});
								} else {
									layer
											.open({
												type : 1,
												title : "分配部门 ",
												content : $("#addBranchUser"),
												btn : [ "确定", "关闭" ],
												closeBtn : false,
												area : [ '480px', '500px' ],
												skin : 'layui-layer-lan',
												shade : 0,
												anim : 6,
												success : function() {
													$
															.ajax({
																type : "post",
																url : "sys/getUserBranch",
																async : false,
																success : function(
																		res) {
																	var len = res.length;
																	if (len > 0) {
																		$(
																				".area2")
																				.remove();
																		for (var i = 0; i < len; i++) {
																			$(
																					"#xiala")
																					.append(
																							'<option class="area2" value='+res[i].branch_id+'>'
																									+ res[i].branch_name
																									+ '</option>');
																		}
																		form
																				.render();
																	}
																}
															});
												},
												yes : function() {
													var branch_id = $("#hid_id")
															.val();
													console.log(branch_id);
													var userStr = "";
													for (var i = 0; i < data.length; i++) {
														userStr += data[i].user_id
																+ ",";
													}
													$
															.ajax({
																type : "post",
																url : "sys/addBranchUser",
																async : false,
																data : {
																	"branch_id" : branch_id,
																	"userStr" : userStr
																},
																success : function() {
																	layer
																			.closeAll();
																	table
																			.reload("userlist");

																}
															});
												}
											})
								}
								break;
							case 'delAll':
								var data = checkStatus.data;
								if (data.length < 1) {
									layer.msg("请选择数据后再删除。。 ", {
										icon : 7
									});
								} else {
									layer.confirm('真的确定要删除这些数据吗！？', {
										icon : 5
									}, function(index) {
										layer.close(index);
										var user_id;
										for (var i = 0; i < data.length; i++) {
											//console.log(data.{i});						
											user_id = data[i].user_id;
											$.post("sys/delUser", {
												"user_id" : user_id
											});
											//obj.del();
											layer.msg("你已经成功删除" + data.length
													+ "条数据 ", {
												icon : 6
											});
											table.reload("userlist");
										}
									});
								}
								break;
							case 'return':
								window.location.reload();
								break;
							}
							;
						});

		form.on('select(test)', function(data) {
			$("#hid_id").val(data.value);
		})
		
		form.verify({
			name : [ /^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$/,
					'2至20位中文、英文、数字但不包括下划线等符号' ],
			haveEmail : function(value, item) {
				var msg;
				$.ajax({
					async : false,
					type : "post",
					url : "sys/getOneUserCount",
					data : {
						"user_email" : $("#add_email").val(),
					},
					success : function(d) {
						msg = d;
						console.log(msg)
					}
				});
				if (msg == false)
					return '你的邮箱已经注册过了!?';
			},
			pass : [ /^[a-zA-Z]\w{5,17}$/, '密码以字母开头，长度在6-18之间，只能包含字母、数字和下划线' ],
			confirmPass : function(value) {
				if ($('input[name=add_pass1]').val() !== value)
					return '两次密码输入不一致！';
			},
		});
	</script>
</body>
</html>
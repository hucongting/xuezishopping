<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加会员</title>
<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css" media="all">
<script type="text/javascript">
	$(function(){
		$("#btn_commit").click(function(){
			var fname = $("#fname").val();
			var lname = $("#lname").val();
			var age = $("#age").val();
			var sex = $("#sex option:selected").val();
			if(fname == "" || lname == "" || age == "" || sex == "default"){
				window.top.layer.msg('请输入完整信息', function(){});
			}else{
				window.top.layer.msg('添加成功');
				$.post('../person/insert_person?fname='+fname+'&lname='+lname+'&age='+age+'&sex='+sex,function(data){});
			}
		});
	});
</script>
	
</head>
<body>
	<form action="#">
		<div class="layui-col-md6">
			用户名<input type="text" id="fname" name="fname" placeholder="用户名" autocomplete="off" class="layui-input">
		</div>
		<div class="layui-col-md6">
			昵称<input type="text" id="lname" name="lname" placeholder="昵称"  name="title" class="layui-input">
		</div>
		<div class="layui-col-md6">
			年龄<input type="text" placeholder="年龄"  id="age"  name="age" class="layui-input">
		</div>
		<div class="layui-col-md6">
			性别
			<select id="sex" name="sex">
				<option value="default">选择</option>
				<option value="0">男</option>
				<option value="1">女</option>
			</select>
		</div>
		<div class="layui-input-block">
			<button id="btn_commit" class="layui-btn" lay-submit lay-filter="component-form-element">立即提交</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</form>
</body>
</html>
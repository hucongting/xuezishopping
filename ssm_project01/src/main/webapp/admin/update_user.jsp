<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户资料</title>
<link rel="stylesheet" type="text/css" href="../admin/common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="../admin/common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css" href="../admin/common/global.css" media="all">
<link rel="stylesheet" type="text/css" href="../admin/css/personal.css" media="all">
<script type="text/javascript" src="../admin/common/layui/layui.js"></script>
<script type="text/javascript" src="../admin/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../admin/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../admin/layer/layer.js"></script>
<link rel="stylesheet" type="text/css" href="../admin/layer/theme/default/layer.css" media="all">

<script type="text/javascript">
	$(function(){
		$("#btn_update_commit").click(function(){
			var id = $("#id").val();
			var fname = $("#fname").val();
			var lname = $("#lname").val();
			var age = $("#age").val();
			var sex = $("#sex option:selected").val();
			var par = 'id='+id+'&fname='+fname+'&lname='+lname+'&age='+age+'&sex='+sex;
			window.top.layer.msg('修改成功');
			$.post('../person/updatepersonByid',par,function(data){});
		});
	});
	
</script>


</head>
<body>
	<form action="#">
		<input type="hidden" id="id" name="id" value="${person.id }">
		<input type="hidden" id="sexs" name="sexs" value="${person.sex }">
		<div class="layui-col-md6">
			用户名<input type="text" id="fname" name="fname" autocomplete="off" class="layui-input" value="${person.fname }" >
		</div>
		<div class="layui-col-md6">
			昵称<input type="text" id="lname" name="lname"   name="title" class="layui-input" value="${person.lname }">
		</div>
		<div class="layui-col-md6">
			年龄<input type="text"   id="age"  name="age" class="layui-input" value="${person.age }">
		</div>
		<div class="layui-col-md6">
			性别
			<select id="sex" name="sex">
				<option value="default">选择</option>
				<option value="0">男</option>
				<option value="1">女</option>
			</select>
		</div>
		<!-- 加载窗体并选中指定性别 -->
		<script type="text/javascript">
			var sex = $("#sexs").val();
			if(sex == "1"){
				$("#sex").find("option").eq(1).prop("selected",true);
			}else{
				$("#sex").find("option").eq(2).prop("selected",true);
			}
		</script>
		<div class="layui-input-block">
			<button id="btn_update_commit" class="layui-btn" lay-submit lay-filter="component-form-element">立即提交</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/layer/theme/default/layer.css"></script>
<script type="text/javascript">
	$(function(){
		$("#aaa").on('click',function(){
			alert('sdfdsddddd');
			layer.msg('玩命提示中');
		});
	});
</script>

</head>
<body>
	<a href="javascript:;" id="aaa">TEST</a>
</body>
</html>
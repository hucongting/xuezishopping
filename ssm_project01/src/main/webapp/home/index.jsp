<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../home/layui/css/layui.css" rel="stylesheet"/>
<script type="text/javascript" src="../home/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/layer/theme/default/layer.css"></script>
<script type="text/javascript" src="../home/layui/layui.js"></script>
<script type="text/javascript">
$(function(){
	$.post('../person/personListFY',function(data){
		alert(data);
	});

	layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage
		  ,layer = layui.layer;
		  
		  //总页数大于页码总数
		  laypage.render({
		    elem: 'demo1'
		    ,count: 150 //数据总数
		    ,first: '第一页'
		    ,last: '尾页'
		    ,jump: function(obj){
		      console.log(obj)
		    }
		  });
	});
});
</script>

</head>
<body>
	<!-- 测试分页 -->
	<table>
	<c:forEach begin="0" step="1" items="${personList }" var="list">
		<tr>
			<td>${list.id }</td>
			<td>${list.fname }</td>
			<td>${list.lname }</td>
			<td>${list.age }</td>
			<td>${list.sex }</td>
		</tr>
	</c:forEach>
	</table>
	 <p>一共${page.pages} 页</p>
	 <a href="personListFY?page=${page.firstPage}">第一页</a>
    <a href="personListFY?page=${page.nextPage}">下一页</a>
    <a href="personListFY?page=${page.prePage}">上一页</a>
    <a href="personListFY?page=${page.lastPage}">最后页</a>
	<div id="demo1"></div>
</body>
</html>
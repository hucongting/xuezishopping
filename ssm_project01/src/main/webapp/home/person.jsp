<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Ajax PersonList</title>
<script type="text/javascript" src="../home/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#select_person").change(function(){
			var val = $(this).val();
			var url = "../person/personbyid?id="+val;
			$.post(url,function(data){
				var result = data.lname;
				var age = data.age;
				document.getElementById("content").innerHTML = "<p>"+result+"</p><p>"+age+"</p>";
			});
			
			var url_two = "../persontwo/persontwobyid?id="+val;
			$("#select_person_two").empty();
			$.post(url_two,function(data){
				for(i=0;i<data.length;i++){
					$("#select_person_two").append("<option value='"+data[i].id+"'>"+data[i].two_name+"</option>");
				}
			});
		});
	});
	
	$(function(){
		$("#btn").click(function(){
			alert("aaa");
			var sel_per = $("#select_person option:selected").text();
			var sel_pertwo = $("#select_person_two option:selected").text();
			alert(sel_per+"---"+sel_pertwo);
		});
	});
	 
</script>
</head>
<body>
	<select id="select_person" name="person_select">
		<c:if test="${empty person_list }">
			<option>---请选择---</option>
		</c:if>
		<c:if test="${not empty person_list }">
			<option>---请选择---</option>
			<c:forEach items="${person_list }" var="p">
				<option value="${p.id }">${p.fname }</option>
			</c:forEach>
		</c:if>
	</select>
	
	<select id="select_person_two" name="person_select-two">
		<option>---请选择---</option>
	</select>
	<div id="content"></div>
	
	<input type="button" id="btn" value="确定...">
</body>
</html>

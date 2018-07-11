<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员列表</title>
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
	/* CIUD完无刷新效果方法 */
	function show(){
		var str = $("#gjz_text").val();
		var url = "../person/user_list_bylike?str="+str;
		$.post(url,function(data){
			$("#tbody_content").empty();
			for(i=0;i<data.length;i++){
				var sex;
				if(data[i].sex=='0'){
					sex = '女';
				}else{
					sex = '男';
				}
				document.getElementById("tbody_content").innerHTML+='<tr><td><input type="checkbox" id="person_checkbox_id" name="person_checkbox_name" value='+data[i].id+'></td><td>'+data[i].id+'</td><td>'+data[i].fname+'</td><td>'+data[i].lname+'</td><td>'+data[i].age+'</td><td>'+sex+'</td><td><a href="javascript:;" class="layui-btn layui-btn-small" id="delete_'+data[i].id+'" onclick="delete_fun('+data[i].id+')" ><i class="iconfont icon-shanchu1"></i>删除</a>&nbsp;<a href="javascript:;" class="layui-btn layui-btn-small" onclick="update_fun('+data[i].id+')"><i class="iconfont icon-shanchu1"></i>编辑</a></td></tr>';
			}
		}); 
		
	}

	/* 查询按钮 */
	$(function(){
		$("#sel_btn").click(function(){
			show();
		});	
	});
	
	/* 删除单个用户 */
	function delete_fun(id){
		//询问框
		layer.confirm('是否删除'+id+'用户？', {
		  btn: ['删除','取消'] //按钮
		}, function(){
		   $.post('../person/deletebyid?id='+id,function(data){
			   var flag = data; 
			   if(flag){
		  			layer.msg('删除成功');
		  			show();
			   }else{
			    	layer.msg('删除失败');
			    }
		    });
		}, function(){
		  layer.msg('已取消');
		});
	}
	
	/* 批量删除 */
	$(function(){
		$("#btn_delete").click(function(){
			var checkedid = $("input[name='person_checkbox_name']:checked");
			if(checkedid.length==0){
				layer.msg('至少选择一个');
			}else{
				//询问框
				layer.confirm('删除选中的用户？', {
				  btn: ['确定','取消'] //按钮
				}, function(){
					var checkedList = new Array();
					checkedid.each(function(){
						checkedList.push($(this).val());
					});
					$.post('../person/pl_deletebyid?checkedids='+checkedList,function(data){
						var flag = data;
						if(flag){
							layer.msg('删除成功');
				  			show();
						}else{
							layer.msg('删除失败');
						}
					});
				}, function(){
				  layer.msg('已取消');
				});
			}
		});
	});
	
	/* 添加按钮*/
	$(function(){
		$("#a_insert").click(function(){
			layer.open({
				  type: 2,
				  title: '添加会员',
				  shadeClose: true,
				  shade: 0.8,
				  area: ['580px', '80%'],
				  content: 'add_user.jsp' //iframe的url
			});
		});
	});
	
	/* 修改按钮*/
	function update_fun(id){
		layer.open({
			  type: 2,
			  title: '修改会员资料',
			  shadeClose: true,
			  shade: 0.8,
			  area: ['580px', '80%'],
			  content: '../person/updateSelByid?id='+id
		});
	}
	
</script>
</head>
<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input value="" id="gjz_text" placeholder="请输入关键字" class="layui-input search_input" type="text">
		    </div>
		    <a class="layui-btn se8arch_btn" id="sel_btn">查询</a>
		</div><div class="layui-inline">
			<a href="javascript:;" id="a_insert" class="layui-btn layui-btn-normal newsAdd_btn">添加会员</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel" id="btn_delete">批量删除</a>
		</div>
		<div class="layui-inline">
			<div class="layui-form-mid layui-word-aux">本页面刷新后除新添加的文章外所有操作无效，关闭页面所有数据重置</div>
		</div>
	</blockquote>
            
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		         <!-- 操作日志 -->
                <div class="layui-tab-item layui-field-box layui-show">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th><input type="checkbox" id="selected-all"></th>
                                  <th>ID</th>
                                  <th>名称</th>
                                  <th>昵称</th>
                                  <th>年龄</th>
                                  <th>性别</th>
                                  <th>操作</th>
                              </tr>
                          </thead>
                          <tbody id="tbody_content">
                              <c:forEach items="${user_list }" var="pl">
	                              <tr>
	                                <td><input type="checkbox" id="person_checkbox_id" name="person_checkbox_name" value="${pl.id }"></td>
	                                <td>${pl.id }</td>
	                                <td>${pl.fname }</td>
	                                <td>${pl.lname }</td>
	                                <td>${pl.age }</td>
	                                <td>
	                                		<c:if test="${pl.sex eq '0'}"><span>女</span></c:if>
	                                		<c:if test="${pl.sex eq '1'}"><span>男</span></c:if>
	                                </td>
	                                <td>
	                                		<a href="javascript:;" id="delete_${pl.id }" onclick="delete_fun(${pl.id})" class="layui-btn layui-btn-small"><i class="iconfont icon-shanchu1"></i>删除</a>
	                                		<a href="javascript:;" class="layui-btn layui-btn-small" onclick="update_fun(${pl.id})"><i class="iconfont icon-shanchu1"></i>编辑</a>
	                                </td>
	                              </tr>
                              </c:forEach>
                          </tbody>
                     </table>
                    
			    </div>
			 
		    </div>
		</div>
	</div>
</section>
</body>
</html>
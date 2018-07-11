<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
<link rel="stylesheet" type="text/css" href="css/adminstyle.css" media="all">                                                                                                                                                                                     
<script type="text/javascript" src="common/layui/layui.js"></script> 
<script type="text/javascript" src="js/larry.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin" id="layui_layout">
	<!-- 顶部区域 -->
	<div class="layui-header header header-demo">
		<div class="layui-main">
		    <!-- logo区域 -->
			<div class="admin-logo-box">
				<a class="logo" href="http://www.kuxuebao.net" title="logo">后台管理系统</a>
				<div class="larry-side-menu">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</div>
			</div>
            <!-- 顶级菜单区域 -->
            <div class="layui-larry-menu">
                 <ul class="layui-nav clearfix">
                       <li class="layui-nav-item layui-this">
                 	   	   <a href="javascirpt:;"><i class="iconfont icon-wangzhanguanli"></i>内容管理</a>
                 	   </li>
                 </ul>
            </div>
            <!-- 右侧导航 -->
            <ul class="layui-nav larry-header-item">
            		<li class="layui-nav-item">
            			账户：xxxx
            		</li>
            		
					<li class="layui-nav-item">
						<a href="login.html">
                       	 <i class="iconfont icon-exit"></i>
						退出</a>
				</li>
            </ul>
		</div>
	</div>
	<!-- 左侧侧边导航开始 -->
	<div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">
		
		<!-- 左侧菜单 -->
		<ul class="layui-nav layui-nav-tree">
			<li class="layui-nav-item layui-this">
				<a href="javascript:;" data-url="main.html">
				    <i class="iconfont icon-home1" data-icon='icon-home1'></i>
					<span>后台首页</span>
				</a>
			</li>
			<!-- 个人信息 -->
			<li class="layui-nav-item">
				<a href="javascript:;">
					<i class="iconfont icon-jiaoseguanli" ></i>
					<span>我的面板</span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-url="personinfo.jsp">
                            <i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
                            <span>个人信息</span>
                        </a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="updatepwd.jsp">
                            <i class="iconfont icon-iconfuzhi01" data-icon='icon-iconfuzhi01'></i>
                            <span>修改密码</span>
                        </a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="loginfo.jsp">
                            <i class="iconfont icon-piliangicon" data-icon='icon-piliangicon'></i>
                            <span>日志信息</span>
                        </a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="${pageContext.request.contextPath }/person/user_list">
                            <i class="iconfont icon-piliangicon" data-icon='icon-piliangicon'></i>
                            <span>会员管理</span>
                        </a>
                    </dd>
                </dl>
			</li>
			<!-- 用户管理 -->
			<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-jiaoseguanli2" ></i>
					   <span>表格表单</span>
					   <em class="layui-nav-more"></em>
					</a>
					    <dl class="layui-nav-child">
					    	<dd>
					    		<a href="javascript:;" data-url="table.jsp">
					    		   <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
					    		   <span>有线条表格</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;"  data-url="table_1.jsp">
					    		   <i class="iconfont icon-jiaoseguanli4" data-icon='icon-jiaoseguanli4'></i>
					    		   <span>无线条输入增加内容框</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;" data-url="loginfo.jsp">
					    		   <i class="iconfont icon-quanxian2" data-icon='icon-quanxian2'></i>
					    		   <span>无线条表格</span>
					    		</a>
					    	</dd>
					    </dl>
			    </li>
			<!-- 内容管理 -->
			<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-wenzhang1" ></i>
					   <span>内容管理</span>
					   <em class="layui-nav-more"></em>
					</a>
					   <dl class="layui-nav-child">
					   	   <dd>
					    		<a href="javascript:;" data-url="404.jsp">
					    		   <i class="iconfont icon-lanmuguanli" data-icon='icon-lanmuguanli'></i>
					    		   <span>404页面</span>
					    		</a>
					    	</dd>
					    
					   </dl>
			   </li>
			
                 <!-- 会员管理 -->
				<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-m-members" ></i>
					   <span>单页面</span>
					   <em class="layui-nav-more"></em>
					</a>
					<dl class="layui-nav-child">
                           <dd>
                           <a href="javascript:;" data-url="404.jsp">
					              <i class="iconfont icon-zhuti"  data-icon='icon-zhuti'></i>
					              <span>404提示页面</span>
					           </a>
                           </dd>
                           <dd>
                           	   <a href="javascript:;" data-url="tab.jsp">
					              <i class="iconfont icon-zhuti"  data-icon='icon-zhuti'></i>
					              <span>选项卡页面</span>
					   </a>
                           </dd>
              </dl>
				</li>
		</ul>
	    </div>
	</div>

	<!-- 左侧侧边导航结束 -->
	<!-- 右侧主体内容 -->
	<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
		<div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
			<div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i> </div>
			<ul class="layui-tab-title">
				<li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em>后台首页</em></li>
			</ul>
			<div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div> 
			<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
				    <dl class="layui-nav-child">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
			<div class="layui-tab-content" style="min-height: 150px; ">
				<div class="layui-tab-item layui-show">
					<iframe class="larry-iframe" data-id='0' src="main.jsp"></iframe>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部区域 -->
	<div class="layui-footer layui-larry-foot" id="larry-footer">
		<div class="layui-mian">  
		    <p class="p-admin">
		    	<span>2018 &copy;</span>
		    	 广州xxxxxxxxx有限公司,版权所有
		    </p>
		</div>
	</div>
</div>
</body>
</html>
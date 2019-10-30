<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>欢迎使用新闻管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		.top{
			position:absolute;
			 top:0px;
			 left:0px;
			 width:100%;
			 height:20%;
			 border: 5px solid;
			}
		.left{
			 position:absolute;
			 top:20%;
			 left:0px;
			 width:20%;
			 height:100%;
			 border: 5px solid;
			 }
		.right{ 
			 position:absolute;
			 top:20%;
			 left:20%;
			 width:80%;
			 height:100%;
			 border: 5px solid;
		}
		li{
			list-style: none;
		}
	</style>
  </head>
  <body>
  	<div class="par">
  		<div class="top" align="center">
	 		<h1>欢迎${user.name}登录</h1><p>
	 		<a href="user/out">退出</a>
  		</div>
    	<div class="left">
    		<ul>
    			<c:forEach items="${user.role.powers}" var="p">
                    <li><a href="${p.url}" target="right">${p.name}</a></li>
                </c:forEach>
    		</ul>
    	</div>
    	<div class="right">
    		<!-- 定义一个frame框架,在点击超链接的时候可以让超链接的页面显示在该框架下 -->
    		<iframe name="right"  frameborder="0" height="100%" width="100%">
    		</iframe>
    	</div>
    </div>
  </body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>添加数据</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>

<body>
<p style="font-size: 2px; color: red">${param.error}</p>
<form action="news/add" method="post" enctype="multipart/form-data">
    id：<input type="text" name="id"><p />
    新闻编号：<input type="text" name="newsId"><p />
    新闻标题：<input type="text" name="title"><p />
    新闻内容：<input type="text" name="context"><p />
    新闻作者：<input type="text" name="newsMan"><p />
    发布时间：<input type="date" name="newsDate"><p />
    新闻类型：<select name="typeId">
    <c:forEach items="${types}" var="t">
        <option value="${t.typeId}">${t.typeName}</option>
    </c:forEach>
</select><p />
    新闻图片：<input type="file" name="imgPic"><p />
    <input type="submit" value="添加">
</form>
</body>
</html>

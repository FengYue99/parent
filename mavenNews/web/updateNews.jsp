<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>修改数据</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body>
<form action="news/update" method="post" enctype="multipart/form-data">
    id：<input type="text" name="id" value="${news.id}" readonly="readonly">
    <p/>
    新闻编号：<input type="text" name="newsId" value="${news.newsId}" readonly="readonly">
    <p/>
    新闻标题：<input type="text" name="title" value="${news.title}">
    <p/>
    新闻内容：<input type="text" name="context" value="${news.context}">
    <p/>
    新闻作者：<input type="text" name="newsMan" value="${news.newsMan}">
    <p/>
    发布时间：
    <input type="date" name="newsDate" value="<fmt:formatDate value="${news.newsDate}" pattern="yyyy-MM-dd"></fmt:formatDate>">
    <p/>
    新闻类型：<select name="typeId">
                <c:forEach items="${types}" var="t">
                    <option value="${t.typeId}"<c:if test="${news.typeId==t.typeId}">selected="selected"</c:if>>${t.typeName}</option>
                </c:forEach>
            </select>
    <p/>
    <img src="${news.pic}">
    <input name="imgPic" type="hidden" value="${news.pic}">
    新闻图片：<input type="file" name="imgPic">
    <p/>
    <input type="submit" value="修改">
</form>
</body>
</html>

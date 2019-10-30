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
    <title>主页面</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="jquery-2.1.4/jquery.min.js"></script>
    <style type="text/css">
        td {
            border: 1px solid black;
        }
        a {
            text-decoration: none;
        }
    </style>
    <script type="text/javascript">
        function dele() {
            var all = document.getElementById("all").value;
            var ids = document.getElementById("ids").value;
            if (all != null || ids != null) {
                alert("未选中数据")
            } else {
                confirm('是否确定全部删除')
            }
        }
        $(function () {
            var i=0;
            //全选
            $("#all").on("click",function(){
                if(i==0){
                    //把所有复选框选中
                    $("input:checkbox[name=ids]").prop("checked", true);
                    i=1;
                }else{
                    $("input:checkbox[name=ids]").prop("checked", false);
                    i=0;
                }
            });
        });
    </script>
</head>
<body>
<div align="center">
    <%--<p>欢迎${loginUser.name}登录，第
        <c:choose>
            <c:when test="${applicationScope.flag==null}">
                ${applicationScope.flag=1}
            </c:when>
            <c:otherwise>
                ${applicationScope.flag=applicationScope.flag+1}
            </c:otherwise>
        </c:choose>
        次</p>
    <a href="news/outServlet">退出</a>--%>
    <p/>
    <form action="news/show" method="get">
        标题：<input type="text" name="query.title" value="${paging.query.title}">&nbsp;
        发布开始时间：<input type="date" name="query.qStartNewsDate" value="<c:if test="${paging.query.qStartNewsDate!=''}"><fmt:formatDate value='${paging.query.qStartNewsDate}' pattern='yyyy-MM-dd'/></c:if>">&nbsp;
        发布结束时间：<input type="date" name="query.qEndNewsDate" value="<c:if test="${paging.query.qEndNewsDate!=''}"><fmt:formatDate value='${paging.query.qEndNewsDate}' pattern='yyyy-MM-dd'/></c:if>">&nbsp;
        <input type="submit" value="搜索">
    </form>
    <form action="news/delete" method="post" onsubmit="return confirm('是否确定全部删除')">
        <table style="border: 1px solid black">
            <tr>
                <td><input type="checkbox" id="all">全选</td>
                <td>id</td>
                <td>新闻编号</td>
                <td>新闻标题</td>
                <td>新闻内容</td>
                <td>新闻作者</td>
                <td>发布时间</td>
                <td>新闻类型</td>
                <td>新闻图片</td>
                <c:if test="${loginUser.role.name!='学生'}">
                    <td>删除</td>
                    <td>修改</td>
                </c:if>
            </tr>

            <c:forEach items="${news}" var="n">
                <tr>
                    <td><input type="checkbox" name="ids" value="${n.id}"></td>
                    <td>${n.id}
                    </td>
                    <td>${n.newsId}
                    </td>
                    <td>${n.title}
                    </td>
                    <td>${n.context}
                    </td>
                    <td>${n.newsMan}
                    </td>
                    <td>
                        <c:if test="${n.newsDate!=''}">
                            <fmt:formatDate value="${n.newsDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                        </c:if>
                    </td>
                    <td>${n.typeId}
                    </td>
                    <td>
                        <img src="${n.pic}">
                    </td>
                    <c:if test="${loginUser.role.name!='学生'}">
                        <td><a href="news/delete?ids=${n.id}" onclick="return confirm('是否确定删除？')">删除</a></td>
                        <td><a href="news/toUpdate?id=${n.id}">修改</a></td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
        <p/>
        <c:if test="${loginUser.role.name!='学生'}">
            <input type="submit" value="全部删除">
        </c:if>
        <%--
            此页面有basePath，所以在跳转到其他jsp页面时不用给该页面返回上一层
            basePath表示项目根路径(一直到项目名)所以后面直接加上jsp页面名称
        --%>
        <%--<a href="news/toAdd"><input type="button" value="添加新闻信息"></a>--%>
    </form>
    <c:url var="url" value="news/show">
        <c:param name="query.title" value="${paging.query.title}"></c:param>
        <c:param name="query.qStartNewsDate"><c:if test="${paging.query.qStartNewsDate!=''}"><fmt:formatDate value='${paging.query.qStartNewsDate}' pattern='yyyy-MM-dd'/></c:if></c:param>
        <c:param name="query.qEndNewsDate"><c:if test="${paging.query.qEndNewsDate!=''}"><fmt:formatDate value='${paging.query.qEndNewsDate}' pattern='yyyy-MM-dd'/></c:if></c:param>
    </c:url>

    <a href="${url}&page=1">首页</a>
    <c:choose>
        <c:when test="${paging.page>1}">
            <a href="${url}&page=${paging.page-1}">上一页</a>
            &nbsp;
        </c:when>
        <c:otherwise>
            上一页&nbsp;
        </c:otherwise>
    </c:choose>

    <c:forEach begin="1" end="${paging.pageSum}" var="i">
        <a href="${url}&page=${i}">${i}</a>
        &nbsp;
    </c:forEach>

    <c:choose>
        <c:when test="${paging.page<paging.pageSum}">
            <a href="${url}&page=${paging.page+1}">下一页</a>
            &nbsp;
        </c:when>
        <c:otherwise>
            下一页
        </c:otherwise>
    </c:choose>
    <a href="${url}&page=${paging.pageSum}">尾页</a>
    &nbsp;总页数&nbsp;${paging.pageSum}
    &nbsp;当前第${paging.page}页
    一共查询出${paging.stripSum}条数据
</div>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title></title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="jquery-2.1.4/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                url:"news/showJson",
                type:"post",
                dataType:"json",
                data:{"page":1,"query.title":"深圳新闻"},
                success:(function (data) {
                    for (var i = 0; i<data.length;i++) {
                        var tr = "<tr> <td><input type=\"checkbox\">全选</td>"
                            tr += "<td>"+data[i].id+"</td>"
                            tr += "<td>"+data[i].newsId+"</td>"
                            tr += "<td>"+data[i].title+"</td>"
                            tr += "<td>"+data[i].context+"</td>"
                            tr += "<td>"+data[i].newsMan+"</td>"
                            tr += "<td>"+data[i].newsDate+"</td>"
                            tr += "<td>"+data[i].typeId+"</td>"
                            tr += "<td>"+data[i].pic+"</td>"
                        tr += "</tr>"
                        $("#t").append(tr)
                    }
                }),
                error:(function () {
                    alert("失败......")
                })
            });
        });
    </script>
    <style type="text/css">
        td {
            border: 1px solid black;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<table style="border: 1px solid black" id="t">
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
        <td>删除</td>
        <td>修改</td>
    </tr>
</table>
</body>
</html>

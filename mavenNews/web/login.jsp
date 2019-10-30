<%@ page language="java" import="java.net.URLDecoder" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>登录</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<script type="text/javascript" src="jquery-2.1.4/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#name").blur(function () {
            var name = $("#name").val();
            if (name != null && name != "") {
                $.ajax({
                    url:"user/loginJson",
                    type:"post",
                    dataType:"json",
                    data:{"name":$("#name").val()},
                    success:function (data) {
                        if (data.loginFlag){
                            $("#loginNameSpan").html("用户名不存在,请先注册").css({"color":"red","font-size":"5px"});
                        }else {
                            $("#loginNameSpan").html("用户名存在,可以登录").css({"color":"green","font-size":"5px"});
                        }
                    },
                    error: function () {
                        $("#loginNameSpan").html("用户名不存在,请先注册").css({"color":"red","font-size":"5px"});
                    }
                });
            }
        });
    });
</script>
<body>

<form id="f" action="user/login" method="post">
    <%-- 拼在URL后面的数据以及表单数据，需要加param才能获取到 --%>
    <p style="font-size: 2px; color: red">${param.error}</p>
    用户名：<input type="text" name="name" id="name" value="${URLDecoder.decode(cookie.cName.value,"utf-8")}"/><span id="loginNameSpan"></span><br/>
    密&nbsp;&nbsp;码：<input type="password" name="pwd" id="pwd" value="${cookie.cPwd.value}"/><br/>
    <input type="checkbox" name="isNo" value="yes">十天内免登录<br/>
    <input type="submit" value="登录">
</form>
还未注册？<a href="register.jsp"><button>注册</button></a>
</body>
</html>

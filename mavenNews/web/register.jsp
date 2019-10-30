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
</head>
<script type="text/javascript" src="jquery-2.1.4/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        var nameFlag = false;
        var pwdFlag = false;
        var repeatPassFlag = false;
        $("#name").blur(function () {
            //ajax中写的是json格式的数据
            var name = $("#name").val();
            if (name != null && name != "") {
                $.ajax({
                    //url:ajax发送的请求到哪个地方
                    url: "news/registerAjaxServlet",
                    //请求方式
                    type: "post",
                    //服务器需要返回的数据类型
                    dataType: "json",
                    //需要发送的数据
                    data: {"name": $("#name").val()},
                    //响应成功后的回调函数,data(可以是任何字母除关键字,跟上面的data没有任何关系)
                    // 此参数用来接收后台传过来的数据
                    success: function (data) {
                        if (data.registerFlag) {
                            /**
                             * 验证用户名
                             */
                            $("#name").on({
                                "focus": function () {
                                    nameFlag = false;
                                    $("#nameSpan").html("用户名必须是6-8位并且只能是数字和大小写字母!").css({"color": "red","font-size": "5px"});
                                },
                                "blur": function () {
                                    //获取当前失去焦点框的值
                                    var val = $(this).val();
                                    var reg = /^[a-zA-Z0-9]{6,8}$/;
                                    if (reg.test(val)) {
                                        $("#nameSpan").html("此用户名可用!").css({"color": "green", "font-size": "5px"});
                                        nameFlag = true;
                                    }
                                }
                            });
                            // $("#nameSpan").html("此用户名可用").css({"color": "green", "font-size": "5"});
                        } else {
                            nameFlag = false;
                            $("#nameSpan").html("此用户名不可用").css({"color": "red", "font-size": "5"});
                        }
                    },
                    error: function () {
                        alert("响应失败！");
                    }
                });
            } else {
                nameFlag = false;
                $("#nameSpan").html("用户名不能为空").css({"color": "red", "font-size": "5"});
            }

        });
        /**
         * 对用户名密码进行表单验证
         */
        $("#name").on({
            "focus": function () {
                nameFlag = false;
                $("#nameSpan").html("用户名必须是6-8位并且只能是数字和大小写字母!").css({"color": "red", "font-size": "5px"});
            },
            "blur": function () {
                //获取当前失去焦点框的值
                var val = $(this).val();
                var reg = /^[a-zA-Z0-9]{6,8}$/;
                if (reg.test(val)) {
                    $("#nameSpan").html("此用户名可用!").css({"color": "green", "font-size": "5px"});
                    nameFlag = true;
                }
            }
        });

        /**
         * 验证密码
         */
        $("#pwd").on({
            "focus": function () {
                pwdFlag = false;
                $("#pwdSpan").html("密码只能是6-18位以大小写字母开头包含数字字母下划线!").css({"color": "red", "font-size": "5px"});
            },
            "blur": function () {
                var passVal = $(this).val();
                //只能是6-18位以大小写字母开头包含数字字母下划线
                var reg = /^[a-zA-Z]\w{5,17}$/;
                // var reg = /^[a-zA-Z0-9]{6,8}$/
                if (reg.test(passVal)) {
                    $("#pwdSpan").html("验证通过!").css({"color": "green", "font-size": "5px"});
                    pwdFlag = true;
                }
            }
        });
        /**
         * 验证重复密码
         */
        $("#repeatPass").on({
            "focus": function () {
                repeatPassFlag = false;
                $("#repeatPassSpan").html("重复密码必须与密码一致!").css({"color": "red", "font-size": "5px"});
            },
            "blur": function () {
                var pwd = $("#pwd").val();
                var repeatPass = $(this).val();
                if (pwd == repeatPass && repeatPass != null && repeatPass != "") {
                    $("#repeatPassSpan").html("密码一致!").css({"color": "green", "font-size": "5px"});
                    repeatPassFlag = true;
                } else {
                    repeatPassFlag = false;
                    $("#repeatPassSpan").html("密码不一致,请重新输入!").css({"color": "red", "font-size": "5px"});
                }
            }
        });
        $("#sub").click(function () {
            if (nameFlag && pwdFlag && repeatPassFlag){
                $("#f").submit();
            }else {
                $("#sub").attr("disabled",true);
            }
        });
    });
</script>
<body>
<%--点击注册按钮调到servlet页面去处理用户填写的数据--%>
<form action="news/registerServlet" method="post" id="f">
    &nbsp;&nbsp;&nbsp;用户名：<input type="text" name="name" id="name"><span id="nameSpan"></span><br/>
    &nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码：<input type="password" name="pwd" id="pwd"><span id="pwdSpan"></span><br/>
    重复密码：<input type="password" name="repeatPass" id="repeatPass"/><span id="repeatPassSpan"></span><br/>
    <input type="submit" value="注册" id="sub">
    <input type="reset" value="重置">
</form>
</body>
</html>

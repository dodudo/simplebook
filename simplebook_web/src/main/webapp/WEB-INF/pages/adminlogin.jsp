<%--
  Created by IntelliJ IDEA.
  User: Administream
  Date: 2019/9/14
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html  class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <!--bootstrap.min.css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <!--bootstrap.min.js-->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">管理登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post" action="/admin/login" class="layui-form" >
        <input name="aname" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="apassword" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
    </form>
</div>
<div class="modal fade bs-example-modal-sm1" style="box-shadow: none;" id="loginInfo" tabindex="-1"  role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" style="width: 200px;height: 50px" role="document">
        <div class="modal-content" style="text-align: center;padding: 20px">
            <p style="color: red;">${requestScope.get("admin-login-err")}</p>
        </div>
    </div>
</div>
<script>

    if ("${requestScope.get("admin-login-err")}".trim() != ""){
        $("#loginInfo").modal("show");
        $(".modal-backdrop").remove();
        setTimeout('$("#loginInfo").modal("hide");',1500);
    }else {
        $("#loginInfo").modal("hide");
    }
</script>
<!-- 底部结束 -->

</body>
</html>
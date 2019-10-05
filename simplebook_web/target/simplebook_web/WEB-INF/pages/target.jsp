<%--
  Created by IntelliJ IDEA.
  User: do
  Date: 2019/9/20
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册成功！</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
</head>
<body onload="target()">
<div class="layui-container">
    <div class="fly-panel">
        <div class="fly-none">
            <h2><i class="layui-icon layui-icon-loading"></i></h2>
            <p>恭喜您注册成功，<b id="ss">5</b>秒后跳转到<a href="/login"> 登录页面 </a></p>
        </div>
    </div>
</div>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);


    })();
function target() {
    var ss = document.getElementById("ss");
    var time = setInterval(function () {
        ss.innerHTML=parseInt(ss.innerHTML)-1;
        if (parseInt(ss.innerHTML)==0){
            clearInterval(time);
            window.location="/login";
        }
    },1000)
}
</script>
</body>
</html>
</html>

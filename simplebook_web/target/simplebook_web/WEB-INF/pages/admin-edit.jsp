<%--
  Created by IntelliJ IDEA.
  User: Administream
  Date: 2019/9/11
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form" id="admin_info">
            <input type="text" style="display: none;" name="adminId" value="${requestScope.beChangeAdmin.adminId}">
            <div class="layui-form-item">
                <label for="aname" class="layui-form-label">
                    <span class="x-red">*</span>登录名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="aname" value="${requestScope.beChangeAdmin.aname}" name="aname"
                           lay-verify="aname"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>将会成为您唯一的登入名
                </div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>手机
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" value="${requestScope.beChangeAdmin.phone}" name="phone"
                           lay-verify="phone"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="email" class="layui-form-label">
                    <span class="x-red">*</span>邮箱
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="email" value="${requestScope.beChangeAdmin.email}" name="email"
                           lay-verify="email"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>角色</label>
                <div class="layui-input-inline">
                    <select id="role" name="role" lay-verify="required">
                        <option value=""></option>
                        <option value="0">普通管理员</option>
                        <option value="1">超级管理员</option>
                    </select>
                </div>
            </div>
            <%--<div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">
                    <span class="x-red">*</span>旧密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_pass" name="pass" required="" lay-verify="pass"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    6到16个字符
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_newpass" class="layui-form-label">
                    <span class="x-red">*</span>新密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_newpass" name="apassword" required="" lay-verify="newpass"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    6到16个字符
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>确认密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>
            </div>--%>
            <div class="layui-form-item">
                <label class="layui-form-label">
                </label>
                <button  class="layui-btn" lay-filter="add" lay-submit="">
                    修改
                </button>
            </div>
        </form>
    </div>
</div>
<script>

    layui.use(['form', 'layer'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            aname: function (value) {
                if (value.length < 4) {
                    return '昵称至少得4个字符啊';
                } else {
                    //判断用户是否修改了文本框的值
                    if (value == '${requestScope.beChangeAdmin.aname}') {

                    } else {
                        var flag = true;
                        $.ajax({
                            url: "/admin/checkAname",
                            type: "get",
                            async: false,
                            data: {"aname": $("#aname").val().trim()},
                            success: function (data) {
                                if (data.hadAname) {
                                    flag = false;
                                } else {
                                    flag = true;
                                }
                            },
                            error: function () {
                            }
                        });
                        if (!flag) {
                            return '此昵称已存在!'
                        }
                    }
                }

            },
            phone: function (value) {
                var phone = $("#phone").val().trim();
                if (phone == '') {

                } else {
                    if (/^1\d{10}$/.test(phone) == false) {
                        return '手机号码不正确';
                    }
                }
            },
            email: function (value) {
                if ($("#email").val().trim() == '') {

                } else {
                    if (/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/.test($('#email').val().trim()) == false) {
                        return 'Email格式不正确';
                    }
                }
            }
            /* pass: function(value){
                 if (value != '') {
                     return '旧密码不正确';
                 }
             },
             newpass: function (value) {
                 if ($('#L_newpass').val().trim() == ''){

                 } else {
                     if (/(.+){6,12}$/.test($('#L_newpass').val().trim())==false) {
                         return '密码必须6到12位';
                     }
                 }
             },
             repass: function(value) {
                 if ($('#L_newpass').val().trim() != $('#L_repass').val()) {
                     return '两次密码不一致';
                 }
             }*/
        });

        //监听提交
        form.on('submit(add)',
            function(data) {
                //发异步，把数据提交
                var flag = false;
                $.ajax({
                    url: "admin/updateById",
                    type: "post",
                    data: $("#admin_info").serialize(),
                    async: false,
                    success: function (data) {
                        if (data.msg == true) {
                            layer.alert("修改成功", {
                                    icon: 6
                                },
                                function () {
                                    //关闭当前frame
                                    xadmin.close();

                                    // 可以对父窗口进行刷新
                                    xadmin.father_reload();
                                });
                            flag = false;
                        } else {
                            layer.alert("修改失败", {
                                    icon: 5
                                },
                                function () {
                                    //关闭当前frame
                                    xadmin.close();

                                    // 可以对父窗口进行刷新
                                    xadmin.father_reload();
                                });
                            flag = false;
                        }
                    },
                    error: function () {
                        layer.alert("修改失败", {
                                icon: 5
                            },
                            function () {
                                //关闭当前frame
                                xadmin.close();

                                // 可以对父窗口进行刷新
                                xadmin.father_reload();
                            });
                        flag = false;
                    }
                });
                return flag;
            });

    });

</script>
<script>
    <%--console.log("${sessionScope.admin}");--%>
    // 遍历select
    $("#role").each(function () {
        // this代表的是<option></option>，对option再进行遍历
        $(this).children("option").each(function () {
            // 判断需要对那个选项进行回显
            if (this.value == '${requestScope.beChangeAdmin.role}') {
                // console.log($(this).text());
                // 进行回显
                $(this).attr("selected", "selected");
            }
        });
    })
    if ('${sessionScope.admin.role}' != '1') {
        $("#role").attr("disabled", "disabled");
        form.render('select');
    }
</script>
</body>

</html>



<%--
  Created by IntelliJ IDEA.
  User: Administream
  Date: 2019/9/14
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>会员列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.sPage.green.css">

    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="uname" id="member_key" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <label class="layui-btn"  lay-submit="" onclick="findArticleByKey()" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></label>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量恢复</button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                            </th>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>手机</th>
                            <th>邮箱</th>
                            <th>状态</th>
                            <th>操作</th></tr>
                        </thead>
                        <tbody id="member-tbd">

                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div id="memberpage">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.sPage.js"></script>
<script>

    $(function () {
        sendFindUsers(1,"");
    });
    function sendFindUsers(pageNum,key){
        $.ajax({
            url: "/user/findUsers",
            type:"get",
            data:{"pageNum":pageNum,"state":0,"key":key},
            success:function (data) {
                var usersPageInfo = data.usersPageInfo;
                var showList = "";
                var index;
                for (index in usersPageInfo.list){
                    showList += ("<tr>\n" +
                        "                                <td>\n" +
                        "                                    <input type=\"checkbox\" name=\"id\" value="+usersPageInfo.list[index].uid+"   lay-skin=\"primary\">\n" +
                        "                                </td>\n" +
                        "                                <td>"+usersPageInfo.list[index].uid+"</td>\n" +
                        "                                <td>"+usersPageInfo.list[index].uname+"</td>\n" +
                        "                                <td>"+usersPageInfo.list[index].sex+"</td>\n" +
                        "                                <td>"+usersPageInfo.list[index].phone+"</td>\n" +
                        "                                <td>"+usersPageInfo.list[index].email+"</td>\n" +
                        "                                <td class=\"td-status\">\n" +
                        "                                    <span class=\"layui-btn layui-btn-normal layui-btn-mini\">"+usersPageInfo.list[index].userStateStr+"</span></td>\n" +
                        "                                <td class=\"td-manage\">\n" +
                        "                                    <a title=\"恢复\" onclick=\"member_del(this,'"+usersPageInfo.list[index].uid+"')\" href=\"javascript:;\">\n" +
                        "                                        <i class=\"layui-icon\">&#xe669;</i>\n" +
                        "                                    </a>\n" +
                        "                                </td>\n" +
                        "                            </tr>");
                }
                $("#member-tbd").html(showList);
                $("#memberpage").sPage({
                    page:usersPageInfo.pageNum,//当前页码，必填
                    total:usersPageInfo.total,//数据总条数，必填
                    pageSize:10,//每页显示多少条数据，默认10条
                    totalTxt:"共"+usersPageInfo.total+"条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
                    showTotal:true,//是否显示总条数，默认关闭：false
                    showSkip:false,//是否显示跳页，默认关闭：false
                    showPN:true,//是否显示上下翻页，默认开启：true
                    prevPage:"上一页",//上翻页文字描述，默认“上一页”
                    nextPage:"下一页",//下翻页文字描述，默认“下一页”
                    backFun:function(page){
                        //点击分页按钮回调函数，返回当前页码
                        sendFindUsers(page,key);
                    }
                });
            }
        });
    }
    layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;


        // 监听全选
        form.on('checkbox(checkall)', function(data){

            if(data.elem.checked){
                $('tbody input').prop('checked',true);
            }else{
                $('tbody input').prop('checked',false);
            }
            form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用/启用吗？',function(index){
            var flag = 1;
            if($(obj).attr('title')=='1'){
                flag = 2;
            }else{
                flag = 1;
            }
            //发异步把用户状态进行更改
            $.ajax({
                url:"/user/changeUserState",
                type: "get",
                data: {"uid":id,"state":flag},
                success:function (data) {
                    if (data.msg) {
                        if (flag == 1){
                            $(obj).attr('title','1')
                            $(obj).find('i').html('&#xe601;');
                            $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                            layer.msg('已启用!',{icon: 6,time:1000});
                        } else if (flag == 2) {
                            $(obj).attr('title','2')
                            $(obj).find('i').html('&#xe62f;');
                            $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                            layer.msg('已停用!',{icon: 5,time:1000});
                        }
                    }else {
                        layer.msg('修改失败!',{icon: 5,time:1000});
                    }
                }
            });
            return;
        });
    }

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要恢复吗？',function(index){
            //发异步删除数据
            $.ajax({
                url:"/user/changeUserState",
                type: "get",
                data: {"uid":id,"state":1},
                success:function () {

                }
            });
            $(obj).parents("tr").remove();
            layer.msg('已恢复!',{icon:1,time:1000});
        });
    }



    function delAll (argument) {
        var ids = [];

        // 获取选中的id
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要恢复吗？',function(index){
            //捉到所有被选中的，发异步进行删除
            $.ajax({
                url:"/user/changeUserState",
                type: "get",
                data: {"uid":ids.toString(),"state":1},
                success:function () {
                }
            });
            layer.msg('恢复成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
    function findArticleByKey() {
        var articleKey = $("#member_key").val();
        if (articleKey!=""){
            sendFindUsers(0,articleKey)
        }
    }
</script>
</html>

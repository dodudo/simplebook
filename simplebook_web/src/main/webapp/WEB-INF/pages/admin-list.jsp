<%--
  Created by IntelliJ IDEA.
  User: Administream
  Date: 2019/9/11
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path;
%>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>管理员管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.sPage.green.css">
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
                            <input type="text" name="aname" id="search_input" placeholder="请输入关键字" autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <label class="layui-btn" onclick="findAdminByKey()" lay-submit="" lay-filter="sreach"><i
                                    class="layui-icon">&#xe615;</i></label>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                    <button class="layui-btn" onclick="xadmin.open('添加用户','${pageContext.request.contextPath}/admin-add',600,400)"><i class="layui-icon"></i>添加</button>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" lay-filter="checkall" name=""  lay-skin="primary">
                            </th>
                            <th>ID</th>
                            <th>登录名</th>
                            <th>手机</th>
                            <th>邮箱</th>
                            <th>状态</th>
                            <th>身份</th>
                            <th>操作</th>
                        </thead>
                        <tbody class="admin-tbody">
                        <tr>
                            <td>
                                <input type="checkbox" name=""  lay-skin="primary">
                            </td>
                            <td>1</td>
                            <td>admin</td>
                            <td>18925139194</td>
                            <td>113664000@qq.com</td>
                            <td data-field="sex" data-key="1-0-4" data-content="女" class="">
                                <div class="layui-table-cell laytable-cell-1-0-4">
                                    <!-- 这里的checked的状态只是演示 -->
                                    <input type="checkbox" name="sex" value="10004" lay-skin="switch" lay-text="女|男" lay-filter="sexDemo">
                                    <div class="layui-unselect layui-form-switch" lay-skin="_switch">
                                        <em>男</em><i></i>
                                    </div>
                                </div>
                            </td>
                            <td class="td-status">
                                <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
                            <td class="td-manage">
                            <td class="td-status">
                                <span class="layui-btn layui-btn-normal layui-btn-mini">hhh</span></td>
                            <td class="td-manage">
                                <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
                                    <i class="layui-icon">&#xe601;</i>
                                </a>
                                <a title="编辑"  onclick="xadmin.open('编辑','adminEdit')" href="javascript:;">
                                    <i class="layui-icon">&#xe642;</i>
                                </a>
                                <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                                    <i class="layui-icon">&#xe640;</i>
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div id="adminPage">

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
        sendFindAllAdmin(1);
    });
    function sendFindAllAdmin(pageNum){
        $.ajax({
            url:"/admin/findAll",
            type:"get",
            data:{"pageNum":pageNum},
            success:function (data) {
                var adminsPageInfo = data.adminsPageInfo;
                var showList = "";
                var index;
                for (index in adminsPageInfo.list){
                    showList += ("<tr>\n" +
                        "                            <td>\n" +
                        "                                <input class='row-check' type=\"checkbox\" name='id' value = '" + adminsPageInfo.list[index].adminId + "' lay-skin=\"primary\">\n" +
                        "                            </td>\n" +
                        "                            <td>"+adminsPageInfo.list[index].adminId+"</td>\n" +
                        "                            <td>"+adminsPageInfo.list[index].aname+"</td>\n" +
                        "                            <td>"+adminsPageInfo.list[index].phone+"</td>\n" +
                        "                            <td>"+adminsPageInfo.list[index].email+"</td>\n" +
                        "                            <td data-field=\"state\" data-key=\"1-0-4\" data-content=\"已启用\" class=\"\"><form class='layui-form'>\n" +
                        "                                <div   class=\"layui-table-cell laytable-cell-1-0-4\"> \n" +
                        "                                    <input type='checkbox' name='state'  lay-skin='switch' " +
                        (adminsPageInfo.list[index].state==1 ? 'checked' : '') + " id='"+adminsPageInfo.list[index].adminId+"'  value = '"+adminsPageInfo.list[index].state+"' lay-text=\"已启用|已停用\" lay-filter=\"state\">\n" +
                        "                                </div></form>\n" +
                        "                            </td>" +
                        "                            <td class=\"td-status\">\n" +
                        "                                <span class=\"layui-btn layui-btn-normal layui-btn-mini\">"+adminsPageInfo.list[index].roleStr+"</span>" +
                        "                            </td>\n" +
                        "                            <td class=\"td-manage\">\n" +
                        "                                <a title=\"编辑\"  onclick=\"xadmin.open('编辑','adminEdit?aid="+adminsPageInfo.list[index].adminId+"')\" href=\"javascript:;\">\n" +
                        "                                    <i class=\"layui-icon\">&#xe642;</i>\n" +
                        "                                </a>\n" +
                        "                                <a title=\"删除\" onclick=\"member_del(this,'"+adminsPageInfo.list[index].adminId+"')\" href=\"javascript:;\">\n" +
                        "                                    <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "                                </a>\n" +
                        "                            </td>\n" +
                        "                        </tr>");

                }
                $(".admin-tbody").html(showList);
                $("#adminPage").sPage({
                    page:adminsPageInfo.pageNum,//当前页码，必填
                    total:adminsPageInfo.total,//数据总条数，必填
                    pageSize:10,//每页显示多少条数据，默认10条
                    totalTxt:"共"+adminsPageInfo.total+"条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
                    showTotal:true,//是否显示总条数，默认关闭：false
                    showSkip:false,//是否显示跳页，默认关闭：false
                    showPN:true,//是否显示上下翻页，默认开启：true
                    prevPage:"上一页",//上翻页文字描述，默认“上一页”
                    nextPage:"下一页",//下翻页文字描述，默认“下一页”
                    backFun:function(page){
                        //点击分页按钮回调函数，返回当前页码
                        sendFindAllAdmin(page);
                    }
                });
            }
        });
    }
    layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var form = layui.form;
        // 监听全选
        form.on('checkbox(checkall)', function(data){

            if(data.elem.checked){
                $('tbody .row-check').prop('checked',true);
            }else{
                $('tbody .row-check').prop('checked',false);
            }
            form.render('checkbox');
        });
        form.on('switch(state)',function (data) {
            if ('${sessionScope.get("admin").role}'!=1){
                layer.msg('权限不足!',{icon: 5,time:1000});
                console.log(flag);
                var flag=data.elem.checked;
                data.elem.checked = !flag;
                form.render("checkbox");
            }else {
                layer.confirm('确认要停用/启用吗？',function(index){
                    var flag = 1;
                    console.log(data);
                    if(data.value=='1'){
                        //发异步把用户状态进行更改
                        var flag = 2;
                        data.elem.attributes['value'].nodeValue=2;
                        layer.msg('已停用!',{icon: 5,time:1000});
                    }else{
                        flag = 1;
                        data.elem.attributes['value'].nodeValue=1;
                        layer.msg('已启用!',{icon: 6,time:1000});
                    }
                    form.render();
                    $.ajax({
                        url:"/admin/changeState",
                        type: "get",
                        data: {"aid":data.elem.attributes['id'].nodeValue,"state":flag},
                        success:function (data) {
                            if (data.role_msg == true){

                            } else {
                                layer.msg('权限不足!',{icon: 5,time:1000});
                            }
                        }
                    });
                    return;
                },function () {
                    var flag=data.elem.checked;
                    data.elem.checked = !flag;
                    form.render("checkbox");
                });
            }

        })
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
            console.log($(obj).children('input'))
            var flag = 1;
            if($(obj).val()=='1'){

                //发异步把用户状态进行更改
                $(obj).val('2');
                var flag = 2;
                $(obj).find('input').attr("checked",true)
                layer.msg('已停用!',{icon: 5,time:1000});

            }else{
                $(obj).val('1')
                flag = 1;
                $(obj).find('input').attr("checked",false)
                layer.msg('已启用!',{icon: 6,time:1000});
            }
           /* $.ajax({
                url:"/admin/changeArticleState",
                type: "get",
                data: {"articleId":id,"state":flag},
                success:function (data) {
                    if (data.msg == true){

                    } else {

                    }
                }
            });
*/
        });
    }

    /*用户-删除*/
    function member_del(obj,id){
        if ('${sessionScope.admin.role}' == '1') {
            layer.confirm('确认要删除吗？', function (index) {
                //发异步删除数据
                $.ajax({
                    url: "/admin/changeState",
                    type: "get",
                    data: {"aid": id, "state": 0},
                    success: function (data) {
                        if (data.msg == true) {
                            $(obj).parents("tr").remove();
                            layer.msg('已删除!', {icon: 1, time: 1000});
                        } else {
                            layer.msg('删除失败!', {icon: 5, time: 1000});
                        }
                    },
                    error: function () {
                        layer.msg('删除失败!', {icon: 5, time: 1000});
                    }
                });

            });
        } else {
            layer.msg('权限不足!', {icon: 5, time: 1000});
        }

    }



    function delAll (argument) {

        if ('${sessionScope.admin.role}' == '1') {
            var ids = [];

            // 获取选中的id
            $('tbody .row-check').each(function (index, el) {
                if ($(this).prop('checked')) {
                    ids.push($(this).val())
                }
            });
            layer.confirm('确认要删除吗？' + ids, function (index) {
                //捉到所有被选中的，发异步进行删除
                $.ajax({
                    url: "/admin/changeState",
                    type: "get",
                    data: {"aid": ids.toString(), "state": 0},
                    success: function (data) {
                        if (data.msg == true) {
                            layer.msg('删除成功', {icon: 1});
                            $(".layui-form-checked").not('.header').parents('tr').remove();
                        } else {
                            layer.msg('删除失败', {icon: 5});
                        }
                    },
                    error: function () {
                        layer.msg('删除失败', {icon: 5});
                    }
                });

            });
        } else {
            layer.msg('权限不足', {icon: 5});
        }
    }

    function findAdminByKey() {
        var key = $("#search_input").val();

        if (key != '') {
            sendFindByKey(1, key);
        }
    }

    function sendFindByKey(pageNum, key) {
        $.ajax({
            url: "/admin/findByKey",
            type: "get",
            data: {"pageNum": pageNum, "key": key},
            success: function (data) {
                var adminsPageInfo = data.adminsPageInfo;
                var showList = "";
                var index;
                for (index in adminsPageInfo.list) {
                    showList += ("<tr>\n" +
                        "                            <td>\n" +
                        "                                <input class='row-check' type=\"checkbox\" name='id' value = '" + adminsPageInfo.list[index].adminId + "' lay-skin=\"primary\">\n" +
                        "                            </td>\n" +
                        "                            <td>" + adminsPageInfo.list[index].adminId + "</td>\n" +
                        "                            <td>" + adminsPageInfo.list[index].aname + "</td>\n" +
                        "                            <td>" + adminsPageInfo.list[index].phone + "</td>\n" +
                        "                            <td>" + adminsPageInfo.list[index].email + "</td>\n" +
                        "                            <td data-field=\"state\" data-key=\"1-0-4\" data-content=\"已启用\" class=\"\"><form class='layui-form'>\n" +
                        "                                <div   class=\"layui-table-cell laytable-cell-1-0-4\"> \n" +
                        "                                    <input type='checkbox' name='state'  lay-skin='switch' " +
                        (adminsPageInfo.list[index].state == 1 ? 'checked' : '') + " id='" + adminsPageInfo.list[index].adminId + "'  value = '" + adminsPageInfo.list[index].state + "' lay-text=\"已启用|已停用\" lay-filter=\"state\">\n" +
                        "                                </div></form>\n" +
                        "                            </td>" +
                        "                            <td class=\"td-status\">\n" +
                        "                                <span class=\"layui-btn layui-btn-normal layui-btn-mini\">" + adminsPageInfo.list[index].roleStr + "</span>" +
                        "                            </td>\n" +
                        "                            <td class=\"td-manage\">\n" +
                        "                                <a title=\"编辑\"  onclick=\"xadmin.open('编辑','adminEdit?aid=" + adminsPageInfo.list[index].adminId + "')\" href=\"javascript:;\">\n" +
                        "                                    <i class=\"layui-icon\">&#xe642;</i>\n" +
                        "                                </a>\n" +
                        "                                <a title=\"删除\" onclick=\"member_del(this,'" + adminsPageInfo.list[index].adminId + "')\" href=\"javascript:;\">\n" +
                        "                                    <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "                                </a>\n" +
                        "                            </td>\n" +
                        "                        </tr>");

                }
                $(".admin-tbody").html(showList);
                $("#adminPage").sPage({
                    page: adminsPageInfo.pageNum,//当前页码，必填
                    total: adminsPageInfo.total,//数据总条数，必填
                    pageSize: 10,//每页显示多少条数据，默认10条
                    totalTxt: "共" + adminsPageInfo.total + "条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
                    showTotal: true,//是否显示总条数，默认关闭：false
                    showSkip: false,//是否显示跳页，默认关闭：false
                    showPN: true,//是否显示上下翻页，默认开启：true
                    prevPage: "上一页",//上翻页文字描述，默认“上一页”
                    nextPage: "下一页",//下翻页文字描述，默认“下一页”
                    backFun: function (page) {
                        //点击分页按钮回调函数，返回当前页码
                        sendFindAllAdmin(page, key);
                    }
                });
            }
        });
    }
</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</html>

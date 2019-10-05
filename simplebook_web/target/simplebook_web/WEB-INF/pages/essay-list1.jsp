<%--
  Created by IntelliJ IDEA.
  User: Administream
  Date: 2019/9/11
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.sPage.green.css">
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
</head>

<body>
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
                    <form class="layui-form layui-col-space5" id="search_form">
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="username" id="article_key"  placeholder="请输入文章关键字" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <label id="search_btn" onclick="findArticleByKey()" class="layui-btn" ><i class="layui-icon">&#xe615;</i></label>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                            </th>
                            <th>文章id</th>
                            <th>文章标题</th>
                            <th>文章描述</th>
                            <th>文章发布日期</th>
                            <th>文章字数</th>
                            <th>文章浏览量</th>
                            <th>文章点赞数</th>
                            <th>文章举报量</th>
                            <th>文章状态</th>
                            <th>操作</th>
                            <%--<th>文章分类</th>--%>
                            <%--<th>文章</th>--%></tr>
                        </thead>
                        <tbody class="article-tbody">

                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div id="articlePage">
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
        sendFindAllArticle(1);
    });
    function sendFindAllArticle(pageNum){
        $.ajax({
            url:"/article/findRiskArticles",
            type:"get",
            data:{"pageNum":pageNum},
            success:function (data) {
                var articlesPageInfo = data.articlesPageInfo;
                var showList = "";
                var index;
                for (index in articlesPageInfo.list){
                    var releaseDate = articlesPageInfo.list[index].releaseDate;
                    var releaseFormat = new Date(releaseDate);
                    releaseFormat = releaseFormat.getFullYear()+"-"+(releaseFormat.getMonth()+1)+"-"+releaseFormat.getDate()
                    showList += ("<tr>\n" +
                        "                                <td>\n" +
                        "                                    <input type=\"checkbox\" name=\"id\" value="+articlesPageInfo.list[index].articleId+"   lay-skin=\"primary\">\n" +
                        "                                </td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].articleId+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].head+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].describe+"</td>\n" +
                        "                                <td>"+releaseFormat+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].fontCount+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].view+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].good+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].report+"</td>\n" +
                        "                                <td class=\"td-status\">\n" +
                        "                                    <span class=\"layui-btn layui-btn-normal layui-btn-mini\">"+articlesPageInfo.list[index].articleStateStr+"</span></td>\n" +
                        "                                <td class=\"td-manage\">\n" +
                        "                                    <a onclick=\"member_stop(this,'"+articlesPageInfo.list[index].articleId+"')\" href=\"javascript:;\"  title='"+articlesPageInfo.list[index].articleState+"'>\n" +
                        "                                        <i class=\"layui-icon\">&#xe601;</i>\n" +
                        "                                    </a>\n" +
                        "                                    <a title=\"删除\" onclick=\"member_del(this,'"+articlesPageInfo.list[index].articleId+"')\" href=\"javascript:;\">\n" +
                        "                                        <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "                                    </a>\n" +
                        "                                </td>\n" +
                        "                            </tr>");
                }
                $(".article-tbody").html(showList);
                $("#articlePage").sPage({
                    page:articlesPageInfo.pageNum,//当前页码，必填
                    total:articlesPageInfo.total,//数据总条数，必填
                    pageSize:10,//每页显示多少条数据，默认10条
                    totalTxt:"共"+articlesPageInfo.total+"条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
                    showTotal:true,//是否显示总条数，默认关闭：false
                    showSkip:false,//是否显示跳页，默认关闭：false
                    showPN:true,//是否显示上下翻页，默认开启：true
                    prevPage:"上一页",//上翻页文字描述，默认“上一页”
                    nextPage:"下一页",//下翻页文字描述，默认“下一页”
                    backFun:function(page){
                        //点击分页按钮回调函数，返回当前页码
                        sendFindAllArticle(page);
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
        layer.confirm('确认要停用吗？',function(index){
            var flag = 1;
            if($(obj).attr('title')=='1'){

                //发异步把用户状态进行更改
                $(obj).attr('title','2')
                $(obj).find('i').html('&#xe62f;');
                var flag = 2;

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

            }else{
                $(obj).attr('title','1')
                $(obj).find('i').html('&#xe601;');
                flag = 1;

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
            }
            $.ajax({
                url:"/article/changeArticleState",
                type: "get",
                data: {"articleId":id,"state":flag},
                success:function () {

                }
            });
        });
    }

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.ajax({
                url:"/article/deleteArticle",
                type: "get",
                data: {"articleId":id,"state":0},
                success:function () {

                }
            });
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
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

        layer.confirm('确认要删除吗？'+ids.toString(),function(index){
            //捉到所有被选中的，发异步进行删除
            $.ajax({
                url:"/article/deleteArticle",
                type: "get",
                data: {"articleId":ids.toString(),"state":0},
                success:function () {
                }
            });
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
    function findArticleByKey() {
        var articleKey = $("#article_key").val();
        if (articleKey!=""){
            sendFindRiskArticleByKey(1,articleKey)
        }
    }
    function sendFindRiskArticleByKey(pageNum,key){
        $.ajax({
            url:"/article/findRiskArticleByKey",
            type:"get",
            data:{"pageNum":pageNum,"articleKey":key},
            success:function (data) {
                var articlesPageInfo = data.articlesPageInfo;
                var showList = "";
                var index;
                for (index in articlesPageInfo.list){
                    var releaseDate = articlesPageInfo.list[index].releaseDate;
                    var releaseFormat = new Date(releaseDate);
                    releaseFormat = releaseFormat.getFullYear()+"-"+(releaseFormat.getMonth()+1)+"-"+releaseFormat.getDate()
                    showList += ("<tr>\n" +
                        "                                <td>\n" +
                        "                                    <input type=\"checkbox\" name=\"id\" value="+articlesPageInfo.list[index].articleId+"   lay-skin=\"primary\">\n" +
                        "                                </td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].articleId+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].head+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].describe+"</td>\n" +
                        "                                <td>"+releaseFormat+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].fontCount+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].view+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].good+"</td>\n" +
                        "                                <td>"+articlesPageInfo.list[index].report+"</td>\n" +
                        "                                <td class=\"td-status\">\n" +
                        "                                    <span class=\"layui-btn layui-btn-normal layui-btn-mini\">"+articlesPageInfo.list[index].articleStateStr+"</span></td>\n" +
                        "                                <td class=\"td-manage\">\n" +
                        "                                    <a onclick=\"member_stop(this,'"+articlesPageInfo.list[index].articleId+"')\" href=\"javascript:;\"  title='"+articlesPageInfo.list[index].articleState+"'>\n" +
                        "                                        <i class=\"layui-icon\">&#xe601;</i>\n" +
                        "                                    </a>\n" +
                        "                                    <a title=\"删除\" onclick=\"member_del(this,'"+articlesPageInfo.list[index].articleId+"')\" href=\"javascript:;\">\n" +
                        "                                        <i class=\"layui-icon\">&#xe640;</i>\n" +
                        "                                    </a>\n" +
                        "                                </td>\n" +
                        "                            </tr>");
                }
                $(".article-tbody").html(showList);
                $("#articlePage").sPage({
                    page:articlesPageInfo.pageNum,//当前页码，必填
                    total:articlesPageInfo.total,//数据总条数，必填
                    pageSize:10,//每页显示多少条数据，默认10条
                    totalTxt:"共"+articlesPageInfo.total+"条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
                    showTotal:true,//是否显示总条数，默认关闭：false
                    showSkip:false,//是否显示跳页，默认关闭：false
                    showPN:true,//是否显示上下翻页，默认开启：true
                    prevPage:"上一页",//上翻页文字描述，默认“上一页”
                    nextPage:"下一页",//下翻页文字描述，默认“下一页”
                    backFun:function(page){
                        //点击分页按钮回调函数，返回当前页码
                        sendFindRiskArticleByKey(page,key);
                    }
                });
            }
        });
    }
</script>
</html>

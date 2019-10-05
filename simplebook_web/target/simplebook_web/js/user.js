var uname="";
$(function () {
    sendFindUserArticals(1);
    sendFindFavorArticlesByUid(1);
    sendFindCommentsByUid(1);
    uname=$("#uname").val().trim();
   $.ajax({
       url:"/user/findUserTotal",
       type:"get",
       data:{},
       success:function (data) {
           var userTotal = data.userTotal;
           $(".font-total").html(userTotal.fontCount);
           $(".good-total").html(userTotal.totalGood);
       }
   });
});

function submitUserInfo() {
    var flag = true;
    if (!checkHadUser()) flag = false;
    if (!checkMobile()) flag = false;
    if (flag){
        if (confirm("您确定要修改吗？")){
            $(".changeUserInfo-form").submit();
        }
    }
}
function checkHadUser() {
    var flag = true;
      checkUser();
      if ($("#uname").val().trim()!=uname){
          $.ajax({
              url:"/user/checkUser",
              type:"get",
              async:false,
              data:{"uname":$("#uname").val().trim()},
              success:function (data) {
                  if (data.noUser){
                      flag = true;
                  } else {
                      $(".uname-warm").html("用户名已存在");
                      flag = false;
                  }
              },
              error:function () {
              }
          });
      }
    return flag;
}
/**
 *发送查询登录用户所有文章的请求
 */
function sendFindUserArticals(pageNum) {
    $.ajax({
        url:"/article/findArticlesByUid",
        type:"get",
        data:{"pageNum":pageNum},
        success:function (data) {

           var articlePageInfo = data.articlePageInfo;
            // console.log(articlePageInfo.list);
            $(".article-total").html(articlePageInfo.total);
            var listShow = "";
            var index;
           for (index in articlePageInfo.list){
               if (articlePageInfo.list[index].headurl==""||articlePageInfo.list[index].headurl==null){
                   listShow += ("<div class=\"col-md-12\">\n" +
                       "                    <div class=\"service-item\" style=\"padding: 20px\">\n" +
                       "                        <a href=\"essay-detail\" class=\"media\">\n" +
                       "                            <div class=\"media-body\">\n" +
                       "                                <h4 class=\"media-heading\">"+articlePageInfo.list[index].head+"</h4>\n" +
                       "                                <p class='article-body'>\n" +
                       articlePageInfo.list[index].describe +
                       "                                </p>\n" +
                       "                            </div><a class='btn btn-danger right'  pageNum ='"+data.articlePageInfo.pageNum+"' onclick='deleteArticle(this)' value='"+articlePageInfo.list[index].articleId+"'>删除</a>\n" +
                       "                        </a>\n" +
                       "                    </div>\n" +
                       "                </div>\n" +
                       "            </div>");
               }else {
                   listShow += ("<div class=\"col-md-12\">\n" +
                       "                    <div class=\"service-item\" style=\"padding: 20px\">\n" +
                       "                        <a href=\"essay-detail\" class=\"media\">\n" +
                       "                            <div class=\"media-left media-middle\">\n" +
                       "                                <img class=\"media-object headimg\" src="+articlePageInfo.list[index].headurl+" alt=\"...\">\n" +
                       "                            </div>\n" +
                       "                            <div class=\"media-body\">\n" +
                       "                                <h4 class=\"media-heading\">"+articlePageInfo.list[index].head+"</h4>\n" +
                       "                                <p class='article-body'>\n" +
                       articlePageInfo.list[index].describe +
                       "                                </p>\n" +
                       "                            </div><div class='media-right media-middle'><a  pageNum ='"+data.articlePageInfo.pageNum+"' onclick='deleteArtile(this)' class='btn btn-danger' value='"+articlePageInfo.list[index].articleId+"'>删除</a></div>\n" +
                       "                        </a>\n" +
                       "                    </div>\n" +
                       "                </div>\n" +
                       "            </div>");
               }

           }
            $("#article_list").html(listShow);
            $("#articlePage").sPage({
                page:data.articlePageInfo.pageNum,//当前页码，必填
                total:data.articlePageInfo.total,//数据总条数，必填
                pageSize:3,//每页显示多少条数据，默认10条
                totalTxt:"共"+data.articlePageInfo.total+"条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
                showTotal:true,//是否显示总条数，默认关闭：false
                showSkip:false,//是否显示跳页，默认关闭：false
                showPN:true,//是否显示上下翻页，默认开启：true
                prevPage:"上一页",//上翻页文字描述，默认“上一页”
                nextPage:"下一页",//下翻页文字描述，默认“下一页”
                backFun:function(page){
                    //点击分页按钮回调函数，返回当前页码
                    sendFindUserArticals(page);
                }
            });
        },
        error:function () {
            console.log("请求错误")
        }
    });
}

/**
 *发送查询登录用户所有文章的请求
 */
function sendFindFavorArticlesByUid(pageNum) {
    $.ajax({
        url:"/article/findFavorArticlesByUid",
        type:"get",
        data:{"pageNum":pageNum},
        success:function (data) {
            var favorArticlePageInfo = data.favorArticlePageInfo
            // console.log(data.favorArticlePageInfo);
            // console.log(articlePageInfo.list);
            $(".favor-total").html(favorArticlePageInfo.total);
            var index;
            var listShow = ""
            for (index in favorArticlePageInfo.list){
                if (favorArticlePageInfo.list[index].headurl==""||favorArticlePageInfo.list[index].headurl==null){
                    listShow += ("<div class=\"col-md-12\">\n" +
                        "                    <div class=\"service-item\" style=\"padding: 20px\">\n" +
                        "                        <a href=\"essay-detail\" class=\"media\">\n" +
                        "                            <div class=\"media-body\">\n" +
                        "                                <h4 class=\"media-heading\">"+favorArticlePageInfo.list[index].head+"</h4>\n" +
                        "                                <p class='article-body'>\n" +
                        favorArticlePageInfo.list[index].describe +
                        "                                </p>\n" +
                        "                            </div><a class='btn btn-danger right' onclick='deleteFavorArticle(this)'  pageNum ='"+data.favorArticlePageInfo.pageNum+"' value='"+favorArticlePageInfo.list[index].articleId+"'>删除</a>\n" +
                        "                        </a>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </div>");
                }else {
                    listShow += ("<div class=\"col-md-12\">\n" +
                        "                    <div class=\"service-item\" style=\"padding: 20px\">\n" +
                        "                        <a href=\"essay-detail\" class=\"media\">\n" +
                        "                            <div class=\"media-left media-middle\">\n" +
                        "                                <img class=\"media-object headimg\" src="+favorArticlePageInfo.list[index].headurl+" alt=\"...\">\n" +
                        "                            </div>\n" +
                        "                            <div class=\"media-body\">\n" +
                        "                                <h4 class=\"media-heading\">"+favorArticlePageInfo.list[index].head+"</h4>\n" +
                        "                                <p class='article-body'>\n" +
                        favorArticlePageInfo.list[index].describe +
                        "                                </p>\n" +
                        "                            </div><div class='media-right media-middle'><a onclick='deleteFavorArticle(this)'  pageNum ='"+data.favorArticlePageInfo.pageNum+"' class='btn btn-danger' value='"+favorArticlePageInfo.list[index].articleId+"'>删除</a></div>\n" +
                        "                        </a>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </div>");
                }

            }
            $("#favorArticle_list").html(listShow);
            $("#favorArticlePage").sPage({
                page:favorArticlePageInfo.pageNum,//当前页码，必填
                total:favorArticlePageInfo.total,//数据总条数，必填
                pageSize:3,//每页显示多少条数据，默认10条
                totalTxt:"共"+favorArticlePageInfo.total+"条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
                showTotal:true,//是否显示总条数，默认关闭：false
                showSkip:false,//是否显示跳页，默认关闭：false
                showPN:true,//是否显示上下翻页，默认开启：true
                prevPage:"上一页",//上翻页文字描述，默认“上一页”
                nextPage:"下一页",//下翻页文字描述，默认“下一页”
                backFun:function(page){
                    //点击分页按钮回调函数，返回当前页码
                    sendFindFavorArticlesByUid(page);
                }
            });
        },
        error:function () {
            console.log("请求错误")
        }
    });
}
/**
 *发送查询登录用户所有评论的请求
 */
function sendFindCommentsByUid(pageNum) {
    $.ajax({
        url:"/comment/findCommentsByUid",
        type:"get",
        data:{"pageNum":pageNum},
        success:function (data) {
            var commentPageInfo = data.commentPageInfo;
            var index;
            var listShow = "";
            for (index in commentPageInfo.list){
                listShow += ("<div class=\"col-md-12\">\n" +
                    "                        <div class=\"service-item media btn-group\" style=\"padding: 10px;\">\n" +
                    "                                <p class=\"comment-body media-body\">\n" +
                    commentPageInfo.list[index].content +
                    "                                </p><a class='media-right btn btn-danger btn-group-sm' pageNum ='"+data.commentPageInfo.pageNum+"' onclick='deleteComment(this)' value='"+commentPageInfo.list[index].commentId+"'>删除</a>\n" +
                    "                        </div>\n" +
                    "                    </div>")
            }
            $("#comment_list").html(listShow);
            $("#commentPage").sPage({
                page:data.commentPageInfo.pageNum,//当前页码，必填
                total:data.commentPageInfo.total,//数据总条数，必填
                pageSize:6,//每页显示多少条数据，默认10条
                totalTxt:"共"+data.commentPageInfo.total+"条",//数据总条数文字描述，{total}为占位符，默认"共{total}条"
                showTotal:true,//是否显示总条数，默认关闭：false
                showSkip:false,//是否显示跳页，默认关闭：false
                showPN:true,//是否显示上下翻页，默认开启：true
                prevPage:"上一页",//上翻页文字描述，默认“上一页”
                nextPage:"下一页",//下翻页文字描述，默认“下一页”
                backFun:function(page){
                    //点击分页按钮回调函数，返回当前页码
                    sendFindCommentsByUid(page);
                }
            });
        },
        error:function () {
            console.log("请求错误")
        }
    });
}

/**
 * “删除”用户文章
 * @param e
 */
function deleteArticle(e) {
    // console.log($(e).attr("value"))
    if(confirm("您确定要删除吗？")){
        var id = $(e).attr("value");
        var num = $(e).attr("pageNum");
        $.ajax({
            url:"/article/deleteArticle",
            data:{"articleId":id},
            type:"get",
            success:function () {
                sendFindCommentsByUid(num);
            }
        });
    }else {

    }

}

/**
 * 删除用户收藏文章
 * @param e
 */
function deleteFavorArticle(e) {
    // console.log($(e).attr("value"));
    if (confirm("您确定要删除吗？")){
        var id = $(e).attr("value");
        var num = $(e).attr("pageNum");
        var uid = $(e).attr("uid");
        console.log($("#uid").html());
        $.ajax({
            url:"/article/deleteFavorArticle",
            data:{"uid":$("#uid").html(),"articleId":id},
            type:"get",
            success:function () {
                sendFindFavorArticlesByUid(num);
            }
        });
    } else {

    }

}

/**
 * 删除用户评论
 * @param e
 */
function deleteComment(e) {
    console.log($(e).attr("value"));
    if (confirm("您确定要删除吗？")){
        var id = $(e).attr("value");
        var num = $(e).attr("pageNum");
        $.ajax({
            url:"/comment/deleteComment",
            data:{"commentId":id},
            type:"get",
            success:function () {
                sendFindCommentsByUid(num);
            }
        });
    }
}
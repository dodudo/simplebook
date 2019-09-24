$(function () {
    sendFindUserArticals(1);
    sendFindFavorArticlesByUid(1);
    sendFindCommentsByUid(1);
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
               listShow += ("<div class=\"col-md-12\">\n" +
                   "                    <div class=\"service-item\" style=\"padding: 20px\">\n" +
                   "                        <a href=\"essay-detail\" class=\"media\">\n" +
                   "                            <div class=\"media-left media-middle\">\n" +
                   "                                <img class=\"media-object\" src="+articlePageInfo.list[index].headurl+" alt=\"...\">\n" +
                   "                            </div>\n" +
                   "                            <div class=\"media-body\">\n" +
                   "                                <h4 class=\"media-heading\">"+articlePageInfo.list[index].head+"</h4>\n" +
                   "                                <p class='article-body'>\n" +
                   articlePageInfo.list[index].describe +
                   "                                </p>\n" +
                   "                            </div>\n" +
                   "                        </a>\n" +
                   "                    </div>\n" +
                   "                </div>\n" +
                   "            </div>");
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
                listShow += ("<div class=\"col-md-12\">\n" +
                    "                    <div class=\"service-item\" style=\"padding: 20px\">\n" +
                    "                        <a href=\"essay-detail\" class=\"media\">\n" +
                    "                            <div class=\"media-left media-middle\">\n" +
                    "                                <img class=\"media-object\" src="+favorArticlePageInfo.list[index].headurl+" alt=\"...\">\n" +
                    "                            </div>\n" +
                    "                            <div class=\"media-body\">\n" +
                    "                                <h4 class=\"media-heading\">"+favorArticlePageInfo.list[index].head+"</h4>\n" +
                    "                                <p class='article-body'>\n" +
                    favorArticlePageInfo.list[index].describe +
                    "                                </p>\n" +
                    "                            </div>\n" +
                    "                        </a>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "            </div>");
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
                    "                        <div class=\"service-item\" style=\"padding: 10px;\">\n" +
                    "                            <a href=\"#\">\n" +
                    "                                <p class=\"comment-body\">\n" +
                    commentPageInfo.list[index].content +
                    "                                </p>\n" +
                    "                            </a>\n" +
                    "                        </div>\n" +
                    "                    </div>")
            }
            $("#comment_list").html(listShow);
            $("#commentPage").sPage({
                page:data.commentPageInfo.pageNum,//当前页码，必填
                total:data.commentPageInfo.total,//数据总条数，必填
                pageSize:5,//每页显示多少条数据，默认10条
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
$(function () {
    sendFindUserArticals(1);
    sendFindFavorArticlesByUid(1);
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
           console.log(data.articlePageInfo);
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
            console.log(data.favorArticlePageInfo);
        },
        error:function () {
            console.log("请求错误")
        }
    });
}
/**
 *发送查询登录用户所有评论的请求
 */
function sendFindFavorArticlesByUid(pageNum) {
    $.ajax({
        url:"/article/findFavorArticlesByUid",
        type:"get",
        data:{"pageNum":pageNum},
        success:function (data) {
            console.log(data.favorArticlePageInfo);
        },
        error:function () {
            console.log("请求错误")
        }
    });
}
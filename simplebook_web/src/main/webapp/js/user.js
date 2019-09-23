$(function () {
   $.ajax({
       url:"/user/findUserInfo",
       type:"get",
       data:{},
       success:function (data) {
           var userTotal = data.userTotal;
           $(".favor-total").html(userTotal.favorTotal);
           $(".article-total").html(userTotal.articalTotal);
           $(".font-total").html(userTotal.fontCount);
           $(".good-total").html(userTotal.totalGood);
           var userInfo = data.userMap;
           for (var articles in userInfo.articles){
               $("#article_list").append("<div class=\"col-md-12\">\n" +
                   "                    <div class=\"service-item\" style=\"padding: 20px\">\n" +
                   "                        <a href=\"essay-detail\" class=\"media\">\n" +
                   "                            <div class=\"media-left media-middle\">\n" +
                   "                                <img class=\"media-object\" src=\"...\" alt=\"...\">\n" +
                   "                            </div>\n" +
                   "                            <div class=\"media-body\">\n" +
                   "                                <h4 class=\"media-heading\">Middle aligned media</h4>\n" +
                   "                                <p>\n" +
                                                            articles+
                       "                                </p>\n" +
                   "                            </div>\n" +
                   "                        </a>\n" +
                   "                    </div>\n" +
                   "                </div>")
           }
           }

   });
});
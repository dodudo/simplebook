<%--
  Created by IntelliJ IDEA.
  User: Administream
  Date: 2019/9/11
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Parsa | Portfolio Template</title>

    <!-- mobile responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- ** Plugins Needed for the Project ** -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/bootstrap.min.css">
    <!-- slick slider -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/slick/slick.css">
    <!-- themefy-icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/themify-icons/themify-icons.css">

    <!-- Main Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <!--Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">

</head>

<body>
<!-- preloader -->
<div class="preloader">
    <div class="loader">
        <span class="dot"></span>
        <div class="dots">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<!-- /preloader -->

<!-- 导航 -->
<header class="navigation">
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index"><img class="img-fluid" src="${pageContext.request.contextPath}/images/logo.png" alt="parsa"></a>
        <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#navogation"
                aria-controls="navogation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse text-center" id="navogation">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link text-uppercase text-dark dropdown-toggle" href="#" id="navbarDropdown"
                       role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Home
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/index">article</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/project">project</a>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="${pageContext.request.contextPath}/User">User</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="${pageContext.request.contextPath}/editor">editor</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link text-uppercase text-dark dropdown-toggle" href=${pageContext.request.contextPath}/"GMS" id="navbarDropdown1"
                       role="button" aria-haspopup="true" aria-expanded="false">
                        <img style="width: 51px;margin-top:-20px;" src="${pageContext.request.contextPath}/images/u2.jpg" alt="parsa">
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/login">
                            退出登陆</a>
                    </div>
                </li>
            </ul>
            <form class="form-inline position-relative ml-lg-4">
                <input class="form-control px-0 w-100" type="search" placeholder="Search">
                <button class="search-icon" type="submit"><i class="ti-search text-dark"></i></button>
            </form>
        </div>
    </nav>
</header>
<!-- /导航 -->

<!-- 文章名称 -->
<section class="section bg-secondary">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h4>${articleDetail.head}</h4>
            </div>
        </div>
    </div>
</section>
<!-- /文章名称 -->

<!--文章主体 -->
<section>
    <div class="container">
        <div class="row">
            <!-- 文章详情内容 -->
            <div class="col-lg-8">
                <ul class="list-inline d-flex justify-content-between py-3">
                    <!-- 作者 -->
                    <li class="list-inline-item"><i class="ti-user mr-2"></i>${articleDetail.user.uname}</li>
                    <!-- 日期 -->
                    <li class="list-inline-item"><i class="ti-calendar mr-2"></i>${articleDetail.releaseDate}</li>
                </ul>
                <%-- <img src="${pageContext.request.contextPath}/images/${articleDetail.articleContent.articleImgUrl}"
                      alt="post-thumb" class="w-100 img-fluid mb-4">--%>
                <div class="content">
                    <p>${articleDetail.articleContent.articleContent}</p>

                    <%--<blockquote>
                        ${articleDetail.describe}
                    </blockquote>

                    <img src="${pageContext.request.contextPath}/images/${articleDetail.articleContent.articleImgUrl}"
                         alt="image" class="img-fluid">
                    <p>${articleDetail.articleContent.articleContent}</p>--%>
                </div>
            </div>
            <!-- /文章详情内容 -->

            <!-- 搜索框 -->
            <div class="col-lg-4">
                <div class="widget search-box">
                    <i class="ti-search"></i>
                    <input type="search" id="search-post" class="form-control border-0 pl-5" name="search-post"
                           placeholder="Search">
                </div>
                <!-- /搜索框 -->

                <!-- 本作者最新文章 -->
                <div class="widget">
                    <h6 class="mb-4">AUTHOR POST</h6>
                    <div class="media mb-4">
                        <div class="post-thumb-sm mr-3">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/${articleDetail.user.headImgs}" alt="post-thumb">
                        </div>
                        <div class="media-body">
                            <ul class="list-inline d-flex justify-content-between mb-2">
                                <li class="list-inline-item">Post By Jhon</li>
                                <li class="list-inline-item">June 2, 2018</li>
                            </ul>
                            <%--自我简介--%>
                            <h6>Lorem ipsum dolor sit amet, consectetur</h6>
                            <form action="${pageContext.request.contextPath}/article/addFollow" method="post">
                                <input name="followId" value="${articleDetail.uid}" style="display: none;">
                                <input name="uid" value="${sessionScope.user.uid}" style="display: none;">
                                <input name="articleId" value="${articleDetail.articleId}" style="display: none;">
                                <input type="submit" value="关注">
                            </form>
                        </div>
                    </div>
                    <%--<div class="media mb-4">
                        <div class="post-thumb-sm mr-3">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/masonary-post/post-6.jpg" alt="post-thumb">
                        </div>
                        <div class="media-body">
                            <ul class="list-inline d-flex justify-content-between mb-2">
                                <li class="list-inline-item">Post By Jhon</li>
                                <li class="list-inline-item">June 2, 2018</li>
                            </ul>
                            <h6><a class="text-dark" href="essay-detail.jsp">Lorem ipsum dolor sit amet, consectetur</a></h6>
                            <h6 class="attention"><a class="text-dark" href="${pageContext.request.contextPath}/essay-detail.jsp">关注</a></h6>
                        </div>
                    </div>
                    <div class="media mb-4">
                        <div class="post-thumb-sm mr-3">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/masonary-post/post-3.jpg" alt="post-thumb">
                        </div>
                        <div class="media-body">
                            <ul class="list-inline d-flex justify-content-between mb-2">
                                <li class="list-inline-item">Post By Jhon</li>
                                <li class="list-inline-item">June 2, 2018</li>
                            </ul>
                            <h6><a class="text-dark" href="${pageContext.request.contextPath}/essay-detail.jsp">Lorem ipsum dolor sit amet, consectetur</a></h6>
                            <h6 class="attention"><a class="text-dark" href="${pageContext.request.contextPath}/essay-detail.jsp">关注</a></h6>
                        </div>
                    </div>--%>
                </div>
                <!-- 本作者最新文章 -->

                <!-- 文章标签 -->
                <div class="widget">
                    <h6 class="mb-4">TAG</h6>
                    <ul class="list-inline tag-list">
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">ui ux</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">developmetns</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">travel</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">article</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">travel</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">ui ux</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">article</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">developmetns</a></li>
                    </ul>
                </div>
                <!-- /文章标签 -->

                <!-- 文章类别 -->
                <div class="widget">
                    <h6 class="mb-4">CATEGORIES</h6>
                    <ul class="list-inline tag-list">
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">ui ux</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">developmetns</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">travel</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">article</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">travel</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">ui ux</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">article</a></li>
                        <li class="list-inline-item m-1"><a href="${pageContext.request.contextPath}/essay-detail.jsp">developmetns</a></li>
                    </ul>
                </div>
                <!-- /文章类别 -->
            </div>
        </div>
    </div>
</section>
<!-- /文章主体 -->
<%--点赞，收藏--%>
<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
                <ul class="list-unstyled">
                    <li class="font-secondary text-dark">
                        <form action="${pageContext.request.contextPath}/article/updateGoodforArticle" method="post">
                            <input name="good" style="display: none" value="${articleDetail.good+1}">
                            <input name="articleId" style="display: none" value="${articleDetail.articleId}">
                            <input type="image" style="width: 30px;height: 30px;text-align:center;margin-left:5px;cursor: pointer;" src="${pageContext.request.contextPath}/images/yizan.png" onclick="document.formName.submit()">
                            <%--<img style="width: 30px;height: 30px;text-align:center;margin-left:5px;cursor: pointer;"
                                 src="${pageContext.request.contextPath}/images/yizan.png"/>--%>
                        </form>
                        <p  style="margin-left: 15px;">${articleDetail.good}</p>
                    </li>
                </ul>
            </div>


            <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
                <ul class="list-unstyled">
                    <li class="font-secondary text-dark">
                        <form action="${pageContext.request.contextPath}/article/addFavor" method="post">
                            <input name="uid" style="display: none" value="${articleDetail.uid}"/>
                            <input name="articleId" style="display: none;" value="${articleDetail.articleId}"/>
                            <%--<a class="text-dark" href="${pageContext.request.contextPath}/article/addFavor">收藏</a>--%>
                            <h6><input type="submit" value="收藏"></h6>
                        </form>
                    </li>

                </ul>
            </div>

        </div>
    </div>
</div>
<%--评论--%>
<section class="sec_review">
    <div style="width: 1106px;height: 20px;margin: 0px auto;">
        <div style="float: left; font-family: '幼圆'; font-size: 19px;">
            <a class="a" href="#write_rew"><h6>评论</h6></a>
        </div>

    </div>
    <%--第一个评论--%>
    <C:forEach var="comment" items="${articleDetail.comments}">
        <div style=" width: 74%;height: 41%;margin: 12px auto;padding-top: 1px;">
            <div style="margin-left: 10px; margin-top: 5px;border-radius: 57%;float: left;width: 11%;height: 93%;">
                <img src="${pageContext.request.contextPath}/images/${comment.user.headImgs}"
                     style="border-radius: 57%;width: 126px;height: 121px;"/>
            </div>
            <div style="font-size: 15px;  margin-top: 8px;margin-left: 20px">${comment.user.uname}</div>
            <div style="margin-top: 8px;text-indent: 2em;font-size: 14px;line-height: 23px;height: 66%;overflow: hidden;;margin-left: 20px">
                <p>
                        ${comment.content}
                </p>
            </div>
            <div style="float: right;width: 144px;" onclick="">
                <form action="" method="post">
                    <input style="float: right;border: 0px;border-radius: 15%;width: 74px;height: 21px;background-color: #ddd4c459;margin-top:8px;cursor: pointer;"
                           type="submit" value="删除" name="btndelete"/>
                    <div style="float: right;margin-right: 20px;">
                        <img style="width: 30px;height: 30px;text-align:center;margin-left:5px;cursor: pointer;"
                             src="${pageContext.request.contextPath}/images/yizan.png"/>
                        <p class="likes" style="margin-left: 15px;">&nbsp;</p>
                    </div>
                </form>
            </div>
            <div class="review_time"
                 style="width: 178px; height: 26px; float: right; margin-right: 85px; margin-top: 3px;">
                    ${comment.commentDate}
            </div>
        </div>
        <hr>
    </C:forEach>

    <!--输入评论-->
    <div id="write_rew" style="width: 75%;height: 39%;margin: 0 auto;">
        <form action="${pageContext.request.contextPath}/comment/insertComment" method="post">
            <input style="display: none;" name="uId" value="${sessionScope.user.uid}"/>
            <input style="display: none;" name="articleId" value="${articleDetail.articleId}"/>
            <%--<input style="display: none;" name="commentDate" value="${articleDetail.uid}"/>--%>
            <textarea rows="3" cols="20" class="text-content" name="content"
                      style="height: 95%;width: 100%;display: block;float: left;font-family: 骞煎渾;line-height: 30px;margin: 20px;text-indent: 2em;border: 1px solid #cccccc;">
                请输入评论
            </textarea>


            <input type="submit" name="" value="提交" class="btn"
                   style=" border: 0px;margin-left: 451px;width: 271px;margin-top: 8px;border-radius: 6%;"/>
        </form>
    </div>
</section>

<footer>
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
                    <a href="index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" alt="persa"
                                             class="img-fluid"></a>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center">
        <p>简书
            <script>var CurrentYear = new Date().getFullYear()
            document.write(CurrentYear)</script>
            a theme by themefisher / More Templates <a href="" target="_blank" title="简书">简书</a> - Collect from <a
                    href="" title="简书" target="_blank">简书</a></p>
    </div>
</footer>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/plugins/bootstrap/bootstrap.min.js"></script>
<!-- slick slider -->
<script src="${pageContext.request.contextPath}/plugins/slick/slick.min.js"></script>
<!-- masonry -->
<script src="${pageContext.request.contextPath}/plugins/masonry/masonry.js"></script>
<!-- instafeed -->
<script src="${pageContext.request.contextPath}/plugins/instafeed/instafeed.min.js"></script>
<!-- smooth scroll -->
<script src="${pageContext.request.contextPath}/plugins/smooth-scroll/smooth-scroll.js"></script>
<!-- headroom -->
<script src="${pageContext.request.contextPath}/plugins/headroom/headroom.js"></script>
<!-- reading time -->
<script src="${pageContext.request.contextPath}/plugins/reading-time/readingTime.min.js"></script>

<!-- Main Script -->
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}js/jquery.js"></script>
<%--<script type="text/javascript">
    $(function () {
        for (var i = 0; i < $('.likes').length; i++) {
            var ran = Math.floor(0)
            $('.likes').eq(i).text(ran)
        }
        $("img").click(function () {
            var num = $(this).next().text()
            num++;
            $(this).next().text(num);
        });
    });
</script>--%>

<%--<script>
    $(function () {
        //当前发起请求路径
        var wsUrl = "ws://"+window.location.host+"/ws";
        //客户端与服务器建立连接，会发出一个ws.onopen()事件
        var webSocket = new WebSocket(wsUrl);
        //填写要发送的东西
        var uid = prompt("请输入用户id");
        var content = prompt("请输入评论内容");
        webSocket.onopen = function (ev) {
            //当与服务器连接成功时发送用户的id
            webSocket.send(uid);
        }


    });
</script>--%>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Administream
  Date: 2019/9/11
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <h4>As a Designer, I Refuse to Call People ‘Users’</h4>
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
                    <li class="list-inline-item"><i class="ti-user mr-2"></i>Post by Jhon Abraham</li>
                    <!-- 日期 -->
                    <li class="list-inline-item"><i class="ti-calendar mr-2"></i>June 2, 2018</li>
                </ul>
                <img src="${pageContext.request.contextPath}/images/post-single.jpg" alt="post-thumb" class="w-100 img-fluid mb-4">
                <div class="content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
                        ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                        nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                        anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                        laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae
                        dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia
                        consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem
                        ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut
                        labore et dolore magnam aliquam quaerat voluptatem.</p>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
                        ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                        nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                        anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                        laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae
                        dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia
                        consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem
                        ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut
                        labore et dolore magnam aliquam quaerat voluptatem.</p>

                    <blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                        labore
                        et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                        aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                    </blockquote>

                    <img src="${pageContext.request.contextPath}/images/post-img.jpg" alt="image" class="img-fluid">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
                        ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                        nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                        anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                        laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae
                        dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia
                        consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem
                        ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut
                        labore et dolore magnam aliquam quaerat voluptatem.</p>
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
                    <h6 class="mb-4">LATEST POST</h6>
                    <div class="media mb-4">
                        <div class="post-thumb-sm mr-3">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/masonary-post/post-1.jpg" alt="post-thumb">
                        </div>
                        <div class="media-body">
                            <ul class="list-inline d-flex justify-content-between mb-2">
                                <li class="list-inline-item">Post By Jhon</li>
                                <li class="list-inline-item">June 2, 2018</li>
                            </ul>
                            <h6><a class="text-dark" href="${pageContext.request.contextPath}/essay-detail">Lorem ipsum dolor sit amet, consectetur</a></h6>
                            <h6 class="attention"><a class="text-dark" href="${pageContext.request.contextPath}/essay-detail.jsp">关注</a></h6>
                        </div>
                    </div>
                    <div class="media mb-4">
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
                    </div>
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

<footer>
    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
                    <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/logo.png" alt="persa" class="img-fluid"></a>
                </div>
                <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
                    <ul class="list-unstyled">
                        <li class="font-secondary text-dark">Sydney</li>
                        <li class="font-secondary text-dark">6 rip carl Avenue CA 90733</li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
                    <ul class="list-unstyled">
                        <li class="font-secondary text-dark">Tel: +90 000 333 22</li>
                        <li class="font-secondary text-dark">Mail: exmaple@ymail.com</li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
                    <ul class="list-unstyled">
                        <li class="font-secondary text-dark">
                            <h6><a class="text-dark" href="${pageContext.request.contextPath}/essay-detail.jsp">关注</a></h6>
                        </li>

                    </ul>
                </div>

            </div>
        </div>
    </div>
    <div class="text-center">
        <p>Copyright ©<script>var CurrentYear = new Date().getFullYear()
        document.write(CurrentYear)</script> a theme by themefisher / More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
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

<script>
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
</script>
</body>
</html>

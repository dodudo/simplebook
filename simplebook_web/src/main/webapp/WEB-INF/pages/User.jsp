<%--
  Created by IntelliJ IDEA.
  User: Administream
  Date: 2019/9/11
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link
            href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
            rel="stylesheet"
    />

    <title>Reflux HTML CSS Template</title>


    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/templatemo-style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lightbox.css" />


    <!-- ** Plugins Needed for the Project ** -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/bootstrap.min.css">
    <!-- slick slider -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/slick/slick.css">
    <!-- themefy-icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/themify-icons/themify-icons.css">

    <!-- Main Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <%--引入分页插件css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.sPage.red.css">
    <!--Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/cropper/cropper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/cropper/ImgCropping.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">
</head>

<body>
<i id="uid">${sessionScope.user.uid}</i>
<!-- 导航 -->
<header class="navigation">
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="index"><img class="img-fluid" src="${pageContext.request.contextPath}/images/logo.png" alt="parsa"></a>
        <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#navogation"
                aria-controls="navogation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse text-center" id="navogation">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link text-uppercase text-dark dropdown-toggle" href="#" id="navbarDropdown"
                       role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        主页
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="index">article</a>
                        <a class="dropdown-item" href="project">project</a>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-uppercase text-dark" href="editor">写文章</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link text-uppercase text-dark dropdown-toggle" href="user" id="navbarDropdown1"
                       role="button"  aria-haspopup="true" aria-expanded="false">
                        <img style="width: 51px;margin-top:-20px;" src="${sessionScope.user.headImgs}" alt="parsa">
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="login">
                            退出登陆</a>
                    </div>
                </li>
            </ul>
            <form class="form-inline position-relative ml-lg-4">
                <input class="form-control px-0 w-100" type="search" placeholder="搜索">
                <button class="search-icon" type="submit"><i class="ti-search text-dark"></i></button>
            </form>
        </div>
    </nav>
</header>
<!-- /导航 -->
<div id="page-wraper">
    <!-- 右侧导航栏 -->
    <div class="responsive-nav">
        <i class="fa fa-bars" id="menu-toggle"></i>
        <div id="menu" class="menu">
            <i class="fa fa-times" id="menu-close"></i>
            <div class="container">
                <div class="image" >
                    <a href="#"><img id="user_headImg" src="${sessionScope.user.headImgs}" alt="" /></a>
                </div>
                <div class="author-content">
                    <h4>${sessionScope.user.uname}</h4>
                </div>
                <nav class="main-nav" role="navigation">
                    <ul class="main-menu">
                        <li><a href="#section1">我的信息</a></li>
                        <li><a href="#section2">文章</a></li>
                        <li><a href="#section3">我的收藏</a></li>
                        <li><a href="#section4">评论</a></li>
                        <li><a href="#section5">修改信息</a></li>
                    </ul>
                </nav>
                <div class="social-network">
                    <ul class="soial-icons">
                        <li>
                            <a href="https://fb.com/templatemo"
                            ><i class="fa fa-facebook"></i
                            ></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-rss"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="copyright-text">
                    <p>Copyright 2019 Reflux Design - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
                </div>
            </div>
        </div>
    </div>
    <!-- /右侧导航栏 -->


    <!-- about me 介绍自己 -->
    <section class="section about-me" data-section="section1">
        <div class="container">
            <div class="section-heading" style="padding-bottom: 50px">
                <h2>我的信息</h2>
                <div class="line-dec"></div>
                <span>${sessionScope.user.about}</span>
            </div>
            <div class="left-image-post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="left-image">
                            <img src="${pageContext.request.contextPath}/assets/images/left-image.jpg" alt="" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="right-text base-info-text main-menu" >
                            <div><a href="#section3"><p>收藏 <i class="favor-total"></i></p></a></div>
                            <div><a href="#section2"><p>文章 <i class="article-total"></i></p></a></div>
                            <div><p>字数 <i class="font-total"></i></p></div>
                            <div><p>收获点赞 <i class="good-total"></i></p></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /about me 介绍自己 -->

    <!-- my attention 我的文章 -->
    <section class="section my-services" data-section="section2">
        <div class="container">
            <div class="section-heading">
                <h2>我的文章</h2>
                <div class="line-dec"></div>
                <span></span>
            </div>
            <div class="row" id="article_list">
                <%--文章列表内容显示区--%>
            </div>
            <%--分页条--%>
            <div id="articlePage"></div>
        </div>
    </section>
    <!-- /my attention 我的文章 -->

    <%--<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >建站模板</a></div>--%>

    <!-- 我的收藏 -->
    <section class="section my-work" data-section="section3">
        <div class="container">
            <div class="section-heading">
                <h2>我的收藏</h2>
                <div class="line-dec"></div>
                <!-- 签名？ -->
                <span></span>
            </div>
            <div class="row" id="favorArticle_list">
                <%--文章列表内容显示区--%>
            </div>
            <%--分页条--%>
            <div id="favorArticlePage"></div>
        </div>
    </section>
    <!-- /我的收藏 -->

    <!-- 我的评论 -->
    <section class="section contact-me" data-section="section4">
        <div class="container">
            <div class="section-heading">
                <h2>我的评论</h2>
                <div class="line-dec"></div>
                <!-- 签名？ -->
                <span></span>
            </div>
            <div class="row media" id="comment_list">
                <%--评论列表内容--%>
            </div>
            <%--分页条--%>
            <div id="commentPage"></div>
        </div>
    </section>

    <!-- 修改个人信息 -->
    <section class="section contact-me" data-section="section5">
        <div class="container">
            <div class="section-heading">
                <h2>修改个人信息</h2>
                <div class="line-dec"></div>
            </div>
            <div class="row" style="margin-bottom: 20px">
                <div class="right-content">
                    <div class="container">
                        <form id="headImg" action="" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-12">
                                    <label  title="上传图片" for="chooseImg" class="btn btn-warning ">
                                        <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden" onchange="selectImg(this)">
                                        选择图片
                                    </label>
                                    <img id="finalImg"  src="" style="width: 80px;margin-left: 20px">
                                    <label class="btn btn-info" style="margin-left: 20px" onclick="upload()" >上传</label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="right-content">
                    <div class="container">
                        <form id="contact"class="changeUserInfo-form" action="${pageContext.request.contextPath}/user/changeUserInfo" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <fieldset>
                                        <input class="aa"
                                               name="uname"
                                               type="text"
                                               class="form-control"
                                               id="uname"
                                               value="${sessionScope.user.uname}"
                                               placeholder="Your name..."
                                               required=""
                                               onblur="checkHadUser()"
                                        />
                                        <i class="uname-warm"></i>
                                    </fieldset>
                                </div>
                                <div class="col-md-6">
                                    <fieldset>
                                        <input
                                                name="phone"
                                                type="text"
                                                class="form-control"
                                                id="phone"
                                                value="${sessionScope.user.phone}"
                                                placeholder="Your phone..."
                                                required=""
                                                onblur="checkMobile()"
                                        />
                                        <i class="phone-warm"></i>
                                    </fieldset>
                                </div>

                                <div class="col-md-6" style="margin-bottom: 40px">
                                    <fieldset>
                                        <select name="sex" style="border:1px #fff solid;background-color: rgba(250,250,250,0.1);color: #fff;" class="form-control" id="sex">
                                            <option value="男" style="color:#000;">男</option>
                                            <option value="女" style="color:#000;">女</option>
                                        </select>
                                    </fieldset>
                                </div>

                                <div class="col-md-12">
                                    <fieldset>
                          <textarea
                                  name="about"
                                  rows="6"
                                  class="form-control"
                                  id="about"
                                  placeholder="Your message..."
                                  required=""
                          >${sessionScope.user.about}</textarea>
                                        <i class="about-warm"></i>
                                    </fieldset>
                                </div>
                                <div class="col-md-12">
                                    <fieldset>
                                        <label  id="form-submit" onclick="submitUserInfo()" class="button btn btn-danger">
                                            修改
                                        </label>

                                    </fieldset>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!--图片裁剪框 start-->

<div style="display: none" class="tailoring-container">
    <div class="black-cloth" onclick="closeTailor(this)"></div>
    <div class="tailoring-content">
        <div class="tailoring-content-one">
            <div class="close-tailoring" onclick="closeTailor(this)">×</div>
        </div>
        <div class="tailoring-content-two">
            <div class="tailoring-box-parcel">
                <img id="tailoringImg" width="100%">
            </div>
            <div class="preview-box-parcel">
                <p>图片预览：</p>
                <%--<div class="square previewImg"></div>--%>
                <div class="circular previewImg">
                </div>
            </div>
        </div>
        <div class="tailoring-content-three">
            <button class="l-btn cropper-reset-btn">复位</button>
            <button class="l-btn cropper-rotate-btn">旋转</button>
            <button class="l-btn cropper-scaleX-btn">换向</button>
            <button class="l-btn sureCut" id="sureCut">确定</button>
        </div>
    </div>
</div>


<!--图片裁剪框 end-->
<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/isotope.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/owl-carousel.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/lightbox.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/plugins/cropper/cropper.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.sPage.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/upload.js"></script>
<script src="${pageContext.request.contextPath}/js/check.js"></script>
<script src="${pageContext.request.contextPath}/js/user.js"></script>
<script>
    $(".sex").val('${sessionScope.user.sex}');
   // console.log("${sessionScope.user}");
    //according to loftblog tut
    $(".main-menu li:first").addClass("active");

    var showSection = function showSection(section, isAnimate) {
        var direction = section.replace(/#/, ""),
            reqSection = $(".section").filter(
                '[data-section="' + direction + '"]'
            ),
            reqSectionPos = reqSection.offset().top - 0;

        if (isAnimate) {
            $("body, html").animate(
                {
                    scrollTop: reqSectionPos
                },
                800
            );
        } else {
            $("body, html").scrollTop(reqSectionPos);
        }
    };

    var checkSection = function checkSection() {
        $(".section").each(function() {
            var $this = $(this),
                topEdge = $this.offset().top - 80,
                bottomEdge = topEdge + $this.height(),
                wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
                var currentId = $this.data("section"),
                    reqLink = $("a").filter("[href*=\\#" + currentId + "]");
                reqLink
                    .closest("li")
                    .addClass("active")
                    .siblings()
                    .removeClass("active");
            }
        });
    };

    $(".main-menu").on("click", "a", function(e) {
        e.preventDefault();
        showSection($(this).attr("href"), true);
    });

    $(window).scroll(function() {
        checkSection();
    });
</script>
</body>
</html>
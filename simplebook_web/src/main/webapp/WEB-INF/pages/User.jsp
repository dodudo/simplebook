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

    <!--Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user.css">

</head>

<body>
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
                <div class="image">
                    <a href="#"><img src="${sessionScope.user.headImgs}" alt="" /></a>
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

    <!-- my attention 我的关注 -->
    <section class="section my-services" data-section="section2">
        <div class="container">
            <div class="section-heading">
                <h2>我的文章</h2>
                <div class="line-dec"></div>
                <span></span>
            </div>
            <div class="row" id="article_list">
                <%--第一个文章--%>
                <div class="col-md-12">
                    <div class="service-item" style="padding: 20px">
                        <a href="essay-detail" class="media">
                            <div class="media-left media-middle">
                                <img class="media-object" src="..." alt="...">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">Middle aligned media</h4>
                                <p>
                                    Phasellus non convallis dolor. Integer tempor hendrerit arcu
                                    at bibendum. Sed ac ante non metus vehicula congue quis eget
                                    eros.
                                </p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /my attention 我的关注 -->

    <%--<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >建站模板</a></div>--%>

    <!-- 我的文章 -->
    <section class="section my-work" data-section="section3">
        <div class="container">
            <div class="section-heading">
                <h2>My Work</h2>
                <div class="line-dec"></div>
                <!-- 签名？ -->
                <span
                >Aenean sollicitudin ex mauris, lobortis lobortis diam euismod sit
              amet. Duis ac elit vulputate, lobortis arcu quis, vehicula
              mauris.</span
                >
            </div>
            <div class="row">
                <div class="isotope-wrapper">
                    <!-- 文章分类，分为全部，人文，自然等.... -->
                    <form class="isotope-toolbar">
                        <label
                        ><input
                                type="radio"
                                data-type="*"
                                checked=""
                                name="isotope-filter"
                        />
                            <span>all</span></label
                        >
                        <label
                        ><input
                                type="radio"
                                data-type="people"
                                name="isotope-filter"
                        />
                            <span>people</span></label
                        >
                        <label
                        ><input
                                type="radio"
                                data-type="nature"
                                name="isotope-filter"
                        />
                            <span>nature</span></label
                        >
                        <label
                        ><input
                                type="radio"
                                data-type="animals"
                                name="isotope-filter"
                        />
                            <span>animals</span></label
                        >
                    </form>
                    <div class="isotope-box">
                        <!-- 第一个first，下面有个data-type="?" ?就是分类的名字 -->
                        <div class="isotope-item" data-type="nature">
                            <figure class="snip1321">
                                <img
                                        src="${pageContext.request.contextPath}/assets/images/portfolio-01.jpg"
                                        alt="sq-sample26"
                                />
                                <figcaption>
                                    <a
                                            href="${pageContext.request.contextPath}/assets/images/portfolio-01.jpg"
                                            data-lightbox="image-1"
                                            data-title="Caption"
                                    ><i class="fa fa-search"></i
                                    ></a>
                                    <a href="essay-detail">
                                        <h4>First Title</h4>
                                        <span>free to use our template</span>
                                    </a>
                                </figcaption>
                            </figure>
                        </div>

                        <%--第二个--%>

                        <div class="isotope-item" data-type="people">
                            <figure class="snip1321">
                                <img
                                        src="${pageContext.request.contextPath}/assets/images/portfolio-02.jpg"
                                        alt="sq-sample26"
                                />
                                <figcaption>
                                    <a
                                            href="${pageContext.request.contextPath}/assets/images/portfolio-02.jpg"
                                            data-lightbox="image-1"
                                            data-title="Caption"
                                    ><i class="fa fa-search"></i
                                    ></a>
                                    <a href="essay-detail">
                                        <h4>Second Title</h4>
                                        <span>please tell your friends</span>
                                    </a>
                                </figcaption>
                            </figure>
                        </div>
                        <%--第三个--%>
                        <div class="isotope-item" data-type="animals">
                            <figure class="snip1321">
                                <img
                                        src="${pageContext.request.contextPath}/assets/images/portfolio-03.jpg"
                                        alt="sq-sample26"
                                />
                                <figcaption>
                                    <a
                                            href="${pageContext.request.contextPath}/assets/images/portfolio-03.jpg"
                                            data-lightbox="image-1"
                                            data-title="Caption"
                                    ><i class="fa fa-search"></i
                                    ></a>
                                    <a href="essay-detail">
                                        <h4>Item Third</h4>
                                        <span>customize anything</span>
                                    </a>
                                </figcaption>
                            </figure>
                        </div>
                        <%--第四个--%>
                        <div class="isotope-item" data-type="people">
                            <figure class="snip1321">
                                <img
                                        src="${pageContext.request.contextPath}/assets/images/portfolio-04.jpg"
                                        alt="sq-sample26"
                                />
                                <figcaption>
                                    <a
                                            href="${pageContext.request.contextPath}/assets/images/portfolio-04.jpg"
                                            data-lightbox="image-1"
                                            data-title="Caption"
                                    ><i class="fa fa-search"></i
                                    ></a>
                                    <a href="essay-detail">
                                        <h4>Item Fourth</h4>
                                        <span>Re-distribution not allowed</span>
                                    </a>
                                </figcaption>
                            </figure>
                        </div>
                        <%--第五个--%>
                        <div class="isotope-item" data-type="nature">
                            <figure class="snip1321">
                                <img
                                        src="${pageContext.request.contextPath}/assets/images/portfolio-05.jpg"
                                        alt="sq-sample26"
                                />
                                <figcaption>
                                    <a
                                            href="${pageContext.request.contextPath}/assets/images/portfolio-05.jpg"
                                            data-lightbox="image-1"
                                            data-title="Caption"
                                    ><i class="fa fa-search"></i
                                    ></a>
                                    <a href="essay-detail">
                                        <h4>Fifth Awesome</h4>
                                        <span>Ut sollicitudin risus</span>
                                    </a>
                                </figcaption>
                            </figure>
                        </div>
                        <%--第六个--%>
                        <div class="isotope-item" data-type="animals">
                            <figure class="snip1321">
                                <img
                                        src="${pageContext.request.contextPath}/assets/images/portfolio-06.jpg"
                                        alt="sq-sample26"
                                />
                                <figcaption>
                                    <a
                                            href="${pageContext.request.contextPath}/assets/images/portfolio-06.jpg"
                                            data-lightbox="image-1"
                                            data-title="Caption"
                                    ><i class="fa fa-search"></i
                                    ></a>
                                    <a href="essay-detail">
                                        <h4>Awesome Sixth</h4>
                                        <span>Donec eget massa ante</span>
                                    </a>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /我的文章 -->

    <!-- 修改个人信息 -->
    <section class="section contact-me" data-section="section4">
        <div class="container">
            <div class="section-heading">
                <h2>Modify</h2>
                <div class="line-dec"></div>
                <span
                >Fusce eget nibh nec justo interdum condimentum. Morbi justo ex,
              efficitur at ante ac, tincidunt maximus ligula. Lorem ipsum dolor
              sit amet, consectetur adipiscing elit.</span
                >
            </div>
            <div class="row">
                <div class="right-content">
                    <div class="container">
                        <form id="contact" action="" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <fieldset>
                                        <input class="aa"
                                               name="name"
                                               type="text"
                                               class="form-control"
                                               id="name"
                                               placeholder="Your name..."
                                               required=""
                                        />
                                    </fieldset>
                                </div>
                                <div class="col-md-6">
                                    <fieldset>
                                        <input class="aa"
                                               name="email"
                                               type="text"
                                               class="form-control"
                                               id="email"
                                               placeholder="Your email..."
                                               required=""
                                        />
                                    </fieldset>
                                </div>
                                <div class="col-md-6">
                                    <fieldset>
                                        <input
                                                name="phone"
                                                type="text"
                                                class="form-control"
                                                id="phone"
                                                placeholder="Your phone..."
                                                required=""
                                        />
                                    </fieldset>
                                </div>
                                <div class="col-md-6">
                                    <fieldset>
                                        <input
                                                name="birthday"
                                                type="date"
                                                class="form-control"
                                                id="birthday"
                                                placeholder="Your birthday..."
                                                required=""
                                        />
                                    </fieldset>
                                </div>

                                <div class="col-md-6" style="margin-left: 250px;">
                                    <fieldset>
                                        <div style="width: 50px;float: left;" >
                                            <input
                                                    name="sex"
                                                    type="radio"
                                                    class="form-control"
                                                    id="boy"
                                                    value=""
                                                    required=""
                                            /><label>男</label>
                                        </div>

                                        <div style="width: 50px;float: right;">
                                            <input
                                                    name="sex"
                                                    type="radio"
                                                    class="form-control"
                                                    id="girl"
                                                    value=""
                                                    required=""
                                            /><label>女</label>
                                        </div>

                                    </fieldset>
                                </div>
                                <div class="col-md-6">
                                    <fieldset>
                                        <input  style="border:0px;width:250px;background-color:#e3dbdb00;"
                                                name="title"
                                                type="file"
                                                class="form-control"
                                                id="title"
                                                value=""
                                                required=""
                                        />
                                    </fieldset>
                                </div>
                                <div class="col-md-12">
                                    <fieldset>
                          <textarea
                                  name="message"
                                  rows="6"
                                  class="form-control"
                                  id="message"
                                  placeholder="Your message..."
                                  required=""
                          ></textarea>
                                    </fieldset>
                                </div>
                                <div class="col-md-12">
                                    <fieldset>
                                        <button type="submit" id="form-submit" class="button">
                                            Send Message
                                        </button>

                                    </fieldset>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /修改个人信息 -->

</div>

<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/isotope.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/owl-carousel.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/lightbox.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user.js"></script>
<script>
    console.log("${sessionScope.user}");
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
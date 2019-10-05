

<%--
  Created by IntelliJ IDEA.
  User: Administream
  Date: 2019/9/11
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<header class="navigation">
  <nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="index"><img class="img-fluid" src="${pageContext.request.contextPath}/images/logo.png" alt="parsa"></a>
    <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#navogation"
            aria-controls="navogation" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <!-- 导航栏 -->
    <div class="collapse navbar-collapse text-center" id="navogation">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link text-uppercase text-dark dropdown-toggle" href="#" id="navbarDropdown"
             role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Home
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
             role="button" aria-haspopup="true" aria-expanded="false">
            <img style="width: 51px;margin-top:-20px;" src='${sessionScope.user.headImgs}' alt="parsa">
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="login">
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

<!-- 最热文章 -->
<section>
  <div class="container-fluid p-sm-0">
    <div class="row featured-post-slider">

<%--    <c:forEach var="top" items="${articleList}">
       <div class="col-lg-3 col-sm-6 mb-2 mb-lg-0 px-1">
         <article class="card bg-dark text-center text-white border-0 rounded-0">
           <img class="card-img rounded-0 img-fluid w-100" src="${pageContext.request.contextPath}/images/featured-post/${top.headurl}" alt="post-thumb">
           <div class="card-img-overlay">
             <div class="card-content">
               <p class="text-uppercase">${top.head}</p>
               <h4 class="card-title mb-4"><a class="text-white" href="essay-detail.jsp">${top.describe}</a></h4>
               <a class="btn btn-outline-light" href="essay-detail.jsp">read more</a>
             </div>
           </div>
         </article>
       </div>
     </c:forEach>--%>

      <div class="col-lg-3 col-sm-6 mb-2 mb-lg-0 px-1">
        <article class="card bg-dark text-center text-white border-0 rounded-0">
          <img class="card-img rounded-0 img-fluid w-100" src="${pageContext.request.contextPath}/images/featured-post/post-1.jpg" alt="post-thumb">
          <div class="card-img-overlay">
            <div class="card-content">
              <p class="text-uppercase">LifeStyle</p>
              <h4 class="card-title mb-4"><a class="text-white" href="essay-detail.jsp">Organize Your Life With 10
                Simple rule</a></h4>
              <a class="btn btn-outline-light" href="essay-detail.jsp">read more</a>
            </div>
          </div>
        </article>
      </div>

       <div class="col-lg-3 col-sm-6 mb-2 mb-lg-0 px-1">
         <article class="card bg-dark text-center text-white border-0 rounded-0">
           <img class="card-img rounded-0 img-fluid w-100" src="${pageContext.request.contextPath}/images/featured-post/post-1.jpg" alt="post-thumb">
           <div class="card-img-overlay">
             <div class="card-content">
               <p class="text-uppercase">LifeStyle</p>
               <h4 class="card-title mb-4"><a class="text-white" href="essay-detail.jsp">Organize Your Life With 10
                 Simple rule</a></h4>
               <a class="btn btn-outline-light" href="essay-detail.jsp">read more</a>
             </div>
           </div>
         </article>
       </div>

       <div class="col-lg-3 col-sm-6 mb-2 mb-lg-0 px-1">
         <article class="card bg-dark text-center text-white border-0 rounded-0">
           <img class="card-img rounded-0 img-fluid w-100" src="${pageContext.request.contextPath}/images/featured-post/post-1.jpg" alt="post-thumb">
           <div class="card-img-overlay">
             <div class="card-content">
               <p class="text-uppercase">LifeStyle</p>
               <h4 class="card-title mb-4"><a class="text-white" href="essay-detail.jsp">Organize Your Life With 10
                 Simple rule</a></h4>
               <a class="btn btn-outline-light" href="essay-detail.jsp">read more</a>
             </div>
           </div>
         </article>
       </div>

       <div class="col-lg-3 col-sm-6 mb-2 mb-lg-0 px-1">
         <article class="card bg-dark text-center text-white border-0 rounded-0">
           <img class="card-img rounded-0 img-fluid w-100" src="${pageContext.request.contextPath}/images/featured-post/post-1.jpg" alt="post-thumb">
           <div class="card-img-overlay">
             <div class="card-content">
               <p class="text-uppercase">LifeStyle</p>
               <h4 class="card-title mb-4"><a class="text-white" href="essay-detail.jsp">Organize Your Life With 10
                 Simple rule</a></h4>
               <a class="btn btn-outline-light" href="essay-detail.jsp">read more</a>
             </div>
           </div>
         </article>
       </div>

    </div>
  </div>
</section>
<!-- /最热文章 -->

<!-- 文章列表 -->
<section class="section">
  <div class="container">

    <div class="row masonry-container">
    <c:forEach var="alist" items="${pageInfo.list}">
      <div class="col-lg-4 col-sm-6 mb-5">
        <article class="text-center">
          <img class="img-fluid mb-4" src="${pageContext.request.contextPath}/images/masonary-post/${alist.headurl}" alt="post-thumb">
          <p class="text-uppercase mb-2">TRAVEL</p>
          <h4 class="title-border"><a class="text-dark" href="essay-detail.jsp">${alist.head}</a></h4>
          <p>${alist.describe}</p>
          <a href="${pageContext.request.contextPath}/article/findArticleByAId?articleId=${alist.articleId}" class="btn btn-transparent">read more</a>
        </article>
      </div>
    </c:forEach>
    </div>

    <div class="row">
      <div class="col-12">
        <nav>
          <ul class="pagination justify-content-center align-items-center">
            <li class="page-item">
              <span class="page-link">&laquo; Previous</span>
            </li>
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/article/findAll?page=1&size=${pageInfo.pageSize}">首页</a></li>
            <%--<li class="page-item active">
              <a class="page-link" href="${pageContext.request.contextPath}/article/findAll?page=1&size=${pageInfo.pageSize}">
              <span class="page-link">02</span>
              </a>
            </li>--%>
            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
              <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/article/findAll?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>
              </li>
            </c:forEach>
            <li class="page-item">
              <a class="page-link" href="${pageContext.request.contextPath}/article/findAll?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">Next &raquo;</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</section>
<!-- /文章列表 -->

<!-- instagram -->
<section>
  <div class="container-fluid px-0">
    <div class="row no-gutters instagram-slider" id="instafeed" data-userId="4044026246"
         data-accessToken="4044026246.1677ed0.8896752506ed4402a0519d23b8f50a17"></div>
  </div>
</section>
<!-- /instagram -->

<footer>
  <div class="section">
    <div class="container">
      <div class="row">
        <div class="col-md-3 col-sm-6 mb-4 mb-md-0">
          <a href="index"><img src="${pageContext.request.contextPath}/images/logo.png" alt="persa" class="img-fluid"></a>
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
          <span class="font-secondary text-dark mr-3">Follow</span>
          <ul class="list-inline d-inline-block">
            <li class="list-inline-item"><a href="#" class="text-dark"><i class="ti-facebook"></i></a></li>
            <li class="list-inline-item"><a href="#" class="text-dark"><i class="ti-twitter-alt"></i></a></li>
            <li class="list-inline-item"><a href="#" class="text-dark"><i class="ti-linkedin"></i></a></li>
            <li class="list-inline-item"><a href="#" class="text-dark"><i class="ti-github"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- <div class="text-center">
    <p>Copyright ©<script>var CurrentYear = new Date().getFullYear()
    document.write(CurrentYear)</script> a theme by themefisher / More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
  </div> -->
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

</body>
</html>

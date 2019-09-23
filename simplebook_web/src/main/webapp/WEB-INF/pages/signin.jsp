<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html  lang="en">

    <head>
        <!-- meta data -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!--font-family-->
		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&amp;subset=devanagari,latin-ext" rel="stylesheet">
        
        <!-- title of site -->
        <title>登录</title>

        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
		
		<!--animate.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.css">
		
        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
		
		<!-- bootsnav -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootsnav.css" >
        
        <!--style.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		
        <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sign.css">
    </head>
	
	<body>
		<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
		
		<!-- signin end -->
		<section class="signin" >
			<div class="container">

				<div class="sign-content">
					<h2>登录</h2>

					<div class="row">
						<div class="col-sm-12">
							<div class="signin-form">
								<form action="/user/login" method="post" id="login_form">
									<div class="form-group">
									    <label for="uname">邮箱/用户名 <i class="uname-warm"></i></label>
									    <input type="email" name="uname" onblur="checkUserInput()" class="form-control" id="uname" placeholder="请输入您的邮箱/用户名">
									</div><!--/.form-group -->
									<div class="form-group">
										<label for="password">密码 <i class="password-warm"></i></label>
									    <input type="password" onblur="checkPwd()" name="upassword" class="form-control" id="password" placeholder="请输入您的密码">
									</div><!--/.form-group -->
								</form><!--/form -->
							</div><!--/.signin-form -->
						</div><!--/.col -->
					</div><!--/.row -->

					<div class="row">
						<div class="col-sm-12">
							<div class="signin-password">
								<div class="password-circle">
									<%--<div class="single-password-circle">--%>
										<%--<input type="radio" id="radio01" name="radio">--%>
											<%--<label for="radio01">--%>
												<%--<span class="round-boarder">--%>
													<%--<span class="round-boarder1"></span>--%>
												<%--</span>remember password--%>
											<%--</label>--%>
									<%--</div><!--/.single-password-circle-->--%>
									<div class="single-forgot-password-circle text-right
									">
									</div><!--/.single-password-circle-->
								</div><!--/.password-circle-->
							</div><!--/.signin-password -->
						</div><!--/.col -->
					</div><!--/.row -->

					<div class="row">
						<div class="col-sm-12">
							<div class="signin-footer">
								<button type="button" id="login_btn" onclick="login()" class="btn signin_btn signin_btn_two"  >
								登录
								</button>
								<p>
									没有账号？
									<a href="register">注册</a>
								</p>
							</div><!--/.signin-footer -->
						</div><!--/.col -->
					</div><!--/.row -->

				</div><!--/.sign-content -->


			</div><!--/.container -->

		</section><!--/.signin -->


        <%--//验证拼图模态框--%>
        <div class="modal fade bs-example-modal-sm" tabindex="-1" style="margin-top: 200px" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" style="width: 400px;" role="document">
                <div class="modal-content" style="padding: 20px">

                    <div id="container"></div>
                    <p id="checkMsg" style="text-align: center;margin-top: 6px"></p>
                </div>

            </div>
        </div>
		<!-- signin end -->
        <%--/登录信息模态框--%>


        <div class="modal fade bs-example-modal-sm1" style="box-shadow: none;" id="loginInfo" tabindex="-1"  role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" style="width: 200px;height: 50px" role="document">
                <div class="modal-content" style="text-align: center;padding: 20px">
                   <p style="color: red;">${requestScope.get("login-msg")}</p>
                </div>
            </div>
        </div>

		<!--footer copyright start -->
		<footer class="footer-copyright">
			<div id="scroll-Top">
				<i class="fa fa-angle-double-up return-to-top" id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
			</div><!--/.scroll-Top-->

		</footer><!--/.hm-footer-copyright-->
		<!--footer copyright  end -->


		 <!-- Include all js compiled plugins (below), or include individual files as needed -->

		<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
        
        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
		
		<!--bootstrap.min.js-->
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		
		<!-- bootsnav js -->
		<script src="${pageContext.request.contextPath}/assets/js/bootsnav.js"></script>
		
		<!-- jquery.sticky.js -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.sticky.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
		
        
        <!--Custom JS-->
        <script src="${pageContext.request.contextPath}/assets/js/custom1.js"></script>
		<script src="${pageContext.request.contextPath}/js/jigsaw.min.js"></script>

		<script src="${pageContext.request.contextPath}/js/check.js"></script>
		<script src="${pageContext.request.contextPath}/js/signin.js"></script>
        <script>

            if ("${requestScope.get("login-msg")}".trim() != ""){
                $("#loginInfo").modal("show");
				$(".modal-backdrop").remove();
				setTimeout('$("#loginInfo").modal("hide");',1500);
            }else {
                $("#loginInfo").modal("hide");
            }
        </script>
    </body>

</html>
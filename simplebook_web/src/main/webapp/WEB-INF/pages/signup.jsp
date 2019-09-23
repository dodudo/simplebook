<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <title>Sign up</title>

        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">
		
        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- bootsnav -->
		<link rel="stylesheet" href="assets/css/bootsnav.css" >	
        
        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">

		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sign.css">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		
        <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
	
	<body>
		<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
		
		<!-- signin end -->
		<section class="signin signup">
			<div class="container">

				<div class="sign-content">
					<h2>注册</h2>

					<div class="signin-form">
						<div class=" ">
							<div class=" ">
								<form action="user/addUser" method="post" id="signup_form">
									<div class="form-group">
										<label for="uname">昵称 <i class="uname-warm"></i></label>
										<input type="text" onblur="checkUser()" name="uname" class="form-control" id="uname" placeholder="您的昵称">
									</div><!--/.form-group -->
									<div class="form-group">
										<label for="email">邮箱 <i class="email-warm"></i></label>
										<input type="text" onblur="checkEmail()" name="email" class="form-control" id="email" placeholder="您的邮箱">
									</div><!--/.form-group -->
									<div class="form-group">
										<label for="password">密码 <i class="password-warm"></i></label>
										<input type="password" onblur="checkPwd()" name="upassword" class="form-control" id="password" placeholder="请填写您的密码">
									</div><!--/.form-group -->
									<div class="form-group">
										<label for="repassword">确认密码 <i class="repassword-warm"></i></label>
										<input type="password" onblur="checkRepwd()" class="form-control" id="repassword" placeholder="请确认您的密码">
									</div><!--/.form-group -->
									<div class="form-group">
										<label for="email-check">邮箱验证码 <i class="email-check-warm"></i></label>
										<input type="number" onblur="emailCheck()" name="checkCode"  class="form-control" id="email-check" placeholder="请填写您的邮箱验证码">
										<p onclick="checkEmailCode()" class="btn btn-info check-code">获取验证码</p>
									</div><!--/.form-group -->

								</form><!--/form -->
							</div><!--/.col -->
						</div><!--/.row -->

					</div><!--/.signin-form -->
					<div class="signin-password">
						<div class="password-circle">

						</div><!--/.password-circle-->
					</div><!--/.signin-password -->

					<div class="signin-footer">
						<button type="button" class="btn signin_btn" id="signin_btn"  >
						注册
						</button>
						<p class="had-account">
							已有账号？
							<a href="${pageContext.request.contextPath}/login">登录</a>
						</p>
					</div><!--/.signin-footer -->

				</div><!--/.sign-content -->
			</div><!--/.container -->

		</section><!--/.signin -->
		
		<!-- signin end -->

		<!--footer copyright start -->
		<footer class="footer-copyright">
			<div id="scroll-Top">
				<i class="fa fa-angle-double-up return-to-top" id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="false"></i>
			</div><!--/.scroll-Top-->

		</footer><!--/.hm-footer-copyright-->
		<!--footer copyright  end -->


		 <!-- Include all js compiled plugins (below), or include individual files as needed -->

		<script src="assets/js/jquery.js"></script>
        
        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
		
		<!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- bootsnav js -->
		<script src="assets/js/bootsnav.js"></script>
		
		<!-- jquery.sticky.js -->
		<script src="assets/js/jquery.sticky.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
		
        
        <!--Custom JS-->
        <script src="assets/js/custom1.js"></script>
		<%--引入jquery--%>
		<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>

		<%--引入check.js--%>
		<script src="${pageContext.request.contextPath}/js/check.js"></script>

		<%--引入signup.js--%>
		<script src="${pageContext.request.contextPath}/js/signup.js"></script>
    </body>
	
</html>
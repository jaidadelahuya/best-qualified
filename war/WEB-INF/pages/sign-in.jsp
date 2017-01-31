<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Best Qualified Sign In</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="/styles/bootstrap.min.css" rel="stylesheet">
<link href="/styles/bootflat.min.css" rel="stylesheet">
<link href="/styles/font-awesome.min.css" rel="stylesheet">
<link href="/styles/main.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Corben"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Nobile"
	rel="stylesheet" type="text/css">
<style type="text/css">
.module-div {
	border: 1px solid gray;
	padding-top: 4%;
	padding-bottom: 2%;
	text-align: center;
}

html,body {
	height: 100%;
}

#main-body {
	height: 100%;
	background: rgba(135, 206, 250, 0.3);
	/* For browsers that do not support gradients */
	background: -webkit-linear-gradient(rgba(122, 149, 192, 0.3),
		rgba(135, 206, 250, 0.2), rgba(135, 206, 250, 0.1));
	/* For Safari 5.1 to 6.0 */
	background: -o-linear-gradient(rgba(122, 149, 192, 0.3),
		rgba(135, 206, 250, 0.2), rgba(135, 206, 250, 0.1));
	/* For Opera 11.1 to 12.0 */
	background: -moz-linear-gradient(rgba(122, 149, 192, 0.3),
		rgba(135, 206, 250, 0.2), rgba(135, 206, 250, 0.1));
	/* For Firefox 3.6 to 15 */
	background: linear-gradient(rgba(122, 149, 192, 0.3),
		rgba(135, 206, 250, 0.2), rgba(135, 206, 250, 0.1));
	/* Standard syntax */
}

.module-title {
	border: 1px gray solid;
	border-top-right-radius: 10px;
	-moz-border-top-right-radius: 10px;
	-webkit-border-top-right-radius: 10px;
	border-top-left-radius: 10px;
	-moz-border-top-left-radius: 10px;
	-webkit-border-top-left-radius: 10px;
	padding: 1%;
	font-family: roboto;
	font-weight: bold;
	margin-top: 2%;
	color: white;
	background: gray; /* For browsers that do not support gradients */
	background: -webkit-linear-gradient(black, gray);
	/* For Safari 5.1 to 6.0 */
	background: -o-linear-gradient(black, gray);
	/* For Opera 11.1 to 12.0 */
	background: -moz-linear-gradient(black, gray);
	/* For Firefox 3.6 to 15 */
	background: linear-gradient(black, gray);
}



.login-header {
	border-radius-top: 3px;
	border: 2px solid rgb(128, 128, 128);
	width: 40%;
	border-bottom: none;
	padding: 1%;
	padding-left: 2%;
	border-top-right-radius: 10px;
	-moz-border-top-right-radius: 5px;
	-webkit-border-top-right-radius: 5px;
	font-size: 14pt;
	font-weight: bold;
	color: white;
	background-color: rgb(128, 128, 128);
	background-color: rgba(128, 128, 128, 0.5);
	font-family: 'Corben', Georgia, Times, serif !important;
}

@
keyframes example {
	from {background-color: white;
}

to {
	background-color: yellow;
}

}

/* The element to apply the animation to */
.module-text {
	animation-name: example;
	animation-duration: infinite;
	font-family: roboto;
	font-size: 9pt;
}

.login-btn {
	color: rgb(241, 241, 241);
	background-color: rgb(72,103,170);
	font-size: 14pt;
	font-family: 'Corben', Georgia, Times, serif !important;
	font-weight: bold;
	padding: 1%;
	padding-right: 2%;
	padding-left: 2%;
	border-radius: 7px;
	-moz-border-radius: 7px;
	-webkit-border-radius: 7px;
	border: none;
}

.login-btn:hover {
	background-color: rgb(73,96,160);
}

.login-body {
	border: 2px rgb(128, 128, 128) solid;
	padding: 4%;
	background: url('/images/concrete_seamless.png');
}

.module-image {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

#main-header {
	border-bottom: 1px solid #cacaca;
	padding: 1%;
	text-align: center;
	background-color: rgba(59, 89, 152, 0.6)
}

h1,h2,h3,h4,h5,h6 {
	font-family: 'Corben', Georgia, Times, serif !important;
}

p,div {
	font-family: 'Nobile', Helvetica, Arial, sans-serif !important;
}
</style>
</head>
<body style="height: 100%; background: url('/images/world-map-5.png');">
	<div class="row" id="main-header">
		<a href="/index"><img alt="" src="/images/bq-logo.png"></a>
	</div>
	<div class="row" style="height: 100%;" id="main-body">
		<div class="col-sm-6 hidden-xs" style="">
			<h3
				style="text-align: center; margin-top: 8%; text-shadow: 1px 1px 1px #ccc;">Leading
				Sales & Marketing Career Site</h3>
			<div class="col-sm-8 col-sm-offset-2 no-padding-div"
				style="border: 1px solid gray; z-index: 100">

				<div class="col-sm-12 col-md-6 module-div career-mobility"
					style="background-color: rgba(0, 175, 239, 0.2)">
					<div class="col-sm-12" style="text-align: center">
						<a style="color: white;" href="/bq/open/all-jobs"><img
							class="img img-responsive module-image" alt=""
							src="/images/jobs-icons.png"></a>
					</div>
					<div class="col-sm-12 module-title">
						<a style="color: white;" href="/bq/open/all-jobs"><span
							class="module-text">Career Mobility</span></a>
					</div>
				</div>
				<div class="col-sm-12 col-md-6 module-div certification"
					style="background-color: rgba(247, 139, 50, 0.2)">
					<div class="col-sm-12">
						<a href="/bq/certifications"><img
							class="img img-responsive module-image" alt=""
							src="/images/certification-icons.png"></a>
					</div>
					<div class="col-sm-12 module-title">
						<a style="color: white" href="/bq/certificationsl"><span
							class="module-text">Demonstrate Your Ability</span></a>
					</div>
				</div>
				<div class="col-sm-12 col-md-6 module-div"
					style="background-color: rgba(123, 175, 64, 0.2)">
					<div class="col-sm-12">
						<a href="/bq/coaching/home"><img
							class="img img-responsive module-image" alt=""
							src="/images/coaching-icons.png"></a>
					</div>
					<div class="col-sm-12 module-title">
						<a style="color: white" href="/bq/coaching/home"><span
							class="module-text">Guidance & Hand Holding</span></a>
					</div>
				</div>
				<div class="col-sm-12 col-md-6 module-div"
					style="background-color: rgba(227, 7, 7, 0.2)">
					<div class="col-sm-12">
						<a href="/bq/community/home"><img
							class="img img-responsive module-image" alt=""
							src="/images/network.png"></a>
					</div>
					<div class="col-sm-12 module-title">
						<a style="color: white" href="/bq/community/home"><span
							class="module-text">Our Network</span></a>

					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="login-div">
				<div class="login-header">Account Login</div>
				<div class="login-body">
				<c:choose>
					<c:when test="${not empty passwordChangeSuccess}">
						<div id='msg-div' class="bq-alert bq-alert-success">
							<c:out value='${passwordChangeSuccess}' />
						</div>
					</c:when>
					<c:when test="${not empty signinError}">
						<div id='msg-div' class="bq-alert bq-alert-danger">
							<c:out value='${signinError}' />
						</div>
					</c:when>
				</c:choose>
					<form id="sign-in-form" method="post"
						action="<c:url value='/end-point/sign-in' />">
						<div class="form-group">
							<input name="email" value="${sinEmail}" class="form-control"
								placeholder="EMail" />
						</div>
						<div style="text-align: right; font-family: calibri">
							<a href="/endpoint/forgot-password" style="font-weight: bold;">Forgot Password?</a>
						</div>
						<div class="form-group">
							<input class="form-control" type="password" name="password"
								placeholder="Password">
						</div>
						<div class="form-group">
							<input class="login-btn" type="submit" value="Login In">
							Don't have an account?<a href="/sign-up-page" style="font-weight: bold;">
								Sign Up </a>
						</div>
					</form>
					<hr style="background-color: #cacaca; height: 1px" />
					<div>
						<strong class="text-muted"> Social Login</strong>
						<ul class="flat-social" style="display: inline;">
							<li><a href="/bq/open/facebook-sign-in"
								class="social-facebook" rel="external"><i
									class="fa fa-facebook"></i> <span>Facebook</span></a></li>
							<!-- <li><a href="#" class="social-twitter" rel="external"
										target="_blank"><i class="fa fa-twitter"></i> <span>Twitter</span></a></li> -->
							<!-- <li><a href="#" class="social-google" rel="external"
										target="_blank"><i class="fa fa-google-plus"></i> <span>Google
												+</span></a></li> -->
							<li><a href="/bq/open/linkedin-sign-in"
								class="social-linkedin" rel="external"><i
									class="fa fa-linkedin"></i> <span>LinkedIn</span></a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

</body>
</html>
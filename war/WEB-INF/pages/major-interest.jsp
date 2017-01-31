<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page
	import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@ page import="com.google.appengine.api.blobstore.UploadOptions"%>
<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();
	UploadOptions options = UploadOptions.Builder
			.withMaxUploadSizeBytesPerBlob(2 * 1024 * 1024)
			.maxUploadSizeBytes(2 * 1024 * 1024);
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Choose your major interest</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="/styles/bootstrap.min.css" rel="stylesheet">
<link href="/styles/bootflat.min.css" rel="stylesheet">
<link href="/styles/font-awesome.min.css" rel="stylesheet">
<link href="/styles/jquery-ui.min.css" rel="stylesheet">
<link href="/styles/main.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Corben"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Nobile"
	rel="stylesheet" type="text/css">
<style type="text/css">
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

.login-header {
	border-radius-top: 3px;
	border: 2px solid rgb(128, 128, 128);
	width: 50%;
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

.login-btn {
	color: rgb(241, 241, 241);
	background-color: rgb(72, 103, 170);
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
	background-color: rgb(73, 96, 160);
}

.login-body {
	border: 2px rgb(128, 128, 128) solid;
	padding: 4%;
	background: url('/images/concrete_seamless.png');
}

#main-header {
	border-bottom: 1px solid #cacaca;
	padding: 1%;
	text-align: center;
	background-color: rgba(59, 89, 152, 0.6)
}

h1,h2,h3,h4,h5,h6 {
	font-family: 'Corben', Georgia, Times, serif;
}

p,div {
	font-family: 'Nobile', Helvetica, Arial, sans-serif;
}
</style>
</head>
<body style="height: 100%; background: url('/images/world-map-5.png');">
	<div class="row" id="main-header">
		<a href="/index"><img alt="" src="/images/bq-logo.png"></a>
	</div>
	<div class="row" style="height: 100%;" id="main-body">

		<div class="col-sm-12">
			<h3 class="format">
				<span class="qualified">Hello <c:out
						value='${user.firstName}' />,
				</span><span class="best">Let's help you get started...</span>
			</h3>
			<div class="login-div-2" style="margin-top: 2%;">
				<div class="login-header">Select your major interest</div>
				<div class="login-body" style="overflow: auto;">
					<div class="col-sm-12">
						<h4 class="text-muted" style="margin: 0px; margin-bottom: 5px">How
							do you want to use BQ?</h4>
						<p class="text-info">
							<i>You can change this anytime in your settings</i>
						</p>
					</div>

					<div class="col-sm-12"
						style="background-color: white; border: 1px solid #cacaca; padding: 2%; font-size: 130%; margin-bottom: 2%;">
						<div class="form-group">
							<div class="col-sm-12">
								<div class="radio">
									<label><input class="mj" type="radio" name="interest">Find
										a job</label>
								</div>
							</div>

							<div class="col-sm-12 mi-content" style="display: none;">
								<form id="find-a-job" enctype="multipart/form-data"
									action='<%=blobstoreService.createUploadUrl(
					"/bq/endpoint/find-a-job-user", options)%>'
									method="post">
									<div class="row">
										<div class="form-group col-sm-12">
											<p class="text-info" style="color: red; font-size: 10pt">*
												All fields are required</p>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-sm-6">
											<input class="form-control" type="tel" name="mobile-number"
												placeholder="* Mobile Number" required="required" />
										</div>
										<div class="form-group col-sm-6">
											<input class="form-control datepicker" name="dob"
												placeholder="* Date Of Birth" required="required" />
										</div>
									</div>
									<div class="row">
										<div class="form-group col-sm-6">

											<label class="radio-inline"><input type="radio"
												value="female" name="gender">Female</label> <label
												class="radio-inline"><input type="radio"
												name="gender" value="male">Male</label>
										</div>
										<div class="form-group col-sm-6">
											<select class="form-control" name="career-level"
												required="required">
												<option value="" disabled selected hidden>* Career
													Level</option>
												<%@ include file='/partial/career-level.html' %>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-sm-6">

											<select required="required" class="form-control"
												name="educational-level">
												<option value="" disabled selected hidden>* Highest
													Education Level</option>
												<%@ include file='/partial/education.html' %>
											</select>
										</div>
										<div class="form-group col-sm-6">
											<select class="form-control" required="required"
												name="job-type">
												<option value="" disabled selected hidden>* Job
													Type</option>
												<%@ include file='/partial/job-type.html' %>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-sm-6">

											<select class="form-control" required="required"
												name="location">
												<option value="" disabled selected hidden>* Your
													Location</option>
												<%@ include file='/partial/states.html' %>
											</select>
										</div>
										<input type="hidden" name="user-type" value="PROFESSIONAL" />
										<div class="form-group col-sm-6">
											<select class="form-control" name="salary"
												required="required">
												<option value="" disabled selected hidden>* Salary</option>
												<%@ include file='/partial/salary-range.html' %>
											</select>
										</div>

									</div>
									<div class="row">
										<div class="form-group col-sm-6">
											<input class="form-control" type="number" name="experience"
												placeholder="* Years Of Experience" required="required" />
										</div>
										<div class="form-group col-sm-6">
											<input class="form-control" type="file" name="cv"
												placeholder="Upload Your CV" required="required" /> <span
												class="text-info"
												style="font-family: calibri; font-size: 11pt">*
												Upload Your CV</span>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-sm-12">
											<input type="submit" value="Continue" class="btn btn-primary">
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<div class="radio">
									<label><input class="mj" type="radio" name="interest">Connect
										with professionals</label>
								</div>
							</div>
							<input type="hidden" class="url"
								value="/partial/bq-interest.html #connect-with-professionals">
							<div class="col-sm-12 mi-content" style="display: none;">
								<form id="recruit-professionals"
									action="/bq/endpoint/default-user" method="post">
									<div class="row">
										<div class="form-group col-sm-12">
											<p class="text-info" style="color: red; font-size: 10pt">Tell
												us where you work, * All fields are required</p>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-sm-6">
											<input class="form-control" name="job-title"
												placeholder="Job Title" required="required" />
										</div>
										<div class="form-group col-sm-6">
											<input class="form-control" name="organisation"
												placeholder="Organization" required="required" />
										</div>
									</div>
									<input type="hidden" name="user-type" value="PROFESSIONAL" />
									<div class="row">
										<div class="form-group col-sm-12">
											<input type="submit" value="Continue" class="btn btn-primary">
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<div class="radio">
									<label><input class="mj" type="radio" name="interest">Recruit
										Professionals</label>
								</div>
							</div>
							<div class="col-sm-12 mi-content" style="display: none;">

								<div class="section">
									<input type="hidden" value="1" class="step">
									<form action="<c:url value='/endpoint/init-recruiter-mj1' />">
										<div class="row">
											<div class="form-group col-sm-12">
												<p class="text-info"
													style="font-size: 10pt; margin-bottom: 4px; font-weight: bold;">Tell
													Us about your organization</p>
												<p class="text-info" style="color: red; font-size: 10pt">*
													When recruiting for a third party you will be able to
													specify the company information to use</p>
											</div>
										</div>
										<div class="row">
											<div class="form-group col-sm-12">
												<div class="msg-div"></div>
											</div>
										</div>

										<div class="row">
											<div class="form-group col-sm-6">
												<input class="form-control" name="tagline"
													placeholder="* Your Job Title" required="required" />
											</div>
											<div class="form-group col-sm-6">
												<input class="form-control" name="recruiter-website"
													placeholder="Your Company Website" />
											</div>
										</div>
										<div class="row">

											<div class="form-group col-sm-12">
												<input class="form-control" name="recruiter-company-name"
													placeholder="* Your Company Name" required="required" />
											</div>
										</div>
										<div class="row">
											<div class="form-group col-sm-12">
												<input type="button" value="Continue"
													class="btn btn-primary mj-butt">
											</div>
										</div>
									</form>
								</div>
								<%@ include file="/partial/create-project.html"%>
								<%@ include file="/partial/create-job.html"%>
								<%@ include file="/partial/add-company.html"%>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
	<script src="/js/main.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			tinymce.init({
				selector : '.tiny'
			});
			$(".datepicker").datepicker({
				changeMonth : true,
				changeYear : true
			});
			$(".mj-butt").click(function() {
				var form = $(this).closest("form");
				var par = $(this).closest(".section");
				var msgD = par.find(".msg-div");
				var step = par.find(".step").val();
				$.ajax({
					url : form.prop("action"),
					method : "POST",
					data : form.serialize(),
					dataType : "json",
					success : function() {
						alert("success")
					},
					error : function(xhr) {
						console.log(xhr);
						if (xhr.status == "417") {
							addError(msgD, xhr.statusText);
						} else if (xhr.status == "200") {
							par.slideUp();
							if (step == "1") {
								$("#create-project-div").show();
							} else if (step == "2") {
								$("#create-job-div").show();
							} else if (step == "3") {
								$("#add-company-info-div").show();

							}
						}

					}

				});
			});
			$(".mj").click(function() {
				$(".mj").prop('disabled', false);
				$(this).prop('disabled', true);
				var parent = $(this).closest(".form-group");
				$(".mi-content").slideUp("fast", function() {
					setTimeout(function() {
						parent.find(".mi-content").slideDown("slow");
					}, 500);

				});

			});
		});
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${jobInformation.jobTitle}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/styles/jquery.webui-popover.min.css">
<link rel="stylesheet" href="/styles/main.css">
<link rel="canonical"
	href="http://localhost:8888/bq/open/job?job-key=${jobInformation.webKey}">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="1082599418027-i7l89ubpe432n7lfiu9jus3cc0a99vqs.apps.googleusercontent.com">
<style type="text/css">
.profile-sub-header {
	font-family: arial;
	font-weight: bold;
	font-size: 16pt;
	color: gray;
	padding-bottom: 5px;
	border-bottom: 1px #666 dotted;
}

.profile-field-div {
	margin-top: 2px;
	margin-bottom: 2px
}

.filter li {
	list-style: none;
	font-family: arial;
	border-bottom: 1px gray solid;
	padding: 3%;
}

.filter:last-child {
	border-bottom: none !important;
}
</style>
</head>
<body style="background-image: url(/images/background.jpg); background-repeat: repeat;">
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<script>
		window.twttr = (function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0], t = window.twttr || {};
			if (d.getElementById(id))
				return t;
			js = d.createElement(s);
			js.id = id;
			js.src = "https://platform.twitter.com/widgets.js";
			fjs.parentNode.insertBefore(js, fjs);

			t._e = [];
			t.ready = function(f) {
				t._e.push(f);
			};

			return t;
		}(document, "script", "twitter-wjs"));
	</script>
	<%@ include file="/main-nav.html"%>
	
	<div class="container dashboard-body"
		style="width: 80%; margin: 0 auto;margin-bottom: 2%; margin-top: 6%">

		<div class="row">
			<div class="col-md-12" style="text-align: center; padding: 2%;">
				<div class="fb-share-button"
					style="line-height: 0.7; vertical-align: baseline; display: inline-block;"
					data-href="/bq/open/job?job-key=${jobInformation.webKey}"
					data-layout="button"></div>

				<script src="//platform.linkedin.com/in.js" type="text/javascript">
					lang: en_US
				</script>
				<script type="IN/Share"
					data-url="http://localhost:8888/bq/open/job?job-key=${jobInformation.webKey}"></script>
				<div class="g-plus" data-action="share" data-annotation="none"
					data-href="http://localhost:8888/bq/open/job?job-key=${jobInformation.webKey}"></div>
				<a class="twitter-share-button"
					href="https://twitter.com/intent/tweet"></a>
				<div style="display: inline-block;">
					<a
						href="mailto:?Subject=Job recommendation from Best Qualified&amp;Body=Hello, Here%20is%20a%20job%20you%20may%20like%20${jobInformation.pageUrl}">
						<img src="/images/email-big.png" style="vertical-align: baseline;"
						alt="Email" />
					</a>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div id="msg-div"></div>
			<div class="col-sm-12"
				style="margin-bottom: 2%; background-color: white; padding-top: 2%; border: 1px #cacaca solid">
				<div class="col-sm-12 no-padding-div">
					<div class="col-sm-12 no-padding-div"
						style="background-color: #e0c4cd; margin-bottom: 2%;">
						<div class="col-sm-3" style="padding: 1%;">
							<img alt="" src="${jobInformation.pictureUrl}"
								class="img img-responsive">
						</div>
						<div class="col-sm-9">
							<h4>
								<a href="#"><c:out value="${jobInformation.jobTitle}" /></a>
							</h4>
							<h5 style="font-family: calibri">
								<c:out value="${jobInformation.companyName}" />
							</h5>
							<h5>
								<i class="text-danger" style="font-family: calibri">Posted <c:out
										value="${jobInformation.datePosted}" /></i>
							</h5>
							<p>
								<button class="btn btn-primary apply-button">Apply</button>
								<input id="web-key" type="hidden"
									value="${jobInformation.webKey}">
								<c:if test="${not empty user }">
									<c:choose>
										<c:when test="${jobInformation.saved}">
											<a class="btn  btn-danger unsave-job">Unsave</a>
										</c:when>
										<c:otherwise>
											<a class="btn  btn-success save-job">Save</a>
										</c:otherwise>
									</c:choose>

								</c:if>
							</p>
						</div>
					</div>


					<div class="col-sm-12">

						<p>${jobInformation.jobDesc}</p>
						<p>${jobInformation.jobRole}</p>
						<p>
							<button class="btn  btn-primary apply-button">Apply</button>
							<c:if test="${not empty user }">
								<c:choose>
									<c:when test="${jobInformation.saved}">
										<a class="btn  btn-danger unsave-job">Unsave</a>
									</c:when>
									<c:otherwise>
										<a class="btn  btn-success save-job">Save</a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</p>
					</div>



				</div>
			</div>
			<c:if test="${not empty jobInformation.companyDesc}">
				<div class="col-sm-12 dashboard-section">
					<h4 class="text-danger">
						About
						<c:out value='${jobInformation.companyName}' />
					</h4>
					<div class="col-sm-3">
						<img alt="" src="${jobInformation.pictureUrl}"
							class="img img-responsive">
					</div>
					<div class="col-sm-9">
						<p ${jobInformation.companyDesc}</p>
					</div>
				</div>
			</c:if>
		</div>
		<div class="col-sm-4">
			<div class="col-sm-12 discussion-sidebar"
				style="background-color: #69a24e; color: white">
				<h4 style="border-bottom: 1px white solid; padding-bottom: 4px">Job Summary</h4>
				<c:if test='${not empty jobInformation.companyName}'>
					<strong style="display: block;">Company</strong>
					<p>
						<c:out value='${jobInformation.companyName}' />
					</p>
				</c:if>

				<c:if test='${not empty jobInformation.careerLevel}'>
					<strong style="display: block;">Career Level</strong>
					<p>
						<c:out value='${jobInformation.careerLevel}' />
					</p>
				</c:if>

				<c:if test='${not empty jobInformation.location}'>
					<strong style="display: block;">Location</strong>
					<p>
						<c:out value='${jobInformation.location}' />
					</p>
				</c:if>
				

				<c:if test='${not empty jobInformation.jobType}'>
					<strong style="display: block;">Job Type</strong>
					<p>
						<c:out value='${jobInformation.jobType}' />
					</p>
				</c:if>
				
				<c:if test='${not empty jobInformation.qualification}'>
					<strong style="display: block;">Mininum Qualification</strong>
					<p>
						<c:out value='${jobInformation.qualification}' />
					</p>
				</c:if>
				
				<c:if test='${not empty jobInformation.salaryRange}'>
					<strong style="display: block;">Salary Range</strong>
					<p>
						<c:out value='${jobInformation.salaryRange}' />
					</p>
				</c:if>

				<c:if test='${not empty jobInformation.experience}'>
					<strong style="display: block;">Prefered Years of
						Experience</strong>
					<p>
						<c:out value='${jobInformation.experience}' />
					</p>
				</c:if>

				<c:if test='${not empty jobInformation.deadline}'>
					<strong style="display: block;">Application Deadline</strong>
					<p>
						<c:out value='${jobInformation.deadline}' />
					</p>
				</c:if>

			</div>
			<c:if test="${not empty jobInformation.relatedJobs}">
				<div class="col-sm-12 dashboard-section no-padding-div"
					style="border: 2px #627aac solid; padding-top: 0px; padding-bottom: 0px">
					<div class="col-sm-12 no-padding-div"
						style="background-color:#627aac; color: white; font-weight: bold; text-align: center;">
						<h4>Related Jobs</h4>
					</div>
					<c:forEach var="item" items="${jobInformation.relatedJobs}">
						<div class="col-sm-12 no-padding-div"
							style="border-bottom: 1px #e1e1e1 solid; margin-top: 2%;">
							<div class="col-sm-3">
								<a href="/bq/open/job?job-key=${item.jobKey}"><img alt=""
									src="${item.pictureUrl}" class="img img-responsive"></a>
							</div>
							<div class="col-sm-9 no-padding-div" style="padding-right: 2%;">

								<a href="/bq/open/job?job-key=${item.jobKey}"><c:out
										value="${item.jobTitle}" /></a>

								<h5
									style="font-family: calibri; margin-top: 2px; margin-bottom: 0px">
									<c:out value="${item.companyName}" />
								</h5>
								<h5 style="margin-top: 5px">
									<strong class="text-success"><c:out
											value='${item.location}' /></strong> <i style="font-family: calibri"
										class="text-danger pull-right">Posted <c:out
											value="${item.postedTime}" />
									</i>

								</h5>
							</div>

						</div>
					</c:forEach>
				</div>
			</c:if>

		</div>



	</div>

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Select your level of experience</h4>
				</div>
				<div class="modal-body">
					<form id="exp-level-form"
						action="<c:url value='/bq/close/get-assessment-questions'/>">
						<select name="exp-level">
							<option>Beginner</option>
							<option>Intermediate</option>
							<option>Advanced</option>
						</select> <input class="btn btn-info" type="submit" value="Go for test">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<!-- Modal -->
	<div id="cvModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="background-image: url('/images/experience-level.jpg');">
				<div class="modal-header" style="border-bottom: none">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Upload Your CV</h4>
				</div>
				<div class="modal-body">
					<div id="upload-cv-div">
						<form method="post" id="cv-form">
							<div class="form-group">
								<input name="cv-file" type="file" class="form-control">
							</div>
							<div class="form-group">
								<input class="btn btn-default upload-cv" type="button"
									value="Upload">
							</div>
						</form>
					</div>
				</div>
				
			</div>

		</div>
	</div>
	<%@ include file="/WEB-INF/pages/footer.html"%>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.webui-popover.min.js"></script>
	<script src="/js/waitMe.js"></script>
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
	<script src="/js/main.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var saveButton = $(".save-job");
			saveButton.click(function() {
				var wk = $("#web-key").val();
				$.ajax({
					url : '/bq/close/save-job',
					method : 'post',
					data : {
						"web-key" : wk,
						"mode" : "true"
					},
					success : function() {
						saveButton.text("Unsave");
						saveButton.removeClass("btn-success");
						saveButton.addClass("btn-danger");
					},
					error : function() {
						alert("error");
					}
				});

			});
			var unsaveButton = $(".unsave-job");
			unsaveButton.click(function() {
				var wk = $("#web-key").val();
				$.ajax({
					url : '/bq/close/save-job',
					method : 'post',
					data : {
						"web-key" : wk,
						"mode" : "false"
					},
					success : function() {
						unsaveButton.text("Save");
						unsaveButton.removeClass("btn-danger");
						unsaveButton.addClass("btn-success");
					},
					error : function() {
						alert("error");
					}
				});

			});
			
			$("#cvModal").on('show.bs.modal', function() {
				$.ajax({
					url : "/bq/close/get-file-upload-url",
					success : function(data) {
						$("#cv-form").prop("action", data);
					}
				});
			});
			
			$(".upload-cv").click(function() {
				$(this).prop('disabled', true);
				$("#cv-form").submit();
			});
			
			$("#cv-form").on(
					'submit',
					function(e) {
						var cov = $(".upload-cv");
						/*cov.waitMe({
							effect : 'ios',
							color : 'gray',
							sizeW : '15',
							sizeH : '15'
						});*/
						var x = $(this).attr('action');

						$.ajax({
							url : x,
							type : 'POST',
							dataType : "json",
							data : new FormData(this),
							processData : false,
							contentType : false,
							success : function(data) {

								$("#cvModal").modal("hide");
							},
							error : function(jqXHR, status,
									errorThrown) {
								alert("error");
							},
							complete : function() {
								cov.prop('disabled', false);
								$("#cvModal").modal("hide");
							}
						});
						e.preventDefault();
					});

			$(".apply-button").click(function() {
				var x = $("#web-key").val();
				var msgD = $("#msg-div");
				var redirect = false;
				var y ="";
				$.ajax({
					url : "/bq/closed/job/application",
					method : "POST",
					data : {
						"job-key" : x,
						"mode" : "ajax"
					},
					dataType : "json",
					success : function(data) {
						alert("success");
						//addSuccess($("#msg-div"),"You application has been sent successfully. Good Luck!");
					},
					error : function(xhr) {
						console.log(xhr);
						if (xhr.status == 417) {
							$("#cvModal").modal();
						} else if(xhr.status == 406) {
							addWarning($("#msg-div"), "You have already applied for this job.");
						} else if(xhr.status == 402) {
							redirect = true;
							y=xhr.statusText;
						} else if(xhr.status == 200) {
							addSuccess($("#msg-div"),"You application has been sent successfully. Good Luck!");
						}
					},
					complete : function () {
						if(redirect) {
							
							window.location.assign(y);
						}
					}
				});
			});
		});
	</script>
</body>
</html>
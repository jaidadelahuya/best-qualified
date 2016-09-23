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
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><c:out value='${user.firstName} ${user.lastName}' /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/styles/jquery.webui-popover.min.css">
<link rel="stylesheet" href="/styles/font-awesome.min.css">
<link rel="stylesheet" href="/styles/main.css">
<link rel="stylesheet" href="/styles/animate.css">

<style type="text/css">
h4 {
	color: #983b59
}

.subnav li {
	list-style: none;
	display: inline;
	margin-right: 2%;
}

.jobs-list {
	border-bottom: 1px #e1e1e1 solid;
	margin-top: 2%;
}

[class~='jobs-list']:last-of-type {
	border-bottom: none;
}

#get-rated {
	-webkit-animation-duration: 2s;
	-webkit-animation-delay: 2s;
	-webkit-animation-iteration-count: infinite;
}
</style>
</head>
<body
	style="background-image: url(/images/background.jpg); background-repeat: repeat;">
	<%@ include file="/main-nav.html"%>
	<div class="container dashboard-body">
		<br /> <br /> <br /> <br />
		<div class="col-sm-8">
			<div class="row">
				<div class="col-sm-12 card-panel">
					<div class="col-sm-12 no-padding-div" style="padding: 0px">
						<div class="col-sm-8" style="border-right: 1px solid #eaeaea">

							<img
								<c:choose><c:when test="${empty user.pictureUrl}">src="/images/unknown-user.jpg"</c:when><c:otherwise>src="${user.pictureUrl}"</c:otherwise></c:choose>
								class="img img-responsive img-circle"
								/ style="width: 6em; float: left; margin: 1%; margin-right: 4%;">
							<div style="padding: 1%;">
								<h4 style="margin-bottom: 1%;">
									<c:out value='${professionalDashboard.name}' />
								</h4>
								<div>
									<c:out value='${professionalDashboard.tagline}' />
								</div>
								<div style="color: green">
									<c:out value='${user.email}' />
								</div>
								<c:if test='${empty professionalDashboard.tagline }'>
									<div>
										<a
											href="<c:url value='/bq/closed/init-professional-profile"' />">Edit
											Profile</a>
									</div>
								</c:if>
							</div>

						</div>
						<div class="col-sm-4 no-pading-div"
							style="padding: 1%; border-bottom: 1px solid #dadada">
							<div>
								<h4>
									<c:out value="${professionalDashboard.personalArticles }" />
									articles
								</h4>
								<h4>
									<c:out value='${professionalDashboard.connections }' />
									connections
								</h4>
							</div>

						</div>
					</div>

					<div class="col-sm-12  no-padding-div"
						style="padding: 0px; border-top: none;">
						<div class="col-sm-8"
							style="border-right: 1px solid #eaeaea; padding: 5px">
							<div class="col-sm-12">
								<p style="margin-bottom: 5px">
									<strong>Your profile strength is at <c:out
											value='${professionalDashboard.profileLevel}' /> level
									</strong>
								</p>
								<div
									style="height: 1em; width: 100%; border: 2px gray solid; border-radius: 6px; -moz-border-radius: 6px; -webkit-border-radius: 6px">
									<div
										style="height: 100%; background-color: ${professionalDashboard.profileColor};width: ${professionalDashboard.profileStrength}%;"></div>
								</div>
								<div style="font-family: calibri">
									<p class="text-success">Employers give priority to
										professionals with completed profiles.</p>
								</div>
								<div>
									<a class="btn btn-xs btn-primary"
										href="<c:url value="/bq/closed/init-professional-profile" />">Personal</a>
									<a class="btn btn-xs btn-primary"
										href="<c:url value="/bq/closed/init-professional-profile" />">Summary</a>
									<a class="btn btn-xs btn-primary"
										href="<c:url value="/bq/closed/init-professional-profile" />">Education</a>
									<a class="btn btn-xs btn-primary"
										href="<c:url value="/bq/closed/init-professional-profile" />">Experience</a>
									<a class="btn btn-xs btn-primary"
										href="<c:url value="/bq/closed/init-professional-profile" />">Certifications</a>
									<a class="btn btn-xs btn-primary"
										href="<c:url value="/bq/closed/init-professional-profile" />">CV</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<h5 class="text-info" style="font-size: 12pt">Profile Views
								in Last 30 Days</h5>
							<div style="">${professionalDashboard.companies}companies</div>
							,
							<div style="">${professionalDashboard.professionals}
								professionals</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row" style="margin-bottom: 1%;">
				<div class="col-sm-12 card-panel"
					style="padding: 2px; color: white; background-color: #a24e69">
					<div class="col-sm-6">
						<h4 style="cursor: pointer; color: white" id="article-trig">
							<i class="fa fa-newspaper-o" aria-hidden="true"
								style="padding-right: 1%;"></i> Write an article
						</h4>
					</div>
					<div class="col-sm-6">
						<h4 style="cursor: pointer; color: white;" id="discussion-trig">
							<i class="fa fa-comments-o" aria-hidden="true"
								style="padding-right: 1%;"></i> Start a discussion
						</h4>
					</div>
					<div class="col-sm-12 no-padding-div">
						<%@ include file="/partial/new-article.html"%>
					</div>
					<div class="col-sm-12 no-padding-div">
						<%@ include file="/partial/new-discussion.html"%>
					</div>
				</div>
			</div>


			<c:forEach var="item" items="${professionalDashboard.articles}">
				<div class="row" style="margin-bottom: 4px;">
					<div class="col-sm-2">
						<div class="card-panel">
							<img alt="" src="/images/articles.png" class="img img-responsive">
						</div>
					</div>
					<div class="col-sm-10 card-panel">
						<div class="col-sm-3 no-padding-div">
							<a href='<c:url value="/bq/community/article/single?webkey=${item.webkey}" />'><img
								class="" src="${item.pictureUrl}" width="130" height="130"></a>
						</div>
						<div class="col-sm-9" style="padding: 2%;">
							<a href='<c:url value="/bq/community/article/single?webkey=${item.webkey}" />'><h3
									class="media-heading" id="lol">${item.title}</h3></a>
							<p class="text-muted">
								<span><i class="fa fa-user"></i> BEST-QUALIFIED</span> <span><i
									class="fa fa-clock-o"></i> <c:out value='${item.postDate}' /></span>
								<span><i class="fa fa-comments"></i><a> 0</a></span>
							</p>
							<p>
								${item.snippet}<span><a
									href='<c:url value="/bq/community/article/single?webkey=${item.webkey}" />'>  <i>Read More</i></a></span>
							</p>

							
						</div>
					</div>
				</div>
			</c:forEach>




		</div>
		<div class="col-sm-4">

			<div>
				<div class="col-sm-12 dashboard-row card-panel">
					<h4>Jobs that may interest you</h4>
					<c:forEach var="item" items="${professionalDashboard.iJobs}">
						<div class="col-sm-12 no-padding-div"
							style="border-bottom: 1px #e1e1e1 solid; margin-top: 2%;">
							<div class="col-sm-3">
								<a href="/bq/open/job?job-key=${item.jobKey}"><img alt=""
									src="${item.pictureUrl}" class="img img-responsive"></a>
							</div>
							<div class="col-sm-9 no-padding-div" style="padding-top: 2%;">

								<a style="font-size: 12pt"
									href="/bq/open/job?job-key=${item.jobKey}"><c:out
										value="${item.jobTitle}" /></a>

								<h5
									style="font-family: calibri; margin-top: 0px; margin-bottom: 0px">
									<c:out value="${item.companyName}" />
								</h5>
								<h5 style="margin-top: 5px; margin-bottom: 5px">
									<strong class="text-success"><c:out
											value='${item.location}' /></strong> <i style="font-family: calibri"
										class="text-danger pull-right">Posted <c:out
											value="${item.postedTime}" />
									</i>

								</h5>
							</div>

						</div>
					</c:forEach>
					<div class="col-sm-12 no-padding-div">
						<a href="">View More</a>
					</div>
				</div>
				<div class="col-sm-12 dashboard-row card-panel">
					<h4>
						Saved Jobs (
						<c:out value='${fn:length(professionalDashboard.savedJobs)}' />
						)
					</h4>
					<p>Save jobs so that you can review Later</p>
					<p style="text-align: right">
						<a href="#" id="see-saved-jobs">See all your Saved Jobs</a>
					</p>
					<div id="saved-jobs-div" style="display: none">
						<c:forEach var="item" items="${professionalDashboard.savedJobs}">
							<div class="col-sm-12 no-padding-div jobs-list">
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
				</div>
				<div class="col-sm-12 dashboard-row card-panel">
					<h4>
						Job Alerts (
						<c:out value='${fn:length(professionalDashboard.jobAlerts)}' />
						)
					</h4>
					<p>Get alerts when jobs that meet your specifications are
						available.</p>
					<p style="text-align: right;">
						<a class="pull-left" href="#">Create New</a> <a href="#">View
							All</a>
					</p>

				</div>
				<div class="col-sm-12 dashboard-row card-panel">
					<h4>
						Job Applications (
						<c:out value='${fn:length(professionalDashboard.appliedJobs)}' />
						)
					</h4>
					<p>Review your past job applications.</p>
					<p style="text-align: right">
						<a href="#" id="see-applied-jobs">View Applications</a>
					</p>
					<div id="applied-jobs-div" style="display: none">
						<c:forEach var="item" items="${professionalDashboard.appliedJobs}">
							<div class="col-sm-12 no-padding-div jobs-list">
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
	<script src="/js/bootstrap-rating.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".call-no-assessment").click(function(e) {
				e.preventDefault();
				$("#myModal1").modal();
			});

			$("#see-saved-jobs").click(function(event) {
				event.preventDefault();
				$("#saved-jobs-div").slideToggle();

			});
			$("#see-applied-jobs").click(function(event) {
				event.preventDefault();
				$("#applied-jobs-div").slideToggle();

			});

		});
	</script>

</body>
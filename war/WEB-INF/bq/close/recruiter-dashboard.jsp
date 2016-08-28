<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="/styles/main.css">
<link rel="stylesheet" href="/styles/font-awesome.min.css">

<style type="text/css">
.subnav li {
	list-style: none;
	display: inline;
	margin-right: 2%;
}

.proview {
	padding: 2%;
	border-bottom: 1px solid #dadada
}
[class~='proview']:last-of-type {
	border-bottom: none;
}

</style>
</head>
<body
	style="background-image: url(/images/background.jpg); background-repeat: repeat;">
	<%@ include file="/main-nav.html"%>
	<br />
	<br />
	<br />

	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<div class="row card-panel">

					<div class="col-sm-12"">
						<div class="col-sm-8 no-padding-div">
							<div class="col-sm-3 no-padding-div">
								<img src="${recruiterDashboard.imageUrl}"
									class="img img-responsive img-circle" />
							</div>
							<div class="col-sm-9 no-padding-div">

								<h4 style="margin-top: 2px">
									<c:out value='${recruiterDashboard.name}' />
								</h4>
								<h5 style="color: #983b59; font-weight: bold">
									<c:out value='${recruiterDashboard.tagLine}' />
								</h5>
								<h5 style="color: gray">
									<c:out value='${recruiterDashboard.email}' />
								</h5>

							</div>
						</div>
						<div class="col-sm-4">
							<div class="card-panel" style="padding: 5px 10px;background-color: #ead7dd; z-index: 20">
								<h5>
									<c:out value='${fn:length(recruiterDashboard.projects)}' />
									Project(s)
								</h5>
								<h5>
									<c:out value='${fn:length(recruiterDashboard.savedSearch)}' />
									Saved Search(es)
								</h5>
							</div>
						</div>
					</div>

				</div>
				<div class="row card-panel"
					style="padding: 2px; color: white; background-color: #a24e69">
					<div class="col-sm-4">
						<h4>
							<a style="color: white;"
								href="<c:url value='/bq/closed/recruiter/project/new' />"><i
								class="fa fa-plus-square-o" aria-hidden="true"
								style="padding-right: 1%;"></i> New Project</a>
						</h4>
					</div>
					<div class="col-sm-4">
						<h4 style="cursor: pointer;" id="article-trig">
							<i class="fa fa-newspaper-o" aria-hidden="true"
								style="padding-right: 1%;"></i> Write an article
						</h4>
					</div>
					<div class="col-sm-4">
						<h4 style="cursor: pointer;" id="discussion-trig">
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
				<c:forEach var="item" items="${recruiterDashboard.projects}">
					<div class="row">
						<div class="col-sm-2" style="padding-right: 0px">
							<div class="card-panel">
								<img alt="" <c:choose><c:when test='${not empty item.companyLogo}'>src="${item.companyLogo}"</c:when><c:otherwise>src="/images/company.png"</c:otherwise></c:choose>  class="img img-responsive">
							</div>
						</div>
						<div class="col-sm-10">
							<div class="col-sm-12 no-padding-div card-panel">
								<div class="col-sm-4 card-panel" 
									style="line-height: 1.8; background-color: #ead7dd">
									<div>
										<a href="#"><c:out value="${item.newApplicants}" /> new
											applicants</a>
									</div>
									<div>
										<a href="#"><c:out value="${item.totalApplicants}" />
											total applicants</a>
									</div>
									<div>
										<a href="#"><c:out value="${item.inviteSent}" /> invites
											sent</a>
									</div>
								</div>
								<div class="col-sm-8">
									<h4>
										<a
											href="<c:url value='/bq/closed/recruiter/project?id=${item.webKey}' />"><c:out
												value="${item.name}" /></a>
									</h4>
									<div>
										<span class="text-danger"><c:out
												value="${item.jobTitle}" /></span>
									</div>
									<div>
										<strong class="text-muted">Created:</strong>
										<fmt:formatDate type="date" dateStyle="long"
							value="${item.dateCreated}" />
									</div>
									<div class="">
										<strong class="text-muted">Expires:</strong>
										<fmt:formatDate type="date" dateStyle="long"
							value="${item.expiryDate}" />
									</div>
								</div>
								<div class="dropdown pull-right">
									<button class="btn btn-success btn-sm dropdown-toggle"
										type="button" data-toggle="dropdown">
										Action <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" style="background-color: #fff">
										<li><a href="<c:url value='/bq/closed/recruiter/project?id=${item.webKey}' />">View</a></li>
										<li><a href="/bq/close/recruiter/project/edit">Update </a></li>
										<li><a href="<c:url value='/bq/closed/recruiter/close-project?id=${item.webKey}' />">Close</a></li>
									</ul>
								</div>

							</div>
						</div>
					</div>
				</c:forEach>
			</div>



			<div class="col-sm-4 card-panel">

				
					<h4 style="color: #a24e69; font-weight: bold">Suggested Candidates</h4>
				
				<c:forEach var="item" items="${recruiterDashboard.prospects}">
					<div class="row proview" ">
						<div class="col-sm-3">
							<a
								href="<c:url value='/bq/closed/get-candidate-profile?web-key=${item.webkey}'/>"><img
								class="img img-responsive img-circle" alt=""
								<c:choose><c:when test='${empty item.pictureUrl }'> src="/images/unknown-user.jpg"</c:when><c:otherwise> src="${item.pictureUrl}"</c:otherwise></c:choose>></a>
						</div>
						<div class="col-sm-8">
							<h5 style="margin-bottom: 2px">
								<a
									href="<c:url value='/bq/closed/get-candidate-profile?web-key=${item.webkey}'/>">
									<c:out value='${item.firstName}' /> <c:out
										value='${item.lastName}' />
								</a>
							</h5>
							<div class="text-success" style="font-family: calibri">
								<c:out value='${item.highestQualification}' />
							</div>
							<div class="text-info"
								style="font-size: 10pt; font-stretch: narrower; font-style: italic;">
								<c:out value='${item.yearsOfExperience}' />
								years experience
							</div>
						</div>
					</div>
				</c:forEach>
				<a href="<c:url value='/bq/closed/all-candidates'/>">View More</a>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/pages/footer.html"%>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.webui-popover.min.js"></script>
	<script src="/js/waitMe.js"></script>
	<script src="/js/main.js"></script>
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>

</body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Project</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/styles/jquery.webui-popover.min.css">
<link rel="stylesheet" href="/styles/main.css">
<style type="text/css">
.subnav li {
	list-style: none;
	display: inline;
	margin-right: 2%;
}

.project-input {
	display: none
}
</style>
</head>
<body <jsp:useBean id="today" class="java.util.Date" />
	style="background-image: url(/images/background.jpg); background-repeat: repeat;">
	<%@ include file="/main-nav.html"%>
	<div class="container dashboard-body" style="margin-top: 6%;">
		<div class="col-sm-8">
			<div class="card-panel">
				<div class="row">
					<div class="col-sm-12">
						<h4 style="color: #3b5998">
							<strong><c:out value='${projectBean.name}' /> <small
								class="pull-right" style="color: #983b59"><b>Created:</b>
									<fmt:formatDate type="date" dateStyle="long"
										value="${projectBean.dateCreated}" /> </small></strong>
						</h4>
						<c:if test='${not empty projectBean.description}'>
							<h5 style="color: #987a3b">
								Description
							</h5>
							<p style="font-family: calibri">
								<c:out value='${projectBean.description}' />
							</p>
						</c:if>

					</div>


				</div>
				<div class="row">
					<div class="col-sm-12 no-padding-div"
						style="background-color: #e0c4cd">
						<div class="col-sm-3" style="padding: 1%;">
							<img alt=""
								<c:choose><c:when test='${not empty projectBean.companyLogo }'>src="${projectBean.companyLogo}"</c:when><c:otherwise>src='/images/company.png'</c:otherwise></c:choose>
								class="img img-responsive">
						</div>
						<div class="col-sm-4">
							<h4 style="color: #3b5998">
								<c:out value="${projectBean.job.title}" />
							</h4>
							<h5 style="font-family: calibri">
								<c:choose>
									<c:when test='${not empty projectBean.companyName }'>
										<c:out value="${projectBean.companyName}" />
									</c:when>
									<c:otherwise>Confidential</c:otherwise>
								</c:choose>
							</h5>
							<h5>
								<i class="text-danger" style="font-family: calibri"> <c:choose>
										<c:when test="${today gt projectBean.expiryDate}">
											<span style="color: red; font-weight: bold">Expired</span>
										</c:when>
										<c:otherwise>
											<span style="color: green; font-weight: bold">Expires</span>
										</c:otherwise>
									</c:choose> <span style="color: white"><fmt:formatDate type="date"
											dateStyle="long" value="${projectBean.expiryDate}" /></span>
								</i>
							</h5>
							<p>
								<a href="<c:url value='/bq/close/recruiter/project/edit' />"
									class="btn btn-success btn-lg">Update</a>
							</p>
						</div>
						<div class="col-sm-5" style="padding: 1%;">
							<div class="card-panel"
								style="background-color: #ebeef4; color: #983b59">
								<div class="card-list">

									Short Listed: <span class="pull-right"><c:out
											value='${projectBean.shortListed}' /></span>

								</div>
								<div class="card-list">

									Invited: <span class="pull-right"><c:out
											value='${projectBean.inviteSent}' /></span>

								</div>
								<div class="card-list">

									New Applicants: <span class="pull-right"><c:out
											value='${projectBean.newApplicants}' /></span>

								</div>
								<div class="card-list">

									All Applicants: <span class="pull-right"><c:out
											value='${projectBean.totalApplicants}' /></span>

								</div>

								<div class="card-list">

									Saved Search: <span class="pull-right"><c:out
											value='${projectBean.savedSeach}' /></span>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<h4 style="color: #983b59; font-weight: bold;">Job Description</h4>
						<p>${projectBean.job.jobDesc}</p>
						<h4 style="color: #983b59; font-weight: bold;">Job Role</h4>
						<p>${projectBean.job.jobRole}</p>
						
					</div>
				</div>



			</div>

		</div>
		<div class="col-sm-4">
			<div class="card-panel"
				style="background-color: #69a24e; color: white">
				<h4 style="border-bottom: 1px #bcd5b0 solid; padding-bottom: 4px">Job
					Summary</h4>
				<strong style="display: block;">Company</strong>
				<c:choose>
					<c:when test='${not empty projectBean.companyName }'>
						<p><c:out value="${projectBean.companyName}" /></p>
					</c:when>
					<c:otherwise><p>Confidential</p></c:otherwise>
				</c:choose>

				<c:if test='${not empty projectBean.job.careerLevel}'>
					<strong style="display: block;">Job Level</strong>
					<p>
						<c:out value='${projectBean.job.careerLevel}' />
					</p>
				</c:if>

				<c:if test='${not empty projectBean.job.location}'>
					<strong style="display: block;">Location</strong>
					<p>
						<c:out value='${projectBean.job.location}' />
					</p>
				</c:if>


				<c:if test='${not empty projectBean.job.jobType}'>
					<strong style="display: block;">Job Type</strong>
					<p>
						<c:out value='${projectBean.job.jobType}' />
					</p>
				</c:if>

				<c:if test='${not empty projectBean.job.educationLevel}'>
					<strong style="display: block;">Mininum Qualification</strong>
					<p>
						<c:out value='${projectBean.job.educationLevel}' />
					</p>
				</c:if>

				<c:if test='${not empty projectBean.job.salaryRange}'>
					<strong style="display: block;">Salary Range</strong>
					<p>
						<c:out value='${projectBean.job.salaryRange}' />
					</p>
				</c:if>

				<c:if test='${not empty projectBean.job.yearsOfExperience}'>
					<strong style="display: block;">Prefered Years of
						Experience</strong>
					<p>
						<c:out value='${projectBean.job.yearsOfExperience}' />
					</p>
				</c:if>

				<c:if test='${not empty projectBean.expiryDate}'>
					<strong style="display: block;">Application Deadline</strong>
					<p>
						<fmt:formatDate type="date" dateStyle="long"
							value="${projectBean.expiryDate}" />
					</p>
				</c:if>

			</div>

			<c:if test="${not empty projectBean.companyName}">
				<div class="card-panel" style="background-color: #758ab6;color: white">
					<h4 style="">Company Information</h4>
					<p>${projectBean.companyName}</p>
					<p>${projectBean.companyWebsite}</p>
					<p>${projectBean.companyDesc}</p>
				</div>
			</c:if>

		</div>

	</div>
	<%@ include file="/WEB-INF/pages/footer.html"%>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/jquery.webui-popover.min.js"></script>
	<script src="/js/waitMe.js"></script>
	<script src="/js/main.js"></script>
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>

</body>
</html>

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
<title>New Project</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/jquery-ui.min.css">
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

p {
	margin-bottom: 0px;
}
</style>
</head>
<body
	style="background-image: url(/images/background.jpg); background-repeat: repeat;">
	<%@ include file="/main-nav.html"%>
	<div class="container" style="margin-top: 6%;">
		<div class="col-sm-offset-2 col-sm-8">
			<div class="card-panel" style="padding-top: 0px">
				<div class="row"
					style="background-color: #c4cde0; padding: 2%; margin-left: -20px; margin-right: -20px">
					<div class="form-group col-sm-12">
						<p class="text-info"
							style="font-size: 12pt; margin-bottom: 4px; font-weight: bold; color: #2f4779">
							Create A Project</p>
						<p class="text-info" style="color: #983b59; font-size: 10pt">
							Manage your Job posts and Applicants</p>
						<p class="text-info" style="color: #983b59; font-size: 10pt">
							All fields with asterisk (*) are required</p>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-sm-12">
						<div class="msg-div"></div>
					</div>
				</div>
				<form method="post"
					action="<%=blobstoreService.createUploadUrl(
					"/bq/close/recruiter/project/save", options)%>"
					enctype="multipart/form-data">
					<div class="row">

						<div class="form-group col-sm-12">
							<input class="form-control" name="project-name"
								placeholder="* Project Name" required="required" />

						</div>
						<div class="form-group col-sm-12">
							<textarea rows="2" class="form-control"
								name="project-description" placeholder="Project Description"></textarea>
						</div>
					</div>


					<div class="row">
						<div class="form-group col-sm-12">
							<p class="text-info" id="show-job"
								style="font-size: 11pt; margin-bottom: 4px; font-weight: bold; cursor: pointer; color: #2f4779">
								<span style="margin-right: 2%;"
									class="glyphicon glyphicon-triangle-bottom"></span>Add a Job
								Post to your project
							</p>
						</div>
					</div>
					<div id="job-div">
						
						<div class="row">
							<div class="form-group col-sm-6">
								<input class="form-control" name="job-title"
									placeholder="* Job Title" required="required" />
							</div>
							<div class="form-group col-sm-6">
								<select class="form-control" required="required"
									name="job-location">
									<option value="" disabled selected hidden>*Job
										Location</option>
									<%@ include file="/partial/states.html"%>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<input class="form-control" name="application-url"
									placeholder="* Application URL/ Email" required="required" />
							</div>
							<div class="form-group col-sm-6">
								<input class="form-control datepicker"
									name="application-deadline" required="required"
									placeholder="* Application Deadline" />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<textarea rows="4" class="form-control" required="required"
									style="white-space: pre-wrap" name="job-role"
									placeholder="* Job Role/Responsibilities"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<textarea rows="4" class="form-control" required="required"
									style="white-space: pre-wrap" name="job-description"
									placeholder="* Job Description"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<select class="form-control" name="career-level"
									required="required">
									<option value="" disabled selected hidden>* Career
										Level</option>
									<%@ include file="/partial/career-level.html"%>
								</select>
							</div>
							<div class="form-group col-sm-6">
								<select required="required" class="form-control"
									name="education-level">
									<option value="" disabled selected hidden>* Education
										Level</option>
									<%@ include file="/partial/education.html"%>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<select class="form-control" required="required" name="job-type">
									<option value="" disabled selected hidden>* Job Type</option>
									<%@ include file="/partial/job-type.html"%>
								</select>
							</div>
							<div class="form-group col-sm-6">
								<select class="form-control" name="salary">
									<option value="" disabled selected hidden>Salary Range</option>
									<%@ include file="/partial/salary-range.html"%>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<select class="form-control" name="experience">
									<option value="" disabled selected hidden>Years of
										Experience</option>
									<%@ include file="/partial/years-of-experience.html"%>
								</select>
							</div>
							<div class="form-group col-sm-6">
								<div class="checkbox">
									<label
										style="font-style: italic; color: #777; font-family: calibri; font-size: 10pt"><input
										type="checkbox" value="true" name="allow-linkedIn">Applicants
										can apply with their LinkedIn profile?</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<input class="form-control" name="skills" placeholder="Skills" />
							</div>
						</div>
					</div>


					<div class="row">
						<div class="form-group col-sm-12">
							<p class="text-info" id="show-com"
								style="font-size: 11pt; margin-bottom: 4px; font-weight: bold; cursor: pointer;color: #2f4779">
								<span style="margin-right: 2%;"
									class="glyphicon glyphicon-triangle-right"></span>Add Company
								Information
							</p>

						</div>
					</div>
					<div id="com-div" style="display: none;">
						<div class="row">
							<div class="form-group col-sm-6">
								<input class="form-control" name="company-name"
									placeholder="Company Name" />
							</div>
							<div class="form-group col-sm-6">
								<input class="form-control" name="company-website"
									placeholder="Company Website" />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<span style="font-size: 10pt; color: #983b59">Company Logo
									(Recommended size: 120px by 120px)</span> <input class="form-control"
									name="image" placeholder="Company Logo" type="file" />
							</div>

						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<textarea rows="4" class="form-control"
									name="company-description" placeholder="Company Description"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-sm-12">
							<input type="Submit" value="Finish" class="btn btn-success">
						</div>
					</div>
				</form>
			</div>

		</div>


	</div>


	<%@ include file="/WEB-INF/pages/footer.html"%>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.webui-popover.min.js"></script>
	<script src="/js/waitMe.js"></script>
	<script src="/js/main.js"></script>
	<script type="text/javascript">
		$(".datepicker").datepicker({
			changeMonth : true,
			changeYear : true
		});

		$("#show-job")
				.click(
						function() {
							$("#job-div").slideToggle();
							$(this)
									.find("span")
									.toggleClass(
											"glyphicon-triangle-right glyphicon-triangle-bottom");
						});
		$("#show-com")
				.click(
						function() {
							$("#com-div").slideToggle();
							$(this)
									.find("span")
									.toggleClass(
											"glyphicon-triangle-right glyphicon-triangle-bottom");
						});
	</script>

</body>
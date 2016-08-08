<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<body
	style="background-image: url(/images/background.jpg); background-repeat: repeat;">
	<%@ include file="/main-nav.html"%>
	<div class="container dashboard-body" style="margin-top: 6%;">
		<div class="col-sm-7">
			<div class="card-panel">
				<h3 style="color: #3b5998">
					<c:out value='${projectBean.name}' />
				</h3>
				<p>
					<c:out value='${projectBean.description}' />
				</p>
			</div>



			<div class="card-panel">
				<div id="create-job-div" class="section">
					<input type="hidden" value="3" class="step">
					<form action="<c:url value='/endpoint/init-recruiter-mj3' />">
						<div class="row">
							<div class="form-group col-sm-12"></div>
						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<div class="msg-div"></div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<input class="form-control" name="job-title"
									value="${projectBean.job.title}" placeholder="* Job Title"
									required="required" />
							</div>
							<div class="form-group col-sm-6">
								<select class="form-control" required="required"
									value="${projectBean.job.location}" name="job-location">
									<option value="" disabled selected hidden>* Job
										Location</option>
									<option>Abia</option>
									<option>Abuja</option>
									<option>Adamawa</option>
									<option>Anambra</option>
									<option>Akwa Ibom</option>
									<option>Bauchi</option>
									<option>Bayelsa</option>
									<option>Benue</option>
									<option>Borno</option>
									<option>Cross River</option>
									<option>Delta</option>
									<option>Ebonyi</option>
									<option>Enugu</option>
									<option>Edo</option>
									<option>Ekiti</option>
									<option>Gombe</option>
									<option>Imo</option>
									<option>Jigawa</option>
									<option>Kaduna</option>
									<option>Kano</option>
									<option>Katsina</option>
									<option>Kebbi</option>
									<option>Kogi</option>
									<option>Kwara</option>
									<option>Lagos</option>
									<option>Nasarawa</option>
									<option>Niger</option>
									<option>Ogun</option>
									<option>Ondo</option>
									<option>Osun</option>
									<option>Oyo</option>
									<option>Plateau</option>
									<option>Rivers</option>
									<option>Sokoto</option>
									<option>Taraba</option>
									<option>Yobe</option>
									<option>Zamfara</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<input class="form-control" name="application-url"
									value="${projectBean.job.applicationUrl}"
									placeholder="* Application URL/ Email" required="required" />
							</div>
							<div class="form-group col-sm-6">
								<input class="form-control datepicker"
									value="${projectBean.job.applicationDeadline}"
									name="application-deadline" required="required"
									placeholder="* Application Deadline" />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<textarea rows="4" class="form-control" required="required"
									value="${projectBean.job.jobRole}"
									style="white-space: pre-wrap" name="job-role"
									placeholder="* Job Role/Responsibilities"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<textarea rows="4" class="form-control" required="required"
									value="${projectBean.job.jobDesc}"
									style="white-space: pre-wrap" name="job-description"
									placeholder="* Job Description"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<select class="form-control" name="career-level"
									value="${projectBean.job.careerLevel}" required="required">
									<option value="" disabled selected hidden>* Career
										Level</option>
									<option value="101">Student (Undergraduate/Graduate)</option>
									<option value="102">Entry Level</option>
									<option value="103">Experienced (Non-Managerial)</option>
									<option value="104">Manager (Manager/Supervisor of
										Staff)</option>
									<option value="105">Executive (SVP,VP,Department Head
										etc)</option>
									<option value="106">Senoir Executive (President, CFO.
										etc)</option>
								</select>
							</div>
							<div class="form-group col-sm-6">
								<select required="required" class="form-control"
									value="${projectBean.job.educationLevel}"
									name="education-level">
									<option value="" disabled selected hidden>* Education
										Level</option>
									<option value="501">Higher National Diploma</option>
									<option value="502">Bachelor's Degree</option>
									<option value="503">Master's Degree</option>
									<option value="504">Post Graduate Diploma</option>
									<option value="505">Doctorate</option>
									<option value="506">Professional</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<select class="form-control" required="required" name="job-type"
									value="${projectBean.job.jobType}">
									<option value="" disabled selected hidden>* Job Type</option>
									<option value="301">Freelance</option>
									<option value="302">Full Time</option>
									<option value="303">Internship</option>
									<option value="304">Part Time</option>
									<option value="305">Permanent</option>
									<option value="306">Temporary</option>
								</select>
							</div>
							<div class="form-group col-sm-6">
								<select class="form-control" name="salary"
									value="${projectBean.job.salaryRange}">
									<option value="" disabled selected hidden>Salary Range</option>
									<option value="201">10,000 - 50,000</option>
									<option value="202">50,000 - 100,000</option>
									<option value="203">100,000 - 300,000</option>
									<option value="204">300,000 - 500,000</option>
									<option value="205">Unspecified</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-6">
								<select class="form-control" name="experience"
									value="${projectBean.job.yearsOfExperience}">
									<option value="" disabled selected hidden>Years of
										Experience</option>
									<option value="401">0 - 1 year</option>
									<option value="402">0 - 2 years</option>
									<option value="403">1 - 3 years</option>
									<option value="404">2 - 5 years</option>
									<option value="405">3 - 5 years</option>
									<option value="406">5 - 10 years</option>
									<option value="407">7 - 10 years</option>
									<option value="408">More than 10 years</option>
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
								<input class="form-control" name="skills" placeholder="Skills"
									value="${projectBean.job.skills}" />
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<textarea rows="4" class="form-control" name="extra-info"
									value="${projectBean.job.additionalInfo}"
									style="white-space: pre-wrap"
									placeholder="Additional Information"></textarea>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-sm-12">
								<input type="button" value="Continue"
									class="btn btn-primary mj-butt"> <a
									class="btn btn-warning"
									href="<c:url value='/bq/endpoint/recruit-professional-user' />">I
									will do this later</a>
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>
		<div class="col-sm-5">
			<div class="card-panel">
				<div class="card-list">
					<h4>
						Date Created: <span class="pull-right"><c:out
								value='${projeanBean.dateCreated}' /></span>
					</h4>
				</div>
				<div class="card-list">
					<h4>
						Expiry Date: <span class="pull-right"><c:out
								value='${projeanBean.dateCreated}' /></span>
					</h4>
				</div>
				<hr />
				<h3 style="text-align: center;">Candidate Information</h3>
				<div class="card-list">
					<h4>
						Short Listed: <span class="pull-right"><c:out
								value='${projeanBean.dateCreated}' /></span>
					</h4>
				</div>
				<div class="card-list">
					<h4>
						Invited: <span class="pull-right"><c:out
								value='${projeanBean.dateCreated}' /></span>
					</h4>
				</div>
				<div class="card-list">
					<h4>
						New Applicants: <span class="pull-right"><c:out
								value='${projeanBean.newApplicants}' /></span>
					</h4>
				</div>
				<div class="card-list">
					<h4>
						All Applicants: <span class="pull-right"><c:out
								value='${projeanBean.dateCreated}' /></span>
					</h4>
				</div>
				<hr />
				<div class="card-list">
					<h4>
						Saved Search: <span class="pull-right"><c:out
								value='${projeanBean.dateCreated}' /></span>
					</h4>
				</div>
			</div>
			<div class="card-panel">
				<h4 style="color: #3b5998">Company Information</h4>
			</div>
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
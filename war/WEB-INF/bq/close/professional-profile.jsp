<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><c:out value='${user.firstName} ${user.lastName}' /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" href="/styles/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/styles/jquery.webui-popover.min.css">
<link rel="stylesheet" href="/styles/main.css">
<style type="text/css">
.input {
	display: none;
}

.form-div {
	display: none;
}

.editable-div {
	margin: 3px 0px;
}

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

h4 {
	margin: 0px;
	margin-bottom: 6px !important;
}
</style>
</head>
<body
	style="background-image: url(/images/background.jpg); background-repeat: repeat;">
	<%@ include file="/main-nav.html"%>
	<div class="container dashboard-body">
		<br /> <br /> <br /> <br />
		<div class="col-sm-7">
			<div class="row ">
				<div class="col-sm-12 card-panel no-padding-div"
					style="padding-bottom: 0px">

					<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666">Personal
						Information</h4>
					<div class="row">
						<div class="col-sm-3">
							<div style="position: relative;">
								<img alt=""
									<c:choose><c:when test="${empty user.pictureUrl}">src="/images/unknown-user.jpg"</c:when><c:otherwise>src="${user.pictureUrl}"</c:otherwise></c:choose>
									class="img img-responsive profile-image"
									style="width: 100%; margin: 2%; margin-top: 4%;">
								<div style="text-align: center; margin-bottom: 1%;">
									<span id="change-picture"
										style="color: orange; cursor: pointer;">Change Picture</span>
								</div>
							</div>


						</div>
						<div class="col-sm-9" style="padding-top: 2%;">
							<div class="col-sm-12 editable-div"
								style="font-size: 14pt; font-weight: bold;">
								<div class="input">
									<input class="h-input" type="hidden" value="last-name"><input
										id="first-name" value="${user.firstName}" style="width: 40%;" />
									<input id="last-name" value="${user.lastName}"
										style="width: 40%;" />
								</div>
								<span class="output"><c:out value="${user.firstName}" />
									<c:out value="${user.lastName}" /></span> <span
									class="glyphicon glyphicon-pencil edit-tool"></span>
							</div>
							<div class="col-sm-12 text-muted">
								<span class="inline-output"><c:out value='${user.email}' /></span>
							</div>
							<div class="col-sm-12 editable-div">
								<input value="tagline" class="h-input" type="hidden" /> <input
									value="${user.tagline}" class="input" /> <span class="output">
									<c:choose>
										<c:when test='${empty user.tagline}'>
											<span style="color: orange">Write your tagline</span>
										</c:when>
										<c:otherwise>
											<c:out value='${user.tagline}' />
										</c:otherwise>
									</c:choose>
								</span> <span class="glyphicon glyphicon-pencil edit-tool"></span>
							</div>
							<div class="col-sm-12 editable-div">
								<input value="current-employer" class="h-input" type="hidden" />
								<input value="${professionalProfile.currentEmployer}"
									class="input" /> <span class="output"> <c:choose>
										<c:when test='${empty professionalProfile.currentEmployer}'>
											<span style="color: orange">Who is your current
												employer?</span>
										</c:when>
										<c:otherwise>
											<c:out value='${professionalProfile.currentEmployer}' />
										</c:otherwise>
									</c:choose>
								</span> <span class="glyphicon glyphicon-pencil edit-tool"></span>
							</div>

							<div class="col-sm-12 editable-div">
								<input value="phone" class="h-input" type="hidden" /> <input
									value="${user.phone}" class="input" /> <span class="output">
									<c:choose>
										<c:when test='${empty user.phone}'>
											<span style="color: orange">Enter a contact phone
												number</span>
										</c:when>
										<c:otherwise>
											<c:out value='${user.phone}' />
										</c:otherwise>
									</c:choose>
								</span> <span class="glyphicon glyphicon-pencil edit-tool"></span>
							</div>
						</div>

					</div>
					<div id="upload-picture-div"
						style="background-color: #eaeaea; margin-left: -20px; margin-right: -20px; padding: 2% 4%; margin-top: 1%; display: none;">

						<h4 style="font-weight: bold">Upload a profile picture</h4>
						<form id="profile-image-form" method="post">
							<input style="margin: 4px 0px" type="file" name="image" /> <input
								type="button" id="upload-button" value="Upload" />
						</form>

					</div>
				</div>
			</div>
			<div class="row">

				<div class="col-sm-2 ">
					<div class="card-panel">
						<img alt="" src="/images/profile-summary.png"
							class="img img-responsive" style="width: 80%; margin: 0 auto">
					</div>
				</div>
				<div class="col-sm-10 card-panel">
					<div class="col-sm-12 no-padding-div">
						<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666">
							Profile Summary</h4>

						<div class="col-sm-12 editable-div">
							<input type="hidden" value="profile-summary" class="h-input" />
							<div class="input">
								<div contenteditable="true"
									style="width: 100%; margin-bottom: 5px; padding: 5px; border: 1px solid #eaeaea;"
									class="input-area">${uppb.profileSummary}</div>
								<button class="btn btn-primary btn-sm  s-textarea">Save</button>
							</div>
							<div class="output">
								<c:choose>
									<c:when test='${empty uppb.profileSummary}'>
										<span style="color: orange">Write a summary for your
											profile</span>
									</c:when>
									<c:otherwise>
										${uppb.profileSummary}
										
									</c:otherwise>
								</c:choose>
								<span class="edit-tool"
									style="border: none; font-weight: bold; color: blue">EDIT</span>

							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-sm-2">
					<div class="card-panel">
						<img alt="" src="/images/work-experience.png"
							class="img img-responsive" style="width: 80%; margin: 0 auto">
					</div>
				</div>
				<div class="col-sm-10 card-panel">
					<div class="col-sm-12 no-padding-div">
						<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666"
							class="">Work Experience</h4>

						<div class="s-editable-div">
							<span class="text-primary add-new" style="cursor: pointer;">Add
								new</span>
							<div class="form-div">
								<br />
								<form class="work-experience-form">
									<div>
										<label>Organization Name:</label><br /> <input
											id="organization" name="organization" style="width: 70%;">
									</div>
									<div>
										<label>Position Held:</label><br /> <input name="position"
											id="position" style="width: 70%;">
									</div>
									<div>
										<label>Time</label><br /> <select name="start-month"
											id="start-month">
											<%@ include file="/partial/months.html"%>
										</select> <select name="start-year" id="start-year">
											<%@ include file="/partial/years.html"%>
										</select> <label>To</label> <select name="end-month" id="end-month">
											<%@ include file="/partial/months.html"%>
										</select> <select name="end-year" id="end-year">
											<%@ include file="/partial/years.html"%>
										</select>
									</div>
									<input class="h-input" value="work-experience" type="hidden">

									<div style="margin-top: 2%; margin-bottom: 2%;">
										<input type="button" class="btn btn-xs btn-primary save-item"
											value="Save"> <input
											class="btn btn-xs btn-danger cancel-button" value="Close">
									</div>
								</form>
								<br />
							</div>
							<div class="s-output">
								<c:set var='index' value='1' />
								<c:forEach var="item" items="${uppb.workExperience}">
									<div class="col-sm-12 module-div"
										<c:if test="${index < fn:length(uppb.workExperience)}">style="border-bottom: 1px #d1d1d1 solid; margin-top: 5px"</c:if>>
										<c:set var='index' value='${index+1}' />
										<h4 class="position" style="margin-top: 10px">
											<c:out value='${item.position}' />
										</h4>
										<h5 class="company-name" style="font-family: calibri">
											<c:out value='${item.company}' />
										</h5>
										<h5 style="font-family: calibri">
											From <span class="start-month"> <c:out
													value='${item.startMonth}' /></span> <span class="start-year">
												<c:out value='${item.startYear}' />
											</span> to <span class="end-month"> <c:out
													value='${item.endMonth}' /></span> <span class="end-year">
												<c:out value='${item.endYear}' />
											</span>
										</h5>
										<input type="hidden" id="item" value="work-experience" /> <input
											type="hidden" id="web-key" value="${item.safeKey}" />
										<p>
											<a class="delete-item"
												href="<c:url value='/bq/close/general-delete?id=${item.safeKey}&item=work-experience' />">Delete</a>
										</p>
									</div>
								</c:forEach>
							</div>

						</div>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<div class="card-panel">
						<img alt="" src="/images/education.png" class="img img-responsive"
							style="width: 80%; margin: 0 auto">
					</div>
				</div>

				<div class="col-sm-10 card-panel">
					<div class="col-sm-12 no-padding-div">
						<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666"
							class="">Education</h4>
						<div class="s-editable-div">
							<span class="text-primary add-new" style="cursor: pointer;">Add
								new</span>
							<div class="form-div">
								<br />
								<form class="education-form">
									<div>
										<label>School Name:</label><br /> <input id="institution"
											name="institution" style="width: 70%;">
									</div>
									<div>
										<label>Course:</label><br /> <input name="course" id="course"
											style="width: 70%;">
									</div>
									<div>
										<label>Certificate Earned:</label><br /> <input
											placeholder="" name="certificate" id="certificate"
											style="width: 70%;">
									</div>
									<div>
										<label>Additional Information:</label><br /> <input
											placeholder="" name="extra" id="extra" style="width: 70%;">
									</div>
									<div>
										<label>Time</label><br /> <select name="start-month"
											id="start-month">
											<%@ include file="/partial/months.html"%>
										</select> <select name="start-year" id="start-year">
											<%@ include file="/partial/years.html"%>
										</select> <label>To</label> <select name="end-month" id="end-month">
											<%@ include file="/partial/months.html"%>
										</select> <select name="end-year" id="end-year">
											<%@ include file="/partial/years.html"%>
										</select>
									</div>
									<input class="h-input" value="education" type="hidden">
									<div style="margin-top: 2%; margin-bottom: 2%;">
										<input type="button" class="btn btn-xs btn-primary save-item"
											value="Save"> <input
											class="btn btn-xs btn-danger cancel-button" type="button"
											value="Close">
									</div>
								</form>
							</div>
							<div class="s-output">
								<c:set var='edIndex' value='1' />
								<c:forEach var="item" items="${uppb.education}">
									<div class="col-sm-12 module-div"
										<c:if test="${edIndex < fn:length(uppb.education)}">style="border-bottom: 1px #d1d1d1 solid;margin-top: 5px"</c:if>>
										<c:set var='edIndex' value='${edIndex+1}' />
										<h4 class="instituition" style="margin-top: 10px">
											<c:out value='${item.institution}' />
										</h4>
										<h5 class="course" style="font-family: calibri">
											<c:out value='${item.course}' />
											<c:choose>
												<c:when test="${empty item.course}">
													<c:out value='${item.qualification}' />
												</c:when>
												<c:otherwise>
													<c:if test='${not empty item.qualification  }'>
												(
									<c:out value='${item.qualification}' />
									)
											</c:if>
												</c:otherwise>
											</c:choose>
										</h5>
										<h5 style="font-family: calibri">
											From <span class="start-month"> <c:out
													value='${item.startMonth}' /></span> <span class="start-year">
												<c:out value='${item.startYear}' />
											</span> to <span class="end-month"> <c:out
													value='${item.endMonth}' /></span> <span class="end-year">
												<c:out value='${item.endYear}' />
											</span>
										</h5>
										<input type="hidden" id="item" value="education" /> <input
											type="hidden" id="web-key" value="${item.safeKey}" />
										<p>
											<a class="delete-item"
												href="<c:url value="/bq/close/general-delete?id=${item.safeKey}&item=education" />">Delete</a>
										</p>
									</div>
								</c:forEach>
							</div>
						</div>


					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<div class="card-panel">
						<img alt="" src="/images/certificate-award.png"
							class="img img-responsive" style="margin: 0 auto; width: 80%">
					</div>
				</div>
				<div class="col-sm-10 card-panel">
					<div class="col-sm-12 no-padding-div">
						<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666"
							class="">Awards</h4>

						<div class="s-editable-div">
							<span class="text-primary add-new" style="cursor: pointer;">Add
								new</span>
							<div class="form-div">
								<br />
								<form class="award-form">
									<div>
										<label>Award Name:</label><br /> <input id="award"
											name="award" style="width: 70%;">
									</div>
									<div>
										<label>Additional Information:</label><br /> <input
											placeholder="" name="extra" id="extra" style="width: 70%;">
									</div>
									<div>
										<label>Time</label><br /> <select name="start-month"
											id="start-month">
											<%@ include file="/partial/months.html"%>
										</select> <select name="start-year" id="start-year">
											<%@ include file="/partial/years.html"%>
										</select>
									</div>
									<input class="h-input" value="award" type="hidden">
									<div style="margin-top: 2%; margin-bottom: 2%;">
										<input type="button" class="btn btn-xs btn-primary save-item"
											value="Save"> <input
											class="btn btn-xs btn-danger cancel-button" value="Close">
									</div>
								</form>
							</div>
							<div class="s-output">
								<c:set var='awIndex' value='1' />
								<c:forEach var="item" items="${uppb.awards}">
									<div class="col-sm-12 module-div"
										<c:if test="${awIndex < fn:length(uppb.awards)}">style="border-bottom: 1px #d1d1d1 solid; margin-top:5px"</c:if>>
										<c:set var='awIndex' value='${awIndex+1}' />
										<h4 class="name" style="margin-top: 10px">
											<c:out value='${item.name}' />
										</h4>
										<h5 class="extra" style="font-family: calibri">
											<c:out value='${item.description}' />
										</h5>
										<h5 style="font-family: calibri">
											<span class="start-month"> <c:out
													value='${item.month}' /></span> <span class="start-year">
												<c:out value='${item.year}' />
											</span>
										</h5>
										<input type="hidden" id="item" value="award" /> <input
											type="hidden" id="web-key" value="${item.safeKey}" />
										<p>
											<a class="delete-item"
												href='<c:url value="/bq/close/general-delete?id=${item.safeKey}&item=award" />'>Delete</a>
										</p>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<div class="card-panel">
						<img alt="" src="/images/certificate-award.png"
							class="img img-responsive" style="margin: 0 auto; width: 80%">
					</div>
				</div>
				<div class="col-sm-10 card-panel">
					<div class="col-sm-12 no-padding-div">
						<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666"
							class="">Certifications</h4>

						<div class="s-editable-div">
							<span class="text-primary add-new" style="cursor: pointer;">Add
								new</span>
							<div class="form-div">
								<br />
								<form class="award-form">
									<div>
										<label>Certification Name:</label><br /> <input
											id="certification" name="certification" style="width: 70%;">
									</div>

									<div>
										<label>Time</label><br /> <select name="cert-month"
											id="cert-month">
											<%@ include file="/partial/months.html"%>
										</select> <select name="cert-year" id="cert-year">
											<%@ include file="/partial/years.html"%>
										</select>
									</div>
									<input class="h-input" value="certification" type="hidden">
									<div style="margin-top: 2%; margin-bottom: 2%;">
										<input type="button" class="btn btn-xs btn-primary save-item"
											value="Save"> <input
											class="btn btn-xs btn-danger cancel-button" value="Close">
									</div>
								</form>
							</div>
							<div class="s-output">
								<c:set var='certIndex' value='1' />
								<c:forEach var="item" items="${uppb.certifications}">
									<div class="col-sm-12 module-div"
										<c:if test="${certIndex < fn:length(uppb.certifications)}">style="border-bottom: 1px #d1d1d1 solid; margin-top:5px"</c:if>>
										<c:set var='certIndex' value='${certIndex+1}' />
										<h4 class="name" style="margin-top: 10px">
											<c:out value='${item.name}' />
										</h4>

										<h5 style="font-family: calibri">
											<span class="start-month"> <c:out
													value='${item.month}' /></span> <span class="start-year">
												<c:out value='${item.year}' />
											</span>
										</h5>

										<p>
											<a class="delete-item"
												href='<c:url value="/bq/close/general-delete?id=${item.webKey}&item=certification" />'>Delete</a>
										</p>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-5">
			<div class="col-sm-12 card-panel no-padding-div">

				<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666"
					class="">Curriculum Vitae</h4>
				<c:choose>
					<c:when test="${empty uppb.cv}">
						<p class="file-name">You have not uploaded your CV.</p>
						<p>
							<a class="upload-link upload-link-1" href="#">Upload CV</a> <a
								class="upload-link upload-link-2" href="#"
								style="display: none;">Change</a> <input type="hidden"
								name="old-key" id="old-key">
						</p>
					</c:when>
					<c:otherwise>
						<p class="file-name">
							<a target="_blank"
								href="<c:url value='/bq/close/get-cv?safe-key=${uppb.cvSafeString}' />"><c:out
									value='${uppb.cv}' /></a>
						</p>
						<p>
							<a class="upload-link" href="#">Change</a>
						</p>
					</c:otherwise>
				</c:choose>
				<div id="upload-cv-div" style="display: none">
					<form method="post" id="cv-form">
						<div class="form-group">
							<input name="cv-file" type="file" class="form-control">
						</div>
						<input type="hidden" name="old-key" value="${uppb.cvSafeString}">
						<div class="form-group">
							<input class="btn btn-default upload-cv" type="button"
								value="Upload">
						</div>
					</form>
				</div>

			</div>


			<div class="col-sm-12 card-panel no-padding-div">

				<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666"
					class="">Other Information</h4>

				<div class="col-sm-12 editable-div">

					<label>Current State:</label> <input value="current-state"
						class="h-input" type="hidden" /> <select
						value="${uppb.currentState}" class="s-input input"><%@ include
							file="/partial/states.html"%></select> <span
						class="output"> <c:choose>
							<c:when test='${empty uppb.currentState}'>
								<span style="color: orange">Which state do you stay?</span>
							</c:when>
							<c:otherwise>
								<c:out value='${uppb.currentState}' />
							</c:otherwise>
						</c:choose>
					</span> <span class="glyphicon glyphicon-pencil edit-tool"></span>
				</div>

				<div class="col-sm-12 editable-div">
					<label>Current Country:</label> <input value="current-country"
						class="h-input" type="hidden" /> <input
						value="${uppb.currentCountry}" class="input" /> <span
						class="output"> <c:choose>
							<c:when test='${empty uppb.currentCountry}'>
								<span style="color: orange">Enter current country</span>
							</c:when>
							<c:otherwise>
								<c:out value='${uppb.currentCountry}' />
							</c:otherwise>
						</c:choose>
					</span> <span class="glyphicon glyphicon-pencil edit-tool"></span>
				</div>

				<div class="col-sm-12 editable-div">
					<label>Nationality:</label> <input value="nationality"
						class="h-input" type="hidden" /> <input
						value="${uppb.nationality}" class="input" /> <span class="output">
						<c:choose>
							<c:when test='${empty uppb.nationality}'>
								<span style="color: orange">Enter Nationality</span>
							</c:when>
							<c:otherwise>
								<c:out value='${uppb.nationality}' />
							</c:otherwise>
						</c:choose>
					</span> <span class="glyphicon glyphicon-pencil edit-tool"></span>
				</div>

				<div class="col-sm-12 editable-div">
					<label>State of Origin:</label> <input value="state-of-origin"
						class="h-input" type="hidden" /> <select
						value="${uppb.stateOfOrigin}" class="s-input input"><%@ include
							file="/partial/states.html"%></select> <span
						class="output"> <c:choose>
							<c:when test='${empty uppb.stateOfOrigin}'>
								<span style="color: orange">Select state of origin</span>
							</c:when>
							<c:otherwise>
								<c:out value='${uppb.stateOfOrigin}' />
							</c:otherwise>
						</c:choose>
					</span> <span class="glyphicon glyphicon-pencil edit-tool"></span>
				</div>

				<div class="col-sm-12 editable-div">
					<label>Gender:</label> <input value="gender" class="h-input"
						type="hidden" /> <select value="${uppb.gender}"
						class="s-input input">
						<option>Female</option>
						<option>Male</option>
					</select> <span class="output"> <c:choose>
							<c:when test='${empty uppb.gender}'>
								<span style="color: orange">Select your gender</span>
							</c:when>
							<c:otherwise>
								<c:out value='${uppb.gender}' />
							</c:otherwise>
						</c:choose>
					</span> <span class="glyphicon glyphicon-pencil edit-tool"></span>

				</div>

				<div class="col-sm-12 editable-div">

					<label>Years of Experience:</label> <input value="experience"
						class="h-input" type="hidden" /> <select
						value="${uppb.yearOfExperience}" class="s-input input">
						<option value="401">0 - 1 year</option>
						<option value="402">0 - 2 years</option>
						<option value="403">1 - 3 years</option>
						<option value="404">2 - 5 years</option>
						<option value="405">3 - 5 years</option>
						<option value="406">5 - 10 years</option>
						<option value="407">7 - 10 years</option>
						<option value="408">More than 10 years</option>
					</select> <span class="output"> <c:choose>
							<c:when test='${empty uppb.yearOfExperience}'>
								<span style="color: orange">Select years of experience</span>
							</c:when>
							<c:otherwise>
								<c:out value='${uppb.yearOfExperience}' />
							</c:otherwise>
						</c:choose>
					</span> <span class="glyphicon glyphicon-pencil edit-tool"></span>
				</div>

				<div class="col-sm-12 editable-div">
					<label>Career Level:</label> <input value="career-level"
						class="h-input" type="hidden" /><select
						value="${uppb.careerLevel}" class="s-input input">

						<option value="101">Student (Undergraduate/Graduate)</option>
						<option value="102">Entry Level</option>
						<option value="103">Experienced (Non-Managerial)</option>
						<option value="104">Manager (Manager/Supervisor of Staff)</option>
						<option value="105">Executive (SVP,VP,Department Head
							etc)</option>
						<option value="106">Senoir Executive (President, CFO.
							etc)</option>
					</select> <span class="output"> <c:choose>
							<c:when test='${empty uppb.careerLevel}'>
								<span style="color: orange">Select years career level</span>
							</c:when>
							<c:otherwise>
								<c:out value='${uppb.careerLevel}' />
							</c:otherwise>
						</c:choose>
					</span> <span class="glyphicon glyphicon-pencil edit-tool"></span>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/pages/footer.html"%>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.webui-popover.min.js"></script>
	<script src="/js/main.js"></script>
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#profile-image-form").submit(
									function(e) {
										e.preventDefault();
										var me = $(this);
										var x = me.prop("action");
										$.ajax({
											url : x,
											type : 'POST',
											data : new FormData(this),
											processData : false,
											contentType : false,
											success : function(data) {
												$(".profile-image").prop("src",data);
												$("#upload-picture-div").slideUp();
											},
											error : function(jqXHR, status,
													errorThrown) {

											}
										});
									});

							$("#upload-button").click(function(e) {
								e.preventDefault();
								$("#profile-image-form").submit();
							});

							$("#change-picture")
									.click(
											function(e) {
												var x = $(this);
												$
														.ajax({
															url : "/bq/close/upload/get",
															data : {
																'url' : "/bq/close/profile/picture/upload"
															},
															dataType : "json",
															success : function(
																	data) {
																console
																		.log(data);
																$(
																		"#profile-image-form")
																		.prop(
																				"action",
																				data);
																$(
																		"#upload-picture-div")
																		.slideDown();
															},
															error : function(
																	xhr,
																	status, val) {
																console
																		.log(xhr);
															}
														});

											});

							$("#first-name").keyup(function(event) {
								if (event.keyCode == 13) {
									$("#last-name").select();
								}
							});

							$(".save-item")
									.click(
											function() {
												var me = $(this);
												me.prop("value", "Saving...");
												me.removeClass("btn-primary");
												me.addClass("btn-warning");
												var form = me.closest("form");
												var par = me
														.closest(".s-editable-div");
												var output = par
														.find(".s-output");
												var hInput = par
														.find(".h-input");
												var x = hInput.val();

												var uri = "";
												if (x == "education") {
													uri = "/bq/close/add-education";
												} else if (x == "award") {
													uri = "/bq/close/add-award";
												} else if (x == "certification") {
													uri = "/bq/close/add-cert";
												} else if (x == "work-experience") {
													uri = "/bq/close/save-work-experience";
												}
												$
														.ajax({
															url : uri,
															method : "POST",
															data : form
																	.serialize(),
															success : function(
																	data) {
																window.location
																		.assign(window.location.protocol
																				+ "//"
																				+ window.location.hostname
																				+ ":"
																				+ window.location.port
																				+ "/bq/close/professional-profile");
																console
																		.log("here")
																console
																		.log(data);
																output
																		.prepend(data);
																me
																		.prop(
																				"value",
																				"Saved");
															},
															error : function() {

															},
															complete : function() {
																me
																		.prop(
																				"value",
																				"Save");
																me
																		.removeClass("btn-warning");
																me
																		.addClass("btn-primary");
																form[0].reset();
															}

														});
											});

							$(".cancel-button").click(function() {
								var par = $(this).closest(".form-div");
								par.slideUp();
							});

							$(".add-new").click(function() {
								var me = $(this);
								var par = me.closest(".s-editable-div");
								var fDiv = par.find(".form-div");
								fDiv.slideDown();

							});

							$(".upload-link").click(function(e) {
								e.preventDefault();
								$.ajax({
									url : "/bq/close/get-file-upload-url",
									success : function(data) {

										$("#cv-form").prop("action", data);
										$("#upload-cv-div").slideToggle();
									}
								});
							});
							$(".upload-cv").click(function() {
								$(this).prop('disabled', true);
								$("#cv-form").submit();
							});
							$(".editable-div").mouseenter(function() {
								$(this).find(".edit-tool").show();
							});

							$(".editable-div").mouseleave(function() {
								$(this).find(".edit-tool").hide();
							});

							$(".edit-tool").click(function() {
								var me = $(this);
								var par = me.closest(".editable-div");
								var inp = par.find(".input");
								var out = par.find(".output");
								$(".input").hide();
								$(".output").show();
								inp.show();
								inp.select();
								out.hide();
								me.hide();
								par.off();
							});

							$(".s-textarea").click(function(e) {

								var me = $(this);
								var par = me.closest(".editable-div");
								var hInp = par.find(".h-input");
								var txt = par.find(".input-area");

								var x = hInp.val();
								var y = txt.html();

								$.ajax({
									url : "/bq/close/update-profile",
									method : "POST",
									data : {
										"param" : x,
										"value" : y
									},
									success : function(data) {
									},
									complete : function() {
										me.hide();
										par.mouseenter(function() {
											$(this).find(".edit-tool").show();
										});

										par.mouseleave(function() {
											$(this).find(".edit-tool").hide();
										});
									}
								});

							});

							$(".s-input").change(function(e) {

								var me = $(this);
								var par = me.closest(".editable-div");
								var hInp = par.find(".h-input");
								var out = par.find(".output");

								var x = hInp.val();
								var y = me.val();

								$.ajax({
									url : "/bq/close/update-profile",
									method : "POST",
									data : {
										"param" : x,
										"value" : y
									},
									success : function(data) {

										out.html(data);

									},
									complete : function() {
										out.show();
										me.hide();
										par.mouseenter(function() {
											$(this).find(".edit-tool").show();
										});

										par.mouseleave(function() {
											$(this).find(".edit-tool").hide();
										});
									}
								});

							});

							$('#last-name')
									.keyup(
											function(e) {

												var me = $(this);
												var par = me
														.closest(".editable-div");
												var hInp = par.find(".h-input");
												var out = par.find(".output");
												var p = me.closest(".input");
												var x = hInp.val();
												var y = me.val();
												var z = $("#first-name").val();

												if (e.keyCode == 13) {
													$
															.ajax({
																url : "/bq/close/update-profile",
																method : "POST",
																data : {
																	"param" : x,
																	"last-name" : y,
																	"first-name" : z,
																	"value" : "last-name"
																},
																success : function() {
																	out
																			.html(z
																					+ " "
																					+ y);
																},
																complete : function() {
																	out.show();
																	p.hide();
																	par
																			.mouseenter(function() {
																				$(
																						this)
																						.find(
																								".edit-tool")
																						.show();
																			});

																	par
																			.mouseleave(function() {
																				$(
																						this)
																						.find(
																								".edit-tool")
																						.hide();
																			});
																}
															});
												}
											});

							$('input.input:text')
									.keyup(
											function(e) {

												var me = $(this);
												var par = me
														.closest(".editable-div");
												var hInp = par.find(".h-input");
												var out = par.find(".output");

												var x = hInp.val();
												var y = me.val();

												if (e.keyCode == 13) {
													$
															.ajax({
																url : "/bq/close/update-profile",
																method : "POST",
																data : {
																	"param" : x,
																	"value" : y
																},
																success : function() {
																	out.html(y);
																},
																complete : function() {
																	out.show();
																	me.hide();
																	par
																			.mouseenter(function() {
																				$(
																						this)
																						.find(
																								".edit-tool")
																						.show();
																			});

																	par
																			.mouseleave(function() {
																				$(
																						this)
																						.find(
																								".edit-tool")
																						.hide();
																			});
																}
															});
												}
											});
							$('.delete-item').click(function(e) {
								e.preventDefault();
								var x = $(this).prop('href');
								var par = $(this).closest(".module-div");
								$.ajax({
									url : x,
									success : function(data) {
										par.remove();
									},
									error : function() {
										alert("Cannot delete at this this");
									}

								});
							});

							$("#cv-form")
									.on(
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

												$
														.ajax({
															url : x,
															type : 'POST',
															dataType : "json",
															data : new FormData(
																	this),
															processData : false,
															contentType : false,
															success : function(
																	data) {

																$(".file-name")
																		.html(
																				"<a target='_blank' href='<c:url value='/bq/close/get-cv?safe-key="
																						+ data.safeKey
																						+ "' />'>"
																						+ data.fileName
																						+ "</a>");
																$(
																		".upload-link-1")
																		.hide();
																$(
																		".upload-link-2")
																		.show();
																$("#old-key")
																		.val(
																				data.safeKey);
																$(
																		"#upload-cv-div")
																		.slideToggle();
															},
															error : function(
																	jqXHR,
																	status,
																	errorThrown) {
																alert("error");
															},
															complete : function() {
																cov
																		.prop(
																				'disabled',
																				false);
															}
														});
												e.preventDefault();
											});
						});
	</script>

	<script type="text/javascript">
		$(".add-new").click(function() {

			var parent = $(this).closest(".card-panel");
			parent.find(".form-div").slideDown();
		});
		$(".cancel-button").click(function() {
			var parent = $(this).closest(".card-panel");
			parent.find(".form-div").slideUp();
		});

		$(".update").change(function() {

			var par = $(this).closest(".editable-div");
			par.find(".inline-output").text($(this).val());
			$(this).hide();
			par.find(".inline-output").show();

		});
	</script>

</body>
</html>
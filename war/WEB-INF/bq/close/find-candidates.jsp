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

.modal-footer{
	background-color: #ebeef4
}
.modal-header {
	color: white;
	background-color: #758ab6
}

.modal-body {
	background-color: #f5f6f9
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
	<br />
	<br />
	<br />
	<br />
	<div class="container" style="margin-bottom: 2%;">
		<div class="row">
			<form id="search-form">
				<input type="hidden" value="true" name="filter" />
				<div class="col-sm-3 no-padding">
					<div class="col-sm-12 no-padding-div"
						style="padding-top: 0px; border: 1px gray solid; background-color: white;">
						<div class="col-sm-12 no-padding-div"
							style="border-bottom: 1px gray solid">
							<div class="filter-heading">
								<h4>Refine</h4>
							</div>
							<div class="col-sm-12 form-group">
								<input placeholder="Keyword, Name, Email"
									class="form-control keyword" name="title">
							</div>
							<div class="col-sm-12 form-group">
								<input type="button" value="Search"
									class="form-control btn btn-success form-member">
							</div>
						</div>
						<div class="col-sm-12 no-padding-div">
							<div class="filter-heading">
								<h4 style="margin-bottom: 0px">Filter Your Search</h4>
							</div>
							<div class="filter-component">
								<div class="filter-header" style="border-top: none">
									<span>Location</span> <span
										class="filter-arrow glyphicon glyphicon-chevron-down pull-right"></span>
								</div>
								<div class="filter-values">
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Abia">Abia</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Abuja">Abuja</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Adamawa">Adamawa</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Anambra">Anambra</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Akwa Ibom">Akwa Ibom</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Bauchi">Bauchi</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Bayelsa">Bayelsa</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Benue">Benue</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Borno">Borno</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Cross River">Cross River</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Delta">Delta</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Ebonyi">Ebonyi</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Enugu">Enugu</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Edo">Edo</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Ekiti">Ekiti</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Gombe">Gombe</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Imo">Imo</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Jigawa">Jigawa</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Kaduna">Kaduna</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Kano">Kano</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Katsina">Katsina</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Kebbi">Kebbi</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Kogi">Kogi</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Kwara">Kwara</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Lagos">Lagos</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Nasarawa">Nasarawa</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Niger">Niger</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Ogun">Ogun</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Ondo">Ondo</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Osun">Osun</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Oyo">Oyo</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Plateau">Plateau</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Rivers">Rivers</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Sokoto">Sokoto</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Taraba">Taraba</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Yobe">Yobe</label>
									</div>
									<div class="checkbox col-sm-6">
										<label><input class="form-member" type="checkbox"
											name="location" value="Zamfara">Zamfara</label>
									</div>

								</div>
							</div>
							<div class="filter-component">
								<div class="filter-header">
									<span>Job Type</span> <span
										class="filter-arrow glyphicon glyphicon-chevron-down pull-right"></span>
								</div>
								<div class="filter-values">
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobType" value="301">Freelance</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobType" value="302">Full Time</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobType" value="303">Internship</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobType" value="304">Part Time</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobType" value="305">Permanent</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobType" value="306">Temporary</label>
									</div>

								</div>
							</div>
							<div class="filter-component">
								<div class="filter-header">
									<span>Career Level</span> <span
										class="filter-arrow glyphicon glyphicon-chevron-down pull-right"></span>
								</div>
								<div class="filter-values">
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="101" name="careerLevel">Student
											(Undergraduate/Graduate)</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="102" name="careerLevel">Entry Level</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="103" name="careerLevel">Experienced
											(Non-Managerial)</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="104" name="careerLevel">Manager
											(Manager/Supervisor of Staff)</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="105" name="careerLevel">Executive
											(SVP,VP,Department Head etc)</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="106" name="careerLevel">Senoir Executive
											(President, CFO. etc)</label>
									</div>
								</div>

							</div>
							<div class="filter-component">
								<div class="filter-header">
									<span>Highest Education Level</span> <span
										class="filter-arrow glyphicon glyphicon-chevron-down pull-right"></span>
								</div>
								<div class="filter-values slim-scroll">
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="educationLevel" value="501">Higher National
											Diploma</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="educationLevel" value="502">Bachelor's Degree</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="educationLevel" value="503">Master's Degree</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="educationLevel" value="504">Post Graduate
											Diploma</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="educationLevel" value="505">Doctorate</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="educationLevel" value="506">Professional</label>
									</div>

								</div>
							</div>


							<div class="filter-component">
								<div class="filter-header">
									<span>Years Of Experience</span> <span
										class="filter-arrow glyphicon glyphicon-chevron-down pull-right"></span>
								</div>
								<div class="filter-values">
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="401" name="experience">0 - 1 year</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="402" name="experience">0 - 2 years</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="403" name="experience">1 - 3 years</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="404" name="experience">2 - 5 years</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="405" name="experience">3 - 5 years</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="406" name="experience">5 - 10 years</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="407" name="experience">more than 10 years</label>
									</div>
								</div>
							</div>



						</div>
					</div>
				</div>
			</form>
			<div class="col-sm-9">
				<div class="row" style="border-bottom: 1px solid #2f4779;">

					<div class="col-sm-6" style="padding-top: 1%; font-weight: bold">
						<span class="results-found"><c:out
								value='${recruiterDashboard.totalCandidates}' /></span> candidate(s)
						found
					</div>
					<div class="col-sm-6" style="padding-top: 1%;">
						<span class="pull-right" id="save-search"
							style="font-weight: bold; cursor: pointer;"><i
							data-placement="bottom" data-toggle="tooltip" title="Save Search"
							class="fa fa-floppy-o" aria-hidden="true"></i> Save Search</span>
					</div>
				</div>

				<div class="row" style="margin-top: 2%; margin-bottom: 2%;">
					<c:forEach var="item" items="${recruiterDashboard.prospects}">
						<div class="col-sm-3" style="margin-bottom: 2%;">
							<input type="hidden" value="${item.webkey}" class="webkey">
							<input type="hidden" value="${item.email}"
								class="candidate-email">
							<div class="card">
								<img
									<c:choose><c:when test='${empty item.pictureUrl }'> src="/images/unknown-user.jpg"</c:when><c:otherwise> src="${item.pictureUrl}"</c:otherwise></c:choose>
									alt="Avatar" style="width: 100%">
								<div style="padding: 5px 2px; text-align: center;">
									<h5 style="margin-bottom: 3px">
										<b><a
											href="<c:url value='/bq/closed/get-candidate-profile?web-key=${item.webkey}'/>"
											id="candidate-name"><c:out value='${item.firstName}' />
												<c:out value='${item.lastName}' /></a></b>
									</h5>
									<p style="font-family: calibri; margin-bottom: 2px"
										class="text-success">
										<c:out value='${item.highestQualification}' />
									</p>
									<div class="text-info"
										style="font-size: 10pt; font-stretch: narrower; font-style: italic;">
										<c:out value='${item.yearsOfExperience}' />
										years experience
									</div>
									<h5 style="margin-bottom: 2px; font-size: 12pt">
										<i data-placement="bottom" data-toggle="tooltip"
											title="Add To Project"
											style="color: #983b59; cursor: pointer; margin-right: 4px; margin-left: 4px"
											class="fa fa-plus add-to-project" aria-hidden="true"></i> <i
											data-placement="bottom" data-toggle="tooltip"
											title="Send Invite"
											style="color: #983b59; cursor: pointer; margin-right: 4px; margin-left: 4px"
											class="fa fa-envelope invite" aria-hidden="true"></i><i
											style="color: #983b59; cursor: pointer; margin-right: 4px; margin-left: 4px"
											data-placement="bottom" data-toggle="tooltip"
											title="Remove From List" class="fa fa-trash"
											aria-hidden="true"></i>
									</h5>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>

		</div>
	</div>

	<div id="save-search-modal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content"
				style="background-color: #c4cde0; color: #17233c;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Save Search</h4>
				</div>
				<div class="modal-body">
					<div id="save-search-msg-div"></div>
					<div class="form-group">
						<label>Name *</label> <input id="search-name" class="form-control">
					</div>
					<div class="form-group">
						<select id="ss-selected-project" class="form-control">
							<option value="" disabled selected hidden>* Select a
								project</option>
							<c:forEach var="item" items="${recruiterDashboard.projects}">
								<option value="${item.webKey}">${item.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success save-search-btn">Continue</button>
					<button type="button" class="btn btn-default " data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<div id="project-modal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						Adding <span id="no-of-candidates"></span> candidate to
					</h4>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<select id="selected-project" class="form-control">
							<option value="" disabled selected hidden>* Select a
								project</option>
							<c:forEach var="item" items="${recruiterDashboard.projects}">
								<option value="${item.webKey}">${item.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success add-candidate-btn">Continue</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<div id="invite-modal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content"
				style="background-color: #c4cde0; color: #17233c;">
				<div class="modal-header" style="background-color: #a24e69;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						Invite: <span id="name-of-candidate"></span>
					</h4>
					<h5>
						Email: <span id="email-of-candidate"></span>
					</h5>
				</div>
				<div class="modal-body">
					<form id="send-invite-form">
						<div class="form-group">
							<label>Project</label> <select name="project-webkey"
								class="form-control">
								<option value="" disabled selected hidden>* Select a
									project</option>
								<c:forEach var="item" items="${recruiterDashboard.projects}">
									<option value="${item.webKey}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>Message Title</label> <input name="invite-title"
								class="form-control">
						</div>
						<div class="form-group">
							<input type="hidden" id="invitee-key" name="invitee-key">
							<label>Message</label>
							<textarea name="invite-text" rows="6" class="form-control"
								style="white-space: pre-wrap;"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success send-invite-btn">Send
						Invite</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
	<script src="/js/candidate-filter.js"></script>
	<script type="text/javascript">
		var webkeys = [];
		$(document)
				.ready(
						function() {

							$(".send-invite-btn").click(function() {
								$.ajax({
									url : "/bq/closed/send-invite",
									method : "POST",
									data : $("#send-invite-form").serialize(),
									success : function() {
										alert("success");
									}
								});
							});

							$(".invite").click(function() {
								var par = $(this).closest(".row");
								var x = par.find(".webkey").val();
								var y = par.find("#candidate-name").text();
								var z = par.find(".candidate-email").text();
								$("#invitee-key").val(x);
								$("#name-of-candidate").text(y);
								$("#email-of-candidate").text(z);
								$("#invite-modal").modal();

							});

							$(".save-search-btn")
									.click(
											function() {
												var x = $("#search-name").val();
												var y = $(
														"#ss-selected-project")
														.val();
												$
														.ajax({
															url : "/bq/closed/save-search",
															data : {
																"search-name" : x,
																"project" : y
															},
															method : "POST",
															dataType : "json",
															success : function() {

															},
															error : function(
																	xhr) {
																console
																		.log(xhr);
																addError(
																		$("#save-search-msg-div"),
																		xhr.statusText);
																if (xhr.status == "200") {
																	addSuccess(
																			$("#save-search-msg-div"),
																			"Search Saved Successfully")
																}
															}
														});
											});
							$("#save-search").click(function() {
								$("#save-search-modal").modal();
							});
							$("#bulk-action").change(function() {
								var val = $(this).val();
								if (val == "1") {
									$("#project-modal").modal();
								}
							});
							$(".add-candidate-btn")
									.on(
											'click',
											function() {
												console.log(webkeys);
												var data = {
													"project-key" : $(
															"#selected-project")
															.val(),
													"candidate-key" : webkeys
												}

												$
														.ajax({
															url : '/bq/closed/add-candidate-to-project',
															method : 'POST',
															data : data,
															dataType : "json",
															success : function() {
																$(
																		"#project-modal")
																		.modal(
																				"hide");
															},
															traditional : true
														});
											});
							$(".add-to-project").click(function() {
								$(".select-prospect").prop("checked", false);
								webkeys = [];
								var par = $(this).closest(".row");
								var inp = par.find(".webkey").val();
								webkeys[webkeys.length] = inp;

								$("#project-modal").modal();
								$("#no-of-candidates").text(webkeys.length);

							});
							$(".select-prospect")
									.click(
											function() {
												var checked = $(this).is(
														":checked");
												var par = $(this).closest(
														".row");
												var inp = par.find(".webkey")
														.val();
												if (checked) {
													webkeys[webkeys.length] = inp;
													$("#bulk-action").prop(
															"disabled", false);
												} else {
													for (i = 0; i < webkeys.length; i++) {
														if (webkeys[i] === inp) {
															webkeys
																	.splice(i,
																			1);
														}
													}
													if (webkeys.length == 0) {
														$("#bulk-action").prop(
																"disabled",
																true);
													}
												}
												console.log(webkeys);
											});
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
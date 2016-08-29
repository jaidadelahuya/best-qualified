<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jobs Result</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/styles/jquery.webui-popover.min.css">
<link rel="stylesheet" href="/styles/main.css">
<link rel="stylesheet" href="/styles/animate.css">
<style type="text/css">


#job-alert-modal label {
	color: darkgreen;
	font-family: calibri;
	font-size: 10pt;
}



.list-bullet {
	border: 1px red #8CC152;
	padding: 4px;
	background-color: #A0D468;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	color: white !important
}

#get-rated {
	-webkit-animation-duration: 2s;
	-webkit-animation-delay: 2s;
	-webkit-animation-iteration-count: infinite;
}

#find-a-job {
	position: relative;
	-webkit-animation-name: example1; /* Chrome, Safari, Opera */
	-webkit-animation-duration: 4s; /* Chrome, Safari, Opera */
	animation-name: example1;
	animation-duration: 8s;
	animation-iteration-count: infinite;
}

/* Chrome, Safari, Opera */
@-webkit-keyframes example1 {
    0%   {left:0px;}
    25%  {left:60%;}
    50%  {left:60%;}
    75%  {left:0px;}
    100% {left:0px;}
}

/* Standard syntax */
@keyframes example1 {

    0%   {left:0px;}
    25%  {left:60%;}
    50%  {left:60%;}
    75%  {left:0px;}
    100% {left:0px;}
}


#animation-div {
	color: white;
	background-color: darkblue;
	-webkit-animation-name: example; /* Chrome, Safari, Opera */
	-webkit-animation-duration: 4s; /* Chrome, Safari, Opera */
	animation-name: example;
	animation-duration: 5s;
	animation-iteration-count: infinite;
}
/* Chrome, Safari, Opera */
@-webkit-keyframes example {
    0%   {background-color:darkblue;}
    25%  {background-color:#DA4453;}
    50%  {background-color:#967ADC;}
    75%  {background-color:#4A89DC;}
    100% {background-color:#DA4453;}
}

/* Standard syntax */
@keyframes example {
    0%   {background-color:darkblue;}
    25%  {background-color:#DA4453;}
    50%  {background-color:#967ADC;}
    75%  {background-color:#4A89DC;}
    100% {background-color:#DA4453;}
}



</style>
</head>
<body>
	<%@ include file="/main-nav.html"%>
	<form id="search-form">
		<br/><br/>
		<div class="container-fluid">
			<div class="row" style="margin-bottom: 2%;">

				<div class="col-sm-12 no-padding-div" style="color: white; background-image: url('/images/jobs-slide.jpg'); height: 300px; position: relative; width: 100%;">
					<div style="background-color: rgba(0,0,0,0.0); width: 400px; height: 220px; padding: 1%; position: absolute; bottom: 20px; left: 150px; font-family: century gothic">
						<h2 id="banner-quote">The reward for work well done is the opportunity to do more</h2><br/>
						<h4 id="banner-author">- Anonymous</h4>
					</div>
				</div>
				<!-- <div class="col-sm-6" style="">
					<br />
					<div class="col-sm-12 no-padding-div"
						style="background-color: rgba(200, 191, 231, 0.5); border-radius: 5px; -moz-border-radius: 5px; -webkit-border-radius: 5px">
						<div class="col-sm-12"
							style="background-color: rgba(79, 193, 233, 0.4); padding: 1%">
							<img id="find-a-job" class="img img-responsive"
								src="/images/find_a_job.png">
						</div>
						<div class="col-sm-12" style="padding: 2%">

							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Keyword, Job title"> <span
									class="input-group-btn">
									<button class="btn btn-secondary btn-success form-member"
										type="button">Go!</button>
								</span>
							</div>
						</div>
					</div>
				</div>  -->
			</div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-sm-3 no-padding-div">
					<div class="col-sm-12 no-padding-div"
						style="padding-top: 0px; border: 1px gray solid">
						<div class="col-sm-12 no-padding-div"
							style="border-bottom: 1px gray solid">
							<div class="filter-heading">
								<h4>Find A Job</h4>
							</div>
							<div class="col-sm-12 form-group">
								<input placeholder="Keyword, Job Title"
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
									<span>Job Category</span> <span
										class="filter-arrow glyphicon glyphicon-chevron-down pull-right"></span>
								</div>
								<div class="filter-values slim-scroll">
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="50">Accounting / Audit /
											Tax</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="72">Administration &amp;
											Office Support</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="107">Agriculture/Farming</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="53">Banking / Finance /
											Insurance</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="83">Building
											Design/Architecture</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="54">Construction</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="84">Consulting/Business
											Strategy &amp; Planning</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="85">Creatives(Arts, Design,
											Fashion)</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="82">Customer Service</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="76">Education/Teaching/Training</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="56">Engineering</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="79">Executive/Top
											Management</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="66">Healthcare/Pharmaceutical</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="59">Hospitality/Leisure/Travels</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="60">Human Resources</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="61">Information Technology</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="67">Legal</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="101">Logistics /
											Transportation</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="58">Manufacturing /
											Production</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="51">Marketing / Advertising
											/ Communications</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="81">NGO/Community Services
											&amp; Dev</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="68">Oil&amp;Gas/Mining/Energy</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="74">Project/Programme
											Management</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="105">QA&amp;QC / HSE</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="70">Real Estate / Property</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="103">Research</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="71">Sales/Business
											Development</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="106">Supply Chain /
											Procurement</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="77">Telecommunications</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											name="jobCategory" value="104">Vocational Trade and
											Services</label>
									</div>

								</div>
							</div>
							<div class="filter-component">
								<div class="filter-header">
									<span>Salary Range</span> <span
										class="filter-arrow glyphicon glyphicon-chevron-down pull-right"></span>
								</div>
								<div class="filter-values">
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="201" name="salaryRange">10,000 - 50,000</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="202" name="salaryRange">50,000 - 100,000</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="203" name="salaryRange">100,000 - 300,000</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="204" name="salaryRange">300,000 - 500,000</label>
									</div>
									<div class="checkbox">
										<label><input class="form-member" type="checkbox"
											value="205" name="salaryRange">Unspecified</label>
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
					<div class="col-sm-12 no-padding-div"
						style="background-image: url('/images/assess.jpg'); height: 320px; background-size: cover; border: 1px green solid; margin-top: 2%; margin-bottom: 2%; position: relative;">
						<div id="get-rated" class="animated tada"
							style="text-align: center; line-height: 1.2; width: 45%; position: absolute; right: 10px; padding: 1%; background-color: rgba(190, 190, 190, 0.5); top: 6em">
							<a
								style="cursor: pointer; text-decoration: none; color: red; font-weight: 700; font-size: 15pt; font-family: arial;">Take
								Free Assessment</a>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="col-sm-12 no-padding-div"
						style="border: 1px #eaeaea solid">
						<div class="col-sm-12 no-padding-div"
							style="padding: 1%; border-bottom: 1px #eaeaea solid">
							<div class="col-sm-5 no-padding-div text-primary"
								style="font-family: calibri; font-weight: bold;">
								<span class="results-found"><c:out
										value='${jobSearchResult.totalNumber}' /></span> results found
							</div>
							<form class="form-inline" role="form" action="<c:url value='' />">
								<div class="col-sm-4 no-padding-div"></div>
								<div class="col-sm-3 no-padding-div" style="text-align: right">
									<label style="padding-right: 4%;">Show </label><select
										style="width: 3em; display: inline" name="number-of-entries"><option>${jobSearchResult.numberToFetch}</option>
										<option>10</option>
										<option>25</option>
										<option>50</option></select>
								</div>
							</form>
						</div>
						<div id="list-container" class="col-sm-12 no-padding-div"
							style="padding-bottom: 0px; margin-bottom: 2%;">
							<c:forEach var="item" items="${jobSearchResult.ijobs}">
								<div class="col-sm-12"
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
													value='${item.location}' /></strong> <i
												style="font-family: calibri" class="text-danger pull-right">Posted
												<c:out value="${item.postedTime}" />
											</i>

										</h5>
									</div>

								</div>
							</c:forEach>
						</div>

					</div>
				</div>
				<div class="col-sm-3">
					<div class="col-sm-12 no-padding-div" data-toggle="modal"
						data-target="#job-alert-modal"
						style="border: 2px purple solid; cursor: pointer;">
						<img class="img img-responsive" src="/images/job-alert.jpg">
					</div>
					
						<div class="col-sm-12 no-padding-div" style="margin-bottom: 2%;">
						<a href="<c:url value='/bq/coaching/request-coach'/>"><img
						class="img img-responsive"
						style="border: 1px solid purple; padding: 2%;"
						src="/images/coach.png"></a>
				</div>
					</div>
				</div>
			</div>
		</div>

		<div id="job-alert-modal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content"
					style="background-image: url(/images/free-job-alert.png); background-size: 100% 100%;">
					<div class="modal-header" style="border-bottom: none;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">

						<div class="row">
							<div class="col-sm-5"></div>
							<div class="col-sm-7 no-padding-div" style="margin-top: 5%;">
								<h3
									style="text-align: center; font-weight: bolder; color: purple; font-family: arial">Sign
									Up for free Job alerts</h3>
									<div class="col-sm-12"><div id="msg-div"></div></div>
								<div class="col-sm-6  form-group ">
									<label>Job Location </label> <select class="form-control " id="ja-job-region"
										name="job-region">
										<option></option>
										<%@ include file="/partial/states.html" %>
									</select>
								</div>
								<div class="col-sm-6 form-group ">
									<label>Career Level </label> <select class="form-control" id="ja-career-level"
										name="career-level">
										<option></option>
										<%@ include file="/partial/career-level.html" %>
									</select>
								</div>
								<div class="col-sm-6 form-group ">
									<label>Salary Range </label> <select class="form-control" id="ja-salary"
										name="salary">
										<option></option>
										<%@ include file="/partial/salary-range.html" %>
									</select>
								</div>
								<div class="col-sm-6 form-group">
									<label>Job Type </label> <select class="form-control" id="ja-job-type"
										name="job-type">
										<option></option>
										<%@ include file="/partial/job-type.html" %>
									</select>
								</div>
								<div class="col-sm-12 form-group">
									<label>Email: </label> <input class="form-control" id="ja-email"

										placeholder="EMail">
								</div>
								<div class="col-sm-12 form-group" style="text-align: center">

									<input id="job-alert-sign-up" type="button" class="btn btn-lg btn-warning" value="Sign Up Now">

								</div>
							</div>

						</div>
					</div>

				</div>

			</div>
		</div>
		<div id="myModal1" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content"
					style="background-image: url('/images/experience-level.jpg');">
					<div class="modal-header" style="border: none">
						<button type="button" class="close" data-dismiss="modal">&times;</button>

					</div>
					<div class="modal-body">
						<h4 style="font-weight: bolder;" class="text-warning">
							Hello
							<c:out value='${professionalDashboard.name}' />

						</h4>
						
						<p>
							<strong class="text-danger">Select your experience level</strong>
						</p>
						<form id="exp-level-form"
							action="<c:url value='/bq/close/get-assessment-questions'/>">
							<select name="exp-level">
								<option value="Beginner">Beginner (0-3 yrs)</option>
								<option value="Intermediate">Intermediate (4-7 yrs)</option>
								<option value="Experienced">Experienced 8+ yrs</option>
							</select> <input class="btn btn-info" type="submit" value="Start test">
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/pages/footer.html"%>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/jquery-ui.min.js"></script>
	<script src="/js/jquery.slimscroll.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.webui-popover.min.js"></script>
	<script src="/js/waitMe.js"></script>
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
	<script src="/js/main.js"></script>
	<script src="/js/filter.js"></script>
	<script type="text/javascript">
		var slideCounter = 1;
		var quotes = [ "The only way to do great work is to love what you do", "If the plan doesn't work, change the plan but never the goal",
				"Staying motivated will give your job search a clear direction", "The Reward for work well done is the opportunity to do more" ];
		var author = ["- Steve Jobs","- Anonymous","- Anonymous","- Anonymous"];
		$(document)
				.ready(
						function() {
							$("#job-alert-sign-up").click(function() {
<<<<<<< Updated upstream
								var email = $("#ja-email").val();
								if(email == "") {
									console.log("no way");
									addError($("#msg-div"), "You have to enter your email");
								}else {
									var loc = $("#ja-job-region").val();
									var cl = $("#ja-career-level").val();
									var sal = $("#ja-salary").val();
									var jt = $("#ja-job-type").val();
									$.ajax({
										url : "/bq/open/save-job-alert",
										method : "POST",
										data : {
											"email" : email,
											"job-region" : loc,
											"career-level" : cl,
											"salary" : sal,
											"job-type" : jt
										},
										dataType : "json",
										success : function () {
											addSucces($("#msg-div"), "Your Job Alert has been saved.")
										},
										error : function (jqXHR, status, errorThrown) {
										console.log(jqXHR);
											if(jqXHR.status==200) {
												addSuccess($("#msg-div"),"Your Job Alert has been saved." );
											}else {
												addError($("#msg-div"), jqXHR.statusText);
											}
											
										}
									});
								}
								
=======
>>>>>>> Stashed changes
								
							});
							$("#get-rated").click(function() {
								$("#myModal1").modal();
							});
							startSlider();
							
						});
		function startSlider() {
			
			if (slideCounter > 3) {
				slideCounter = 0;
			}
			window.setTimeout(function() {
				$("#banner-quote").fadeOut("slow","linear", function() {
					$("#banner-quote").text(quotes[slideCounter]);
					$("#banner-author").text(author[slideCounter]);
					slideCounter++;
					$("#banner-quote").fadeIn("slow","linear",function() {
						startSlider();
					})
				});
			}, 5000);
			
			
			
		}
	</script>
</body>
</html>
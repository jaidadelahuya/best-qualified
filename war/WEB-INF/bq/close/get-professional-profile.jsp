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
<link rel="stylesheet" type="text/css"
	href="/styles/jquery.webui-popover.min.css">
<link rel="stylesheet" href="/styles/main.css">
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
		<div class="col-sm-8">
			<div class="row ">

				<div class="col-sm-12 card-panel no-padding-div">

					<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666">Personal
						Information</h4>
					<div class="row">
						<div class="col-sm-3">
							<img alt="" src="/images/unknown-user.jpg"
								class="img img-responsive"
								style="width: 100%; margin: 2%; margin-top: 4%;">
						</div>
						<div class="col-sm-9" style="padding-top: 2%;">
							<div class="col-sm-12"
								style="font-size: 14pt; font-weight: bold;">
								<span><c:out value="${professionalProfileBean.firstName}" />
									<c:out value="${professionalProfileBean.lastName}" /></span>
							</div>
							<div class="col-sm-12">
								<span><c:out value='${professionalProfileBean.email}' /></span>
							</div>
							<div class="col-sm-12">

								<span><c:out value='${professionalProfileBean.tagline}' /></span>
							</div>
							<div class="col-sm-12">

								<span><c:out
										value='${professionalProfileBean.currentEmployer}' /></span>

							</div>
							<div class="col-sm-12">
								<span><c:out value='${professionalProfileBean.phone}' /></span>
							</div>
						</div>
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
						<div class="col-sm-12">
							<div class="inline-output">${professionalProfileBean.profileSummary}</div>
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

						<div class="col-sm-12">
							<c:set var='index' value='1' />
							<c:forEach var="item"
								items="${professionalProfileBean.workExperience}">
								<div class="col-sm-12 module-div"
									<c:if test="${index < fn:length(professionalProfileBean.workExperience)}">style="border-bottom: 1px #d1d1d1 solid"</c:if>>
									<c:set var='index' value='${index+1}' />
									<h4 class="position">
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
								</div>
							</c:forEach>
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

						
						<div class="col-sm-12">
							<c:set var='edIndex' value='1' />
							<c:forEach var="item" items="${professionalProfileBean.education}">
								<div class="col-sm-12 module-div"
									<c:if test="${edIndex < fn:length(professionalProfileBean.education)}">style="border-bottom: 1px #d1d1d1 solid"</c:if>>
									<c:set var='edIndex' value='${edIndex+1}' />
									<h4 class="instituition">
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
									
								</div>
							</c:forEach>
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


						<div class="col-sm-12 award-div">
							<c:set var='awIndex' value='1' />
							<c:forEach var="item" items="${professionalProfileBean.awards}">
								<div class="col-sm-12 module-div"
									<c:if test="${edIndex < fn:length(professionalProfileBean.awards)}">style="border-bottom: 1px #d1d1d1 solid"</c:if>>
									<c:set var='awIndex' value='${awIndex+1}' />
									<h4 class="name">
										<c:out value='${item.name}' />
									</h4>
									<h5 class="extra" style="font-family: calibri">
										<c:out value='${item.description}' />
									</h5>
									<h5 style="font-family: calibri">
										<span class="start-month"> <c:out value='${item.month}' /></span>
										<span class="start-year"> <c:out value='${item.year}' />
										</span>
									</h5>
									
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="col-sm-4">
			<div class="col-sm-12 card-panel no-padding-div">

				<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666"
					class="">Curriculum Vitae</h4>
				
						<p class="file-name">
							<a target="_blank"
								href="<c:url value='/bq/close/get-cv?safe-key=${professionalProfileBean.cvSafeString}' />"><c:out
									value='${professionalProfileBean.cv}' /></a>
						</p>
			</div>
			<div class="col-sm-12 card-panel no-padding-div">

				<h4 style="margin-bottom: 4%; font-weight: bold; color: #666666"
					class="">Other Information</h4>

			</div>

		</div>

	</div>
	<%@ include file="/WEB-INF/pages/footer.html"%>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.webui-popover.min.js"></script>
	<script src="/js/waitMe.js"></script>
	<script src="/js/main.js"></script>

</body>
</html>
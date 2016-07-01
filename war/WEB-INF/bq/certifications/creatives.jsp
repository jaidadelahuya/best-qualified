<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/styles/jquery.webui-popover.min.css">
<link rel="stylesheet" href="/styles/main.css">
<title>Creatives</title>
<style type="text/css">
.grad1 {
	height: 250px;
	background: #dadada; /* For browsers that do not support gradients */
	background: -webkit-linear-gradient(right, #dadada, white);
	/* For Safari 5.1 to 6.0 */
	background: -o-linear-gradient(left, #dadada, white);
	/* For Opera 11.1 to 12.0 */
	background: -moz-linear-gradient(left, #dadada, white);
	/* For Firefox 3.6 to 15 */
	background: linear-gradient(to left, #dadada, white);
	/* Standard syntax (must be last) */
}

.cert-view {
	border: 1px solid #3f6471;
	border-radius: 4px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
}

.cert-view-header {
	background-color: #013143;
	background: -webkit-linear-gradient(right, #013143, #738e97);
	/* For Safari 5.1 to 6.0 */
	background: -o-linear-gradient(left, #013143, #738e97);
	/* For Opera 11.1 to 12.0 */
	background: -moz-linear-gradient(left, #013143, #738e97);
	/* For Firefox 3.6 to 15 */
	background: linear-gradient(to left, #013143, #738e97);
	/* Standard syntax (must be last) */
}

.cert-view-header h3 {
	margin: 0;
	font-size: 26pt;
	padding: 2%;
	color: white;
}

.cert-view-content {
	padding: 2%;
	padding-bottom: 0px;
	margin-bottom: 2%;
}

.info-div {
	border: 1px solid #dadada;
	border-left: 3px solid red;
	border-radius: 4px;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	height: auto !important;
	padding-left: 2%;
	padding-right: 2%;
	margin-bottom: 1%;
}
</style>
</head>
<body>
	<%@ include file="/main-nav.html"%>
	<br />
	<div class="container-fluid grad1">
		<br />
		<div class="row">
			<div class="col-sm-7" style="text-align: center;">

				<h1 style="color: #013143; font-family: roboto; margin-top: 10%;">
					<span class="pull-right"><span style="color: red">Get
							Certified, </span> Increase and improve on your creative experiences</span>
				</h1>
			</div>
			<div class="col-sm-5">
				<div>
					<img alt="" src="/images/sales-professional.png"
						class="img img-responsive">
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 2%; margin-bottom: 2%;">
		<div class="row">
			<div class="col-sm-8">
				<div class="row" style="margin-bottom: 1%;">
					<div class="col-sm-12 cert-view no-padding-div">
						<div class="col-sm-12 cert-view-header no-padding-div">
							<h3>Adobe</h3>
						</div>
						<div class="col-sm-12 no-padding-div cert-view-content">
							<h4>Adobe Certified Associate (ACA)</h4>
							<div class="col-sm-12 no-padding-div cert-view-content">
								<p style="margin-bottom: 0px">Adobe Certified Associate is
									an entry-level certification aimed at demonstrating and
									validating communication skills using a particular digital
									communication tool. This is the certification for individuals
									getting ready for internships, graduate jobs. The areas covered
									by the ACA are as follows:</p>
							</div>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Areas Covered</strong>

									</h5>
									<ul>
										<li>Visual Communication with Adobe Photoshop</li>
										<li>Rich Media Communication with Flash</li>
										<li>Web Communication with Dreamweaver</li>
									</ul>
								</div>

							</div>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Audience</strong>
									</h5>
									<ul>
										<li>Individuals getting ready for internships and
											graduate jobs</li>
									</ul>
								</div>
							</div>
							<div class="col-sm-12 no-padding-div cert-view-content">
								<h4>Adobe Certified Expert (ACE)</h4>
								<div class="col-sm-12 no-padding-div cert-view-content">
									<p style="margin-bottom: 0px">The Adobe Certified Expert is
										a professional-level certification. The Adobe Certified Expert
										is a qualified professional in web design, digital media, or
										rich internet application development. The ACE is offered for
										almost all Adobe products. To prepare for the exams, a
										professional can use books from Adobe Press and other
										publishers, self-paced online training from Lynda.com and
										other sources, and training from Adobe Authorised Training
										Centres.</p>
								</div>
								<div class="col-sm-12">
									<div class="info-div grad1">
										<h5>
											<strong>To earn the ACE if a professional already
												has the ACA</strong>

										</h5>
										<ul>
											<li>Gain experience with daily use of the product</li>
											<li>Self-assess your skills against the ACE objectives
												within the Prep Guide</li>
											<li>If needed, find an intermediate-level course from an
												Adobe Authorized Training Center or Adobe Certified
												Instructor to improve the areas you have identified</li>
											<li>Take the ACE exam once you are prepared</li>
										</ul>
									</div>

								</div>
								<div class="col-sm-12">
									<div class="info-div grad1">
										<h5>
											<strong>Audience</strong>
										</h5>
										<ul>
											<li>Industry professionals who have a deep level of
												mastery in using Adobe technology</li>
										</ul>
									</div>
								</div>


								<div class="col-sm-12">
									<p>
										<a href="http://training.adobe.com/">Learn more</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					</div>
					<div class="row" style="margin-bottom: 1%">
						<div class="col-sm-12 cert-view no-padding-div">
							<div class="col-sm-12 cert-view-header no-padding-div">
								<h3>Hubspot</h3>
							</div>
							<div class="col-sm-12 no-padding-div cert-view-content">
								<p style="margin-bottom: 0px">This is a free certification
									from HubSpot. It is built to test knowledge and proficiency of
									a Designer on HubSpot’s design tools. The Designer is expected
									to create styled templates that help HubSpot customers hit
									their marketing goals with responsive websites. The
									certification is intended for web designers who have, at
									minimum, an intermediate familiarity with HTML and CSS.
									Although only a basic knowledge of HTML is required for
									building site templates on HubSpot.</p>
							</div>
							<div class="col-sm-12 no-padding-div cert-view-content">
								<h4>Hubspot Design Certification</h4>
								<div class="col-sm-12">
									<div class="info-div grad1">
										<h5>
											<strong>HubSpot Design Certification</strong>

										</h5>
										<ul>
											<li>Signing up for a complimentary account or Logging in</li>
											<li>Finding inbound Sales certification library and
												study guides</li>
											<li>Taking the self-study classes</li>
											<li>Passing the certification exam</li>
										</ul>
									</div>

								</div>
								<div class="col-sm-12">
									<div class="info-div grad1">
										<h5>
											<strong>Audience</strong>
										</h5>
										<ul>
											<li>Anyone with knowledge of HTML and CSS</li>
										</ul>
									</div>
								</div>
								<div class="col-sm-12">
									<p>
										<a href="http://academy.hubspot.com/certification">Learn
											more</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="margin-bottom: 1%">
						<div class="col-sm-12 cert-view no-padding-div">
							<div class="col-sm-12 cert-view-header no-padding-div">
								<h3>CIW Web Design Professional</h3>
							</div>
							<div class="col-sm-12 no-padding-div cert-view-content">
								<p style="margin-bottom: 0px">CIW (Certified Internet Web
									Professional) is a vendor-neutral certification series for
									Information Technology within the United States. For the Web
									design professional, it is important to have a working
									knowledge of both Web design and e-commerce. Therefore, two
									separate certification exams must be passed.</p>
							</div>
							<div class="col-sm-12 no-padding-div cert-view-content">

								<div class="col-sm-12">
									<div class="info-div grad1">
										<h4>CIW Web Design Specialist</h4>
										<h4>CIW E-Commerce Specialist</h4>
									</div>

								</div>
								<div class="col-sm-12">
									<div class="info-div grad1">
										<h5>
											<strong>Audience</strong>
										</h5>
										<ul>
											<li>Web and Graphic Designers</li>
											<li>Web Marketing Professionals and Creative Directors</li>
											<li>Art directors and Advertising Professionals</li>
										</ul>
									</div>
								</div>
								<div class="col-sm-12">
									<p>
										<a href="http://www.ciwcertified.com">Learn more</a>
									</p>

								</div>
							</div>
						</div>
					</div>
					
				</div>
				
			
			<div class="col-sm-4">
						<%@ include file="/WEB-INF/pages/certification-sidebar.html"%>
					</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/pages/footer.html"%>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>
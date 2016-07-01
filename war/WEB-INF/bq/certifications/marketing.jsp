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
<title>Marketing</title>
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
		<br/>
		<div class="row">
			<div class="col-sm-7" style="text-align: center;">
				
				<h1 style="color: #013143; font-family: roboto; margin-top: 10%; text-align: center">
					<span>Earn Valuable Credentials For A<br/> <span style="color: red">Marketing Professional</span></span>
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

				<div class="row" style="margin-bottom: 1%">
					<div class="col-sm-12 cert-view no-padding-div">
						<div class="col-sm-12 cert-view-header no-padding-div">
							<h3>AMA</h3>
						</div>
						<div class="col-sm-12 no-padding-div cert-view-content">
							<p style="margin-bottom: 0px">The American Marketing Association (AMA) is a professional body based in the United States. 
							The AMA provides membership, training, and certification in Marketing. 
							To demonstrate a mastery of the core marketing knowledge and principles earn the Professional Certified Marketing (PCM).</p>
						</div>
						<div class="col-sm-12 no-padding-div cert-view-content">
							<h4>Professional Certified Marketing</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>American Marketing Association's PCM can be earned by</strong>

									</h5>
									<ul>
									<li>providing proof of formal education and professional experience</li>
										<li>successful completion of a certification exam</li>
										<li>adherence to a code of ethics</li>
										<li>The PCM requires that already certified professionals go for recertification every 3 years. 
											This involves obtaining 40 Continuing Education Units (CEUs) over 3 years and undergoing the recertification process. 
											One unit is approximately 1 hour of attending seminars, eLearning, university coursework, instructor-led training, conferences and seminars, 
											researching and publishing, speaking and instruction and other activities which encourage professional growth.</li>
									</ul>
								</div>

							</div>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Audience</strong>
									</h5>
									<ul>
										<li>Marketers</li>
									</ul>
								</div>
							</div>
							<div class="col-sm-12">
								
									<p><a href="https://www.ama.org/events-training/Certification/Pages/default.aspx">Learn more</a></p>
							</div>
						</div>
					</div>
				</div>
				
							
				<div class="row" style="margin-bottom: 1%;">
					<div class="col-sm-12 cert-view no-padding-div">
						<div class="col-sm-12 cert-view-header no-padding-div">
							<h3>CIM</h3>
						</div>
						<div class="col-sm-12 no-padding-div cert-view-content">
							<p style="margin-bottom: 0px">The Chartered Institute of Marketing (CIM) is a professional association based in the United Kingdom.
							 The CIM offers membership, training and certification in Marketing and related subjects, especially in Marketing and Sales.</p>
						</div>
						<div class="col-sm-12 no-padding-div cert-view-content">
							<h4>Foundation Certificate in Marketing</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Learning Outcome</strong>

									</h5>
									<ul>
										<li>Understand marketing principles</li>
										<li>Understand different ways of communicating with different customers </li>
										<li>Understand digital marketing and key tools used for communication</li>
									</ul>
								</div>

							</div>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Audience</strong>
									</h5>
									<ul>
										<li>Managers in non-marketing functions, entrepreneurs, apprentices and those starting out in a marketing career</li>
									</ul>
								</div>
							</div>
							<h4>Certificate in Professional Marketing</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Learning Outcome</strong>

									</h5>
									<ul>
										<li>Understand the role and function of marketing in some depth</li>
										<li>Learn the different ways of communicating with customers, both inside and outside the organisation</li>
										
									</ul>
								</div>

							</div>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Audience</strong>
									</h5>
									<ul>
										<li>Marketing assistants or others working in marketing support roles</li>
									</ul>
								</div>
							</div>
							<h4>Diploma in Professional Marketing</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Learning Outcome</strong>

									</h5>
									<ul>
										<li>Learn the strategic marketing planning process</li>
										<li>Understand of key marketing metrics and measurement techniques</li>
										
									</ul>
								</div>

							</div>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Audience</strong>
									</h5>
									<ul>
										<li>Marketers in operational, supervisory or management roles</li>
									</ul>
								</div>
							</div>
							<h4>Post Graduate Diploma in Marketing</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Learning Outcome</strong>

									</h5>
									<ul>
										<li>Transition into strategic marketing management</li>
										<li>Learn how to work more cross functionally at a senior management level</li>
										<li>Learn to demonstrate leadership and influence</li>
									</ul>
								</div>
										
							</div>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Audience</strong>
									</h5>
									<ul>
										<li>Experienced marketers and senior business people</li>
									</ul>
								</div>
							</div>
							<div class="col-sm-12">
								<p><a href="http://www.cim.co.uk/qualifications/">Learn more</a></p>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="margin-bottom: 1%;">
					<div class="col-sm-12 cert-view no-padding-div">
						<div class="col-sm-12 cert-view-header no-padding-div">
							<h3>NIMN</h3>
						</div>
						<div class="col-sm-12 no-padding-div cert-view-content">
							<p style="margin-bottom: 0px">The National Institute of Marketing of Nigeria (NIMN) is the body for professionals engaged in marketing and related fields. Membership is compulsory for all marketing practitioners in Nigeria.
							 The NIMN provides trainings, examinations and consultancy activities as a means of ensuring that its members adopt professional approach to marketing</p>
						</div>
						<div class="col-sm-12 no-padding-div cert-view-content">
							<h4>Foundation Certificate in Marketing</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Learning Outcome</strong>

									</h5>
									<ul>
										<li>Understand fundamentals of marketing</li>
										<li>Understand fundamentals of selling</li>
										<li>Develop marketing communication skills</li>
									</ul>
								</div>

							</div>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Audience</strong>
									</h5>
									<ul>
										<li>Degree Holders and experienced marketing professionals</li>
									</ul>
								</div>
							</div>
							<h4>Chartered Graduate Diploma in Marketing</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Learning Outcome</strong>

									</h5>
									<ul>
										<li>Understand business analysis</li>
										<li>Learn to conduct marketing research</li>
										<li>Develop skills in electronic marketing</li>
									</ul>
								</div>

							</div>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Audience</strong>
									</h5>
									<ul>
										<li>Degree holders and holders of NIMN Foundation Certificate in Marketing</li>
									</ul>
								</div>
							</div>
							<h4>Chartered Post Graduate Diploma in Marketing</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Learning Outcome</strong>

									</h5>
									<ul>
										<li>Understand strategic marketing management</li>
										<li>Learn product development & brand management</li>
										<li>Develop skills in distribution and logistics management</li>
									</ul>
								</div>

							</div>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Audience</strong>
									</h5>
									<ul>
										<li>Holders of the NIMN Chartered Graduate Diploma in Marketing</li>
									</ul>
								</div>
							</div>
							<div class="col-sm-12">
								<p><a href="http://nimn.com.ng/">Learn more</a></p>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="margin-bottom: 1%;">
					<div class="col-sm-12 cert-view no-padding-div">
						<div class="col-sm-12 cert-view-header no-padding-div">
							<h3>CMMP</h3>
						</div>
						<div class="col-sm-12 no-padding-div cert-view-content">
							<p style="margin-bottom: 0px">The Certified Marketing Management Professional (CMMP) is a globally-accepted certification provided by the International Institute of Marketing Professional (IIMP) and based in Canada. 
							The CMMP demonstrates high professional, educational and ethical standards in marketing.
							It is also an indication of marketing knowledge, skills and abilities.</p>
						</div>
						<div class="col-sm-12 no-padding-div cert-view-content">
							<h4>Associate CMMP</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Criteria</strong>

									</h5>
									<ul>
										<li>meet specific academic requirements</li>
										<li>meet specific work experience requirements</li>
										<li>go through certain mandatory courses</li>
										<li>pass an exam demonstrating competencies in the workplace</li>
										
									</ul>
								</div>

							</div>
							<h4>Manager CMMP</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Criteria</strong>

									</h5>
									<ul>
										<li>meet specific academic requirements</li>
										<li>meet specific work experience requirements</li>
										<li>go through certain mandatory courses</li>
										<li>pass an exam demonstrating competencies in the workplace</li>
										<li>successfully complete <strong>Associate CMMP</strong> level</li>
									</ul>
								</div>

							</div>
							
							<h4>Executive CMMP</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Criteria</strong>

									</h5>
									<ul>
										<li>meet specific academic requirements</li>
										<li>meet specific work experience requirements</li>
										<li>go through certain mandatory courses</li>
										<li>pass an exam demonstrating competencies in the workplace</li>
										<li>successfully complete <strong>Manager CMMP</strong> level</li>
									</ul>
								</div>

							</div>
						
							<h4>Chartered CMMP</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Criteria</strong>

									</h5>
									<ul>
										<li>meet specific academic requirements</li>
										<li>meet specific work experience requirements</li>
										<li>go through certain mandatory courses</li>
										<li>pass an exam demonstrating competencies in the workplace</li>
										<li>successfully complete <strong>Executive CMMP</strong> level</li>
									</ul>
								</div>

							</div>
							<div class="col-sm-12">
								<p><a href="http://www.theiimp.org/cmmp-designation/">Learn more</a></p>
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
							<p style="margin-bottom: 0px">The inbound Certification is a free qualification offered by Hubspot. 
							It covers the principal components of Inbound Marketing and has a self–paced set of courses. 
							The certification is important if professionals want to understand the fundamentals of attracting visitors, 
							lead nurturing and conversion, close customers and delight customers into promoters. </p>
						</div>
						<div class="col-sm-12 no-padding-div cert-view-content">
							<h4>Inbound Marketing Certification</h4>
							<div class="col-sm-12">
								<div class="info-div grad1">
									<h5>
										<strong>Inbound Marketing Certificate can be earned by</strong>

									</h5>
									<ul>
										<li>Signing up for a complimentary account or Logging in</li>
										<li>Finding inbound Sales certification library and study
											guides</li>
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
										<li>Marketers, non-marketers, entrepreneurs and students</li>
									</ul>
								</div>
							</div>
							<div class="col-sm-12">
							<p><a href="http://certification.hubspot.com/inbound-sales-certification">Learn more</a></p>
								
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
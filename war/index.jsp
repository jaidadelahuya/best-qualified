<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.bestqualified.controllers.GeneralController"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bestqualified.entities.Job"%>
<%@ page import="com.bestqualified.bean.IndexBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.bestqualified.util.Util"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Best Qualified</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/styles/jquery.webui-popover.min.css">
<link rel="stylesheet" href="/styles/waitMe.css">
<link rel="stylesheet" href="/styles/main.css">
<link rel="stylesheet" href="/styles/font-awesome.min.css">

</head>

<body
	style="font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif !important;">

	<%@ include file="/main-nav.html"%>
	<br>
	<br>
	<%!
	List<com.bestqualified.entities.Article> articles = GeneralController.getNArticlesByDate(3);
	List<Job> jobs = GeneralController.getNJobs(10);
	
	IndexBean ib = new IndexBean();
	String date = new SimpleDateFormat("MMMM-dd-yyyy")
	.format(new Date());
	%>

	<%
	ib.setArticles(Util.toArticleBeans(articles,null));
	ib.setIjs(Util.toInterestedJobs(jobs));
		synchronized(session) {
			session.setAttribute("indexBean", ib);
			session.setAttribute("currentDate", date);
		}
	%>
	<!-- carousel -->
	<div id="my_carousel" class="carousel fade" data-ride="carousel">
		<!-- methods: data-interval="3000" // seconds between transitions; set to "0" to make it not automatic
					  data-pause="false" // "hover" is the default
					  data-wrap="false" // "true" is the default
		-->

		<!-- indicators -->
		<!-- <ol class="carousel-indicators">-->
		<!-- .active makes that carousel image the first to be shown in the rotation -->
		<!-- data-target referrs to id of carousel; data-slide-to referrs to slide number in array starting with 0 -->
		<!--	<li data-target="#my_carousel" data-slide-to="0" class="active"></li>
				<li data-target="#my_carousel" data-slide-to="1" class=""></li>
				<li data-target="#my_carousel" data-slide-to="2" class=""></li>
			</ol>
			-->

		<!-- carousel images -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="/images/bq-slide-1.jpg" alt="carousel_image_4">
			</div>
			<div class="item">
				<img src="/images/bq-slide-2.jpg" alt="carousel_image_2">
			</div>
			<div class="item">
				<img src="/images/bq-slide-3.jpg" alt="carousel_image_1">
			</div>

		</div>

		<!-- side buttons -->
		<!-- href referrs to the id of the carousel -->
		<a class="left carousel-control" href="#my_carousel" role="button"
			data-slide="prev"> <!--<span class="glyphicon glyphicon-chevron-left"></span> -->
		</a> <a class="right carousel-control" href="#my_carousel" role="button"
			data-slide="next"> <!--<span class="glyphicon glyphicon-chevron-right"></span>-->
		</a>

	</div>
	<!-- end .carousel -->
	<br>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="media headlines">
					<a class="pull-left" href="#"><img
						class="media-object img-rounded" src="/images/job.png"></a>
					<div class="media-body">
						<h4 class="media-heading">
							<strong><a href="/bq/open/all-jobs"
								style="text-decoration: none;">CAREER MOBILITY</a></strong>
						</h4>
						<h5 class="job">Get hired in industries of your choice</h5>
						<p class="plat">Start your exciting career journey here</p>

						<p id="edi" class="text-muted">
							<span>Search from over: 520, 000+ positions today!</span>
						</p>

					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="media headlines">
					<a class="pull-right" href="/bq/certifications"><img
						class="media-object img-rounded" src="/images/train.png"></a>
					<div class="media-body">
						<h4 class="media-heading" style="font-weight: bold !important;">
							<a href="/bq/certifications" style="text-decoration: none;">CERTIFICATIONS</a>
						</h4>
						<h5 class="jobs">Get hired in industries of your choice</h5>
						<p class="plat">Free or affordable trainings to improve your
							career.</p>
						<p id="edi" class="text-muted">
							<span>AMA</span> <span>APCON</span> <span>CIM</span> <span>NIPR</span>
							<span>NIMN</span> <span>HSE</span> <span>CIBM</span> <span></span>
						</p>
					</div>
				</div>
			</div>
		</div>

		<hr />
		<div class="row">
			<div class="col-md-6">
				<div class="media headlines">
					<a class="pull-left" href="/bq/coaching/home"><img
						class="media-object img-rounded" src="/images/coaching.png"></a>
					<div class="media-body">
						<h4 class="media-heading">
							<strong><a href="/bq/coaching/home"
								style="text-decoration: none;">CAREER SUPPORT</a></strong>
						</h4>
						<h5 class="jobss">Get hired in industries of your choice</h5>
						<p class="plat">Latest career advice will be sent to your
							inbox.</p>
						<p id="edi" class="text-muted">2000 professionals online! Talk
							to one now!</p>

					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="media headlines">

					<a class="pull-right" href="/bq/general-community"><img
						class="media-object img-rounded" src="/images/community.png"></a>
					<div class="media-body">
						<h4 class="media-heading">
							<a href="/bq/general-community"><strong>COMMUNITY</strong></a>
						</h4>
						<h5 class="jobsss">Get hired in industries of your choice</h5>
						<p class="plat">Plug into new communities that can improve
							your network.</p>
						<p id="edi" class="text-muted">1000 groups of sales
							professional</p>

					</div>
				</div>
			</div>
		</div>


	</div>
	<hr />
	<div class="container">
		<div class="row" style="">
			<div class="col-md-2" style="text-align: center;">
				<a href=""><img src="/images/addd.jpg" alt=""
					class="img-responsive"
					style="height: 508px; width: 180px; border: 1px solid #BF55EC;"></a>
			</div>
			<div class="col-md-7" id="blogodo">
				<h4>FROM OUR COMMUNITY</h4>
				<c:forEach var="item" items="${indexBean.articles}">
					<div class="media">
						<c:if test="${not empty item.pictureUrl }"><a class="pull-left"
							href='<c:url value="/bq/community/article/single?webkey=${item.webkey}" />'><img
							class="media-object img-rounded" src="${item.pictureUrl}"
							width="130" height="130"></a></c:if>
						<div class="media-body">
							<a href='<c:url value="/bq/community/article/single?webkey=${item.webkey}" />'><h3
									class="media-heading" id="lol">${item.title}</h3></a>
							<p
								style="color: #983b59; font-family: calibri; letter-spacing: 3px">
								<span style="margin-left: 5px;"><i class="fa fa-user"></i>
									BEST-QUALIFIED</span> <span><i class="fa fa-clock-o"></i> <c:out
										value='${item.postDate}' /></span> <span><i
									class="fa fa-comments"></i><a> 0</a></span>
							</p>
							<p>
								${item.snippet}<span><a
									href='<c:url value="/bq/community/article/single?webkey=${item.webkey}" />'>  <i
										class="fa fa-angle-double-right" aria-hidden="true"></i></a></span>
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-md-3" id="adopo">
				<div class="well" style="background: rgba(78, 189, 163, 0.13);">
					<h4>Are you a recruiter</h4>
					<ul class="disc-bullet">
						<li>Post jobs and monitor your applications</li>
						<li>Use our extensive database to search candidates</li>
						<li><i>And much more...</i></li> </ ul>

						<div style="text-align: center;">
							<p>
								<button class="btn btn-info">Register Now</button>
							</p>
						</div>
				</div>

				<div>
					<br>
					<h4 style="color: #000;">INTERVIEW ADVICE</h4>
					<a href="/bq/coaching/tools/interview-cheats"><img
						src="/images/ad.png" alt="" class="img-responsive"></a>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>




	<div class="container">
		<div class="row" id="fru">

			<div class="col-md-12 jobfix">
				<div class="row">
					<div class="col-md-6" id="vawa">
						<h4>
							Latest Positions <span><a
								href="<c:url value='/bq/open/all-jobs'/>">View all <i
									class="fa fa-angle-double-right" aria-hidden="true"></i></a></span>
						</h4>
					</div>

				</div>

				<ul style="margin-left: -37px;">
					<c:forEach var="item" items="${indexBean.ijs}">
						<li>
							<h5>
							<a href="/bq/open/job?job-key=${item.jobKey}" data-toggle="tooltip"  data-placement="right" title="<c:out value="${item.jobTitle}" />" class="toola">
							<c:out value="${item.jobTitle}" /></a>
							</h5> 
							<div class="box">
							<span style="font-family: calibri; color: #983b59" class="trunc"><c:out value="${item.companyName}" />
							</span>
							<span style="font-family: calibri; color: #983b59" class="origin">
							<p class="tort">
							<c:out value="${item.companyName}" />
							</p>
							</span>
							<p style="font-size: 10pt; color: #59983b; font-style: italic;" class="timly">
								<c:out value="${item.postedTime}" />
							</p>
							</div>			
							
						</li>
					</c:forEach>
					<li style="background: rgba(78, 189, 163, 0.4);">
						<div class="media">
							<a class="pull-left" href="#"><i
								class="fa fa-envelope-o fa-2x" aria-hidden="true"></i></a>
							<div class="mojo">
								<p>
									<a href="" style="font-size: 13px">GET JOB ALERTS</a>
								</p>
								<span><a href="#">Get the latest jobs first direct to
										your inbox.</a></span>
							</div>
						</div>
					</li>
					<li style="background: rgba(241, 115, 66, 0.4);">
						<div class="media">
							<a class="pull-left" href="#"><i
								class="fa fa-cloud-upload fa-2x" aria-hidden="true"></i></a>
							<div class="mojo">
								<p>
									<a href="">UPLOAD CV</a>
								</p>
								<span><a href="#">Let employers and recruiters find
										you!.</a></span>
							</div>
						</div>
					</li>

				</ul>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>

	<%@ include file="/WEB-INF/pages/footer.html"%>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.webui-popover.min.js"></script>
	<script type="text/javascript">	</script>
	<script>
		$(document).ready(function(){
   		 $('[data-toggle="tooltip"]').tooltip(); 
		});
	</script>
	<script>
	$(document).ready(function(){
     $(".box").hover(function(){
     	$(this).find(".trunc").css("display", "none");
         $(this).find(".origin").css("display", "block");
         $(this).find(".timly").css("display", "none");
     },
     	function(){
         $(this).find(".origin").css("display", "none");
         $(this).find(".trunc").css("display", "block");
         $(this).find(".timly").css("display", "block");
     	}
     );
});
</script>
</body>
</html>

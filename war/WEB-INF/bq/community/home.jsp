<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252">
<title>Best Qualified Community</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" href="/styles/main.css">
<link rel="stylesheet" href="/styles/waitMe.css">
<link rel="stylesheet" href="/styles/font-awesome.min.css">
<link rel="stylesheet" href="/styles/comi.css">
<style type="text/css">
.icons i {
	margin-right: 2%;
}

.icons {
	text-align: right;
}

.latest-articles {
	width: 20%;
	float: left;
	margin: 0px;
	padding: 1%;
}

.latest-articles img {
	width: 80%;
	height: auto;
	margin: 0 auto;
	border-bottom: 2px solid gray;
	margin-bottom:4px
}
</style>
</head>

<body>
	<%@ include file="/main-nav.html"%>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row" style="">

			<div class="col-sm-12 no-padding-div"
				style="color: white; background-image: url('/images/community-slide.jpg'); height: 300px; position: relative; width: 100%;">
				<div
					style="background-color: rgba(0, 0, 0, 0.0); width: 400px; height: 220px; padding: 1%; position: absolute; bottom: 20px; left: 150px; font-family: century gothic">
					<h3 id="banner-quote">The single greatest "people skill" is a
						highly developed and authentic interest in the other person</h3>
					<br />
					<h4 id="banner-author">- Bob Burg</h4>
				</div>
			</div>
			<div class="col-sm-12"
				style="font-weight: bold; padding: 4px; background-color: rgba(59, 175, 218, 0.6); color: white">
				<div class="col-sm-6">
					<c:out value='${communityBean.currentDate}' />
				</div>
				<div class="col-sm-6 pull-right icons">
					<i class="fa fa-facebook" aria-hidden="true"></i><i
						class="fa fa-google-plus" aria-hidden="true"></i><i
						class="fa fa-twitter" aria-hidden="true"></i><i
						class="fa fa-linkedin" aria-hidden="true"></i>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row alert alert-warning" style="text-align: center">
			<div class="col-sm-12">
				<c:forEach var="item" items="${communityBean.latestArticles}">
					<div class="latest-articles">
						<a href="#"><img alt="" src="${item.pictureUrl}"
							class="latest-article-img"></a>
						<p>
							<a href="#"><c:out value="${item.title}" /></a>
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 no-padding-div">
				<iframe width="100%" height="360"
					src="https://www.youtube.com/embed/kBHu2H1JQkw" frameborder="0"
					allowfullscreen></iframe>
			</div>
			<div class="col-sm-6" style="text-align: center">
				<h3 class="text-primary" style="font-weight: bold;">Have You Read?</h3>
				<c:forEach var="item" items="${communityBean.readingList}">
					<div class="col-sm-4">
						<div class="col-sm-12 no-padding-div" style="padding: 1%;">
							<img alt="" src="${item.imageUrl}" class="img img-responsive"
								style="margin: 1%; border: 1px solid gray">
						</div>
						<div class="col-sm-12 no-padding-div">
							<h5 class="text-danger" style="font-weight: bold">
								<c:out value="${item.bookTitle}" />
							</h5>
							<p style="font-family: calibri" class="text-muted">
								<c:out value="${item.author}" />
							</p>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
		<div class="row" style="margin-top: 2%;">
			<div class="col-sm-3">
				<div class="row">
					<div class="col-sm-12">
						<div style="border: 1px solid orange; overflow: auto;">
							<div
								style="background-color: orange; color: white; text-align: center; padding: 2%;">
								<h3 style="margin: 0px">Hot Jobs</h3>
							</div>
							<div style="padding: 4px">
							<c:forEach var="item" items="${communityBean.jobs}">
								<div class="col-sm-12 no-padding-div"
									style="border-bottom: 1px #e1e1e1 solid; margin-top: 2%;">
									<div class="col-sm-3 no-padding-div">
										<a href="/bq/open/job?job-key=${item.jobKey}"><img alt=""
											src="${item.pictureUrl}" class="img img-responsive"></a>
									</div>
									<div class="col-sm-9 no-padding-div" style="padding-top: 2%;">

										<a style="font-size: 11pt"
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
				</div>
			</div>
			
			<div class="col-sm-7">
				<c:forEach var="item" items="${communityBean.mainPosts}">
					<div class="media card-panel">
						<a class="pull-left"
							href='<c:url value="bq/network/get-post?id=${item.webkey}" />'><img
							class="media-object" src="${item.pictureUrl}" style="border: 1px solid #eaeaea"
							width="130" height="130"></a>
						<div class="media-body">
							<a href='<c:url value="bq/network/get-post?id=${item.webkey}" />'><h3
									class="media-heading" id="lol">${item.title}</h3></a>
							<p class="text-muted">
								<span><i class="fa fa-user"></i> BEST-QUALIFIED</span> <span><i
									class="fa fa-clock-o"></i> <c:out value='${item.postDate}' /></span>
								<span><i class="fa fa-comments"></i><a> 0</a></span>
							</p>
							<p>
								${item.snippet}<span><a
									href='<c:url value="bq/network/get-post?id=${item.webkey}" />'><i
										class="fa fa-angle-double-right" aria-hidden="true"></i></a></span>
							</p>

							<p id="socialo">
								<span id="fb"> <a href=""><i
										class="fa fa-facebook-square" aria-hidden="true"
										style="color: #3b5998;"></i> Share</a></span> <span id="tw"><a
									href=""><i class="fa fa-twitter-square" aria-hidden="true"
										style="color: #00aced;"></i> Tweet</a></span> <span id="go"><a
									href=""><i class="fa fa-google-plus-square"
										aria-hidden="true" style="color: #F43222;"></i> Share</a></span>

							</p>
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="col-sm-2">
				<div class="row" style="margin-bottom: 10%;">
					<img alt="" src="/images/ads-1.gif" class="img img-responsive">
				</div>
				<div class="row" style="margin-bottom: 10%;">
					<img alt="" src="/images/job-alert.jpg" class="img img-responsive"
						style="border: 2px solid purple">
				</div>
				<div class="row" style="margin-bottom: 10%;">
					<img alt="" src="/images/job-alert.jpg" class="img img-responsive"
						style="border: 2px solid purple">
				</div>
			</div>
			
		</div>


	</div>


	<%@ include file="/WEB-INF/pages/footer.html"%>
	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/waitMe.js"></script>
	<script src="/js/main.js"></script>
	<script type="text/javascript">
		var slideCounter = 1;
		var quotes = [
				"The richest people in the world look for and build networks, everyone else looks for work.",
				"Networking is marketing, marketing yourself, marketing your uniqueness, marketing what you stand for.",
				"Networking is an essential part of building wealth.",
				"If you want to go fast, go alone. If you want to go far, go with others.",
				'The single greatest "people skill" is a highly developed & authentic interest in the other person.' ];
		var author = [ "- Robert. T. Kiyosaki", "- Christine Comaford-Lynch",
				"- Armstrong Williams", "- African proverbs", "- Bob Burg" ];
		$(document).ready(function() {

			startSlider();
		});
		function startSlider() {

			if (slideCounter > 4) {
				slideCounter = 0;
			}
			window.setTimeout(function() {
				$("#banner-quote").fadeOut("slow", "linear", function() {
					$("#banner-quote").text(quotes[slideCounter]);
					$("#banner-author").text(author[slideCounter]);
					slideCounter++;
					$("#banner-quote").fadeIn("slow", "linear", function() {
						startSlider();
					})
				});
			}, 5000);
		}
	</script>
</body>
</html>
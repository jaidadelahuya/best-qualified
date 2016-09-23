<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252">
<title>${item.title}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" href="/styles/main.css">
<link rel="stylesheet" href="/styles/waitMe.css">
<link rel="stylesheet" href="/styles/font-awesome.min.css">
<link rel="stylesheet" href="/styles/comi.css">
</head>
<body style="background-color: #edeff5">
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<script>
		window.twttr = (function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0], t = window.twttr || {};
			if (d.getElementById(id))
				return t;
			js = d.createElement(s);
			js.id = id;
			js.src = "https://platform.twitter.com/widgets.js";
			fjs.parentNode.insertBefore(js, fjs);

			t._e = [];
			t.ready = function(f) {
				t._e.push(f);
			};

			return t;
		}(document, "script", "twitter-wjs"));
	</script>
	<%@ include file="/main-nav.html"%>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class=""></div>
			<div class="col-sm-offset-2 col-sm-8">
				<div class="card-panel" style="margin-bottom: 2%; width: 100%">
					<h3 class="text-primary" style="text-align: center" id="lol">${currentArticle.title}</h3>
					<div>
						<img class="media-object img-rounded"
							src="${currentArticle.pictureUrl}"
							style="width: 100%; margin: 0 auto">
					</div>

					<div>

						<p
							style="color: #983b59; font-family: calibri; letter-spacing: 3px; text-align: center; margin: 2%;">
							<span style="margin-left: 5px;"><i class="fa fa-user"></i>
								BEST-QUALIFIED</span> <span><i class="fa fa-clock-o"></i> <c:out
									value='${currentArticle.postDate}' /></span> <span><i
								class="fa fa-comments"></i><a> 0</a></span>
						</p>
						<p>
							${currentArticle.body}<span><a
								href='<c:url value="/community?id=${currentArticle.webkey}" />'></a></span>
						</p>

						<div class="row">
							<div class="col-md-12" style="text-align: center; padding: 2%;">
								<div class="fb-share-button"
									style="line-height: 0.7; vertical-align: baseline; display: inline-block;"
									data-href="/bq/open/job?job-key=${jobInformation.webKey}"
									data-layout="button"></div>

								<script src="//platform.linkedin.com/in.js"
									type="text/javascript">
									lang: en_US
								</script>
								<script type="IN/Share"
									data-url="http://localhost:8888/bq/open/job?job-key=${jobInformation.webKey}"></script>
								<div class="g-plus" data-action="share" data-annotation="none"
									data-href="http://localhost:8888/bq/open/job?job-key=${jobInformation.webKey}"></div>
								<a class="twitter-share-button"
									href="https://twitter.com/intent/tweet"></a>
								<div style="display: inline-block;">
									<a
										href="mailto:?Subject=Job recommendation from Best Qualified&amp;Body=Hello, Here%20is%20a%20job%20you%20may%20like%20${jobInformation.pageUrl}">
										<img src="/images/email-big.png"
										style="vertical-align: baseline;" alt="Email" />
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>

	</div>


	<script src="/js/jquery-1.11.2.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/waitMe.js"></script>
	<script src="/js/main.js"></script>

	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
</body>
</html>
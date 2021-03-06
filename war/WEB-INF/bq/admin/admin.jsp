<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Best Qualified Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/styles/bootstrap.min.css">
<link rel="stylesheet" href="/styles/admin.css">
<link rel="stylesheet" href="/styles/main.css">
<link rel="stylesheet" href="/styles/jquery-ui.min.css">
<link rel="stylesheet" href="/styles/multiple-select.css">
</head>
<body style="background-color: #013143; color: white;">
<br><br><br><br><br><br><br><br><br><br>
 <div class="row">
    <div class="container">
      <div class="col-md-6">
      <div class="">
        <h3 style="color:#875F9A; text-transform:uppercase;">Best Qualified Admin</h3>
      </div>
      	<form role="form">
  <div class="form-group">
  	<div id="msg-div"></div>
    <label for="email">Email address:</label>
    <input type="email" class="form-control" id="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd">
  </div>
  <div class="checkbox">
    <label><input type="checkbox"> Remember me</label>
  </div>
  <button id="submit-btn" type="button" class="btn btn-primary">Submit</button>
</form>
      </div>
    </div>
  </div>
  <script src="/js/jquery-1.11.2.min.js"></script>
  <script src="/js/main.js"></script>
  <script src="/js/admin.js"></script>
 <script type="text/javascript">
 	$("#submit-btn").click(function() {
 		var x = $("#email").val();
 		var y = $("#pwd").val();
 		login(x,y);
 	});
 </script>
</body>
</html>
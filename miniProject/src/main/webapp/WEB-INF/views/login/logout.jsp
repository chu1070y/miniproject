<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">

  <title>Login Page 2 | Creative - Bootstrap 3 Responsive Admin Template</title>

  <!-- Bootstrap CSS -->
  <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="/resources/css/bootstrap-theme.css" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="/resources/css/elegant-icons-style.css" rel="stylesheet" />
  <link href="/resources/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles -->
  <link href="/resources/css/style.css" rel="stylesheet">
  <link href="/resources/css/style-responsive.css" rel="stylesheet" />

<body class="login-img3-body">

  <div class="container">

    <form class="login-form" action="index.html">
      <div class="login-wrap">
        <p class="login-img"><i class="icon_lock_alt"></i></p>

        <button class="btn btn-primary btn-lg btn-block" id="logoutBtn" type="submit">로그아웃</button>

      </div>
    </form>
  </div>

		<form class="actionform">
			<input type="hidden" id="csrfToken" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>

<script>

$(document).ready(function(){
	
	var actionform = $(".actionform");
	
	
	$("#logoutBtn").on("click",function(e){
		e.preventDefault();
		
		var str = "";

		str += "<input type='hidden' id='csrfToken' name='${_csrf.parameterName}' value='${_csrf.token}' />";
		
		actionform.append(str)
		.attr("action","/login/logout").attr("method","post").submit();
	});
	
	
	
});

</script>

</body>

</html>




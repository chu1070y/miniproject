<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <script src="/resources/js/jquery.js"></script>
  <script src="/resources/js/jquery-ui-1.10.4.min.js"></script>
  
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

    <form class="login-form" action="/login/signup" method="post">
    <input type="hidden" id="csrfToken" name="${_csrf.parameterName}" value="${_csrf.token}" />
    
      <div class="login-wrap">
        <p class="login-img"><i class="icon_lock_alt"></i> 회원가입</p>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_profile"></i></span>
          <input id="inputId" name="id" type="text" class="form-control" placeholder="ID" autofocus>
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="icon_key_alt"></i></span>
          <input id="inputPw" name="pw" type="password" class="form-control" placeholder="Password">
        </div>

        <button class="btn btn-info btn-lg btn-block" id="signupBtn" type="submit">가입하기</button>
        </form>
      </div>
      

</body>

<script>

$(document).ready(function(){
	
    var result = '<c:out value="${result}"/>';
    
    checkModal(result);
    history.replaceState({}, null, null);
    
    function checkModal(result){
    
   	console.log(result === ''||history.state);
   	
   	if(result === ''||history.state){
   		 return;
   	}
   	
   	if (result === 'blank') {
        alert("아이디나 패스워드를 입력해주세요.");
    }
   	 
   	if (result === 'fail') {
        alert("해당 아이디는 존재합니다.");
    }
   	
    }
	
});

</script>

</html>




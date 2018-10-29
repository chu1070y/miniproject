<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> 자유게시판
				</h3>
				<ol class="breadcrumb">
					<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
					<li><i class="fa fa-laptop"></i>Dashboard</li>
				</ol>
			</div>
		</div>



		<div class="row">

			<div class="col-lg-12 col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-flag-o red"></i><strong>자유게시판 목록</strong>
						</h2>
						<div class="panel-actions">
							<a href="index.html#" class="btn-setting"><i
								class="fa fa-rotate-right"></i></a> <a href="index.html#"
								class="btn-minimize"><i class="fa fa-chevron-up"></i></a> <a
								href="index.html#" class="btn-close"><i class="fa fa-times"></i></a>
						</div>
					</div>

					<div class="panel-body">
						<table class="table bootstrap-datatable countries">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록날짜</th>
									<th>조회수</th>
									<th>좋아요/싫어요</th>
								</tr>
							</thead>

							<tbody>

								<c:forEach var="board" items="${list}">
									<tr>
										<td>${board.bno}</td>
										<td><a href='${board.bno}' class="board" >${board.title}</a></td>
										<td>${board.writer}</td>
										<td><fmt:formatDate type="both" dateStyle="medium"
												timeStyle="medium" value="${board.regdate}" /></td>
										<td>${board.view}</td>
										<td>${board.good}/${board.bad}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>

				</div>

			</div>
		</div>


		<form action="/mini/register" method="get">
			<input type="submit" class="btn btn-success btn-lg btn-block"
				value="글쓰기" />
		</form>
		<br />

		<div class="col-md-6">
		
			<button class="btn btn-success" type="button">previous</button>
			
			
			<button class="btn btn-success" type="button">5</button>
			<button class="btn btn-success" type="button">6</button>
			<button class="btn btn-success" type="button">7</button>
			
			<button class="btn btn-success" type="button">next</button>

		</div>
		
		<form class="actionform">
			
		</form>


		<!-- statics end -->


	</section>
	<div class="text-right">
		<div class="credits">
			<!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
          -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</div>
</section>
<!--main content end-->

<!-- container section start -->
<%@include file="../includes/footer.jsp"%>

<script
			  src="https://code.jquery.com/jquery-3.3.1.min.js"
			  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			  crossorigin="anonymous"></script>
			  
<script>

	$(document).ready(function(){
		var actionform = $(".actionform");
		
		
		//게시판 제목 클릭
		$(".board").on("click",function(e){
			e.preventDefault();
			
			var bno = $(this).attr("href");
			
			actionform.append("<input type='hidden' id='bno' name='bno' value='"+ bno +"'>");
			
			actionform.attr("action","/mini/read").attr("method","get").submit();
		});
		
	});

</script>


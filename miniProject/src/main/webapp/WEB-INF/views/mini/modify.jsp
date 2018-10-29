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
					<i class="fa fa-laptop"></i> 읽기
				</h3>
			</div>
		</div>

		<div class="row">

			<div class="col-md-12 portlets">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="pull-left">당신이 선택한 글은?</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-body">
						<div class="padd">

							<div class="form quick-post">
								<!-- Edit profile form (not working)-->
								
								<form class="form-horizontal" action="/mini/modify" method="post">
									<!-- Title -->
									<div class="form-group">
										<label class="control-label col-lg-2" for="title">Title</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" name="title" value="${read.title}">
										</div>
									</div>

									<!-- Writer -->
									<div class="form-group">
										<label class="control-label col-lg-2" for="title">Writer</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" name="writer"  value="${read.writer}">
										</div>
									</div>

									<!-- Content -->
									<div class="form-group">
										<label class="control-label col-lg-2" for="content">Content</label>
										<div class="col-lg-10">
											<textarea class="form-control" name="content">${read.content}</textarea>
										</div>
									</div>


									<!-- Buttons -->
									<div class="form-group">
									
										<!-- Buttons -->
										<div class="col-lg-offset-2 col-lg-9">
											
											<input type="hidden" name="bno" value="${read.bno}">
											
											<button type="submit" class="btn btn-primary">수정하기</button>
											</form>
											
											<form action="/mini/delete" method="post">
											<input type="hidden" name="bno" value="${read.bno}">
											<button type="submit" class="btn btn-danger">삭제하기</button>
											</form>
											
											<form action="/mini/list">
											<button type="submit" class="btn btn-default">목록으로</button>
											</form>
										</div>
									</div>
							</div>


						</div>
						<div class="widget-foot">
							<!-- Footer goes here -->
						</div>
					</div>
				</div>

			</div>
		</div>







		<!--main content end-->
	</section>
	<!-- container section start -->
	<%@include file="../includes/footer.jsp"%>
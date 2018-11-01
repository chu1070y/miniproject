<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<style>

	.uploadResult{
		width: 80%;
		background-color: gray;
	}
	
	.uploadResult ul{
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
		color: white;
	}
	
	.uploadResult ul li{
		list-style: none;
		padding: 20px;
		align-centent: center;
		text-align: center;
	}
	
	.uploadResult ul li img{
	display:inline;
	height: 100px;
	}
	
	.uploadResult ul li span{
	color: white;
	}
	
	.bigPictureWrapper{
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255,255,255,0.5);
	}
	
	.bigPicture{
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	}
	
	.bigPicture img{
	width:600px;
	}

</style>

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
								<form class="form-horizontal" action="/mini/modify" method="get">
									<!-- Title -->
									<div class="form-group">
										<label class="control-label col-lg-2" for="title">Title</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" readonly="readonly" value="${read.title}">
										</div>
									</div>

									<!-- Writer -->
									<div class="form-group">
										<label class="control-label col-lg-2" for="title">Writer</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" readonly="readonly" value="${read.id}">
										</div>
									</div>

									<!-- Content -->
									<div class="form-group">
										<label class="control-label col-lg-2" for="content">Content</label>
										<div class="col-lg-10">
											<textarea class="form-control" readonly="readonly"><c:out value="${read.content}"/></textarea>
										</div>
									</div>


									<!-- Buttons -->
									<div class="form-group">
									
										<!-- Buttons -->
										<div class="col-lg-offset-2 col-lg-9">
											
											<input type="hidden" id="bno" name="bno" value="${read.bno}">
											<input type="hidden" id="page" name="page" value="${page.page}">
											<input type="hidden" id="display" name="display" value="${page.display}">
											<input type="hidden" id="keyword" name="keyword" value="${page.keyword}">
											<input type="hidden" id="type" name="type" value="${page.type}">
											
											<button type="submit" class="btn btn-primary">수정하기</button>
											</form>
											
											<form action="/mini/list">
											
											<input type="hidden" id="page" name="page" value="${page.page}">
											<input type="hidden" id="display" name="display" value="${page.display}">
											<input type="hidden" id="keyword" name="keyword" value="${page.keyword}">
											<input type="hidden" id="type" name="type" value="${page.type}">
											
											<button type="submit" class="btn btn-default golist">목록으로</button>
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

		
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">첨부파일</div>
						
						<div class="panel-body">
							<div class='uploadResult'>
								<ul>
				
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

<div class='bigPictureWrapper'>
	<div class="bigPicture">
	</div>
</div>

		<form class="actionform">
			<input type="hidden" id="page" name="page" value="${page.page}">
			<input type="hidden" id="display" name="display" value="${page.display}">
		</form>




		<!--main content end-->
	</section>
	<!-- container section start -->
	<%@include file="../includes/footer.jsp"%>
	
	<script>
	
	$(document).ready(function(){
		
		$(".bigPictureWrapper").on("click",function(e){
			$(".bigPicture").animate({width:'0%',height:'0%'},1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			},1000);
		});
		
		$(".uploadResult").on("click","li",function(e){
			
			console.log("view image");
			
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
			
			if(!liObj.data("type")){
				
			}else{
				//download
				self.location = "/upload/download?fileName="+path;
			}
		});
		
		function showImage(fileCallPath){
			
			$(".bigPictureWrapper").css("display","flex").show();
			
			$(".bigPicture")
			.html("<img src='/upload/display?fileName="+fileCallPath+"'>")
			.animate({width:'100%',height:'100%'},1000);
		}
		
		//첨부파일 보여주기
		(function(){
			
			var bno = '<c:out value="${read.bno}"/>';
			
			$.getJSON("/mini/getAttachList",{bno:bno},function(arr){
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i,attach){
					
					//image type
					if(attach.fileType){
						var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
						str += "<div>";
						str += "<span>" + attach.fileName + "<span>";
						str += "<img src='/upload/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str += "</li>";
					}else{
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
						str += "<div>";
						str += "<span>"+attach.fileName+"</span><br/>";
						str += "<img src='/resources/img2/aaa.png'>";
						str += "</div>";
						str += "</li>";
					}
				});
				
				$(".uploadResult ul").html(str);
				
				
			});// end getjson
			
		})();//end function
		
	});
	
	</script>
	
	
	
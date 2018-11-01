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
	
	#submission {
 	 text-align: center;
 	}


</style>


<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<!--overview start-->
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">
					<i class="fa fa-laptop"></i> 글쓰기
				</h3>
			</div>
		</div>
		<span class="form-control">주의! 내용이 비어있으면 등록이 되지 않습니다.</span>
		<br/>
		<div class="row">

			<div class="col-md-12 portlets">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="pull-left">Quick Post</div>
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
								<form class='regform'>
									<!-- Title -->
									<div class="form-group">
										<label class="control-label col-lg-2" for="title">Title</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="title" name="title">
										</div>
									</div>

									<!-- Writer -->
									<div class="form-group">
										<label class="control-label col-lg-2" for="title">Writer</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="id" name="id" value="salem" readonly="readonly">
										</div>
									</div>

									<!-- Content -->
									<div class="form-group">
										<label class="control-label col-lg-2" for="content">Content</label>
										<div class="col-lg-10">
											<textarea class="form-control" id="content" name="content"></textarea>
										</div>
									</div>
									</form>
			

			<br/>

			<div class='row'>
			<form action="/mini/list">
    		<!-- Buttons -->
    		<p id="submission">
			<button type="submit" class="btn btn-primary register">등록하기</button>					
			
			<button type="submit" class="btn btn-default">목록으로</button>
			</p>
			</form>

			</div>
									
										</div>
									</div>
							</div>
						</div>
					
						<div class="widget-foot">
							<!-- Footer goes here -->
						</div>
					</div>
				</div>
				
			
		
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">첨부파일</div>
						
						<div class="panel-body">
							<div class="uploadDiv col-lg-2">
								<input type='file' name='uploadfile' multiple>
							</div>
							<br/><br/>
							<div class='uploadResult col-lg-12'>
								<ul>
				
								</ul>
							</div>
			
							<button id='uploadBtn'>Upload</button>

						</div>
					</div>
				</div>
			</div>
			
			



<div class='bigPictureWrapper'>
	<div class="bigPicture">
	</div>
</div>






		<!--main content end-->
	</section>
	<!-- container section start -->
	<%@include file="../includes/footer.jsp"%>
	

	
<script>

function showImage(fileCallPath){
	//alert(fileCallPath);
	
	$(".bigPictureWrapper").css("display","flex").show();
	$(".bigPicture")
	.html("<img src='/upload/display?fileName="+ fileCallPath+"'>")
	.animate({width:'100%',height:'100%'},1000);
}

$(document).ready(function(){
	
	//이미지 삭제
	$(".uploadResult").on("click","button",function(e){
		e.preventDefault();
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");

		$.ajax({
			url: '/upload/deleteFile',
			data: {fileName: targetFile, type:type},
			dataType:'text',
			type:'POST',
			success: function(result){
				targetLi.remove();
			}
		});
	});
	
	//이미지 보여주기
			$(".uploadResult").on("click","img",function(e){
			e.preventDefault();
			
			console.log("view image");
			
			var liObj = $(this).closest("li");
			
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
			
			if(liObj.data("type")){
				showImage(path.replace(new RegExp(/\\/g),"/"));
			}else{
			
			}
		});
	
	
	//이미지 사리지는 이벤트
	$(".bigPictureWrapper").on("click",function(e){
		$(".bigPicture").animate({width:'0%', height:'0%'},1000);
		setTimeout(function(){
			$('.bigPictureWrapper').hide();
		},1000);
	});	
	
	//register
	var regform = $(".regform");
	$(".register").on("click",function(e){
		e.preventDefault();
        
      	 var title = $("#title").val();
      	 var id =  $("#id").val();
         var content =  $("#content").val();
      	 
		console.log("등록버튼 클릭");
		
      	 if(title == ""){
      		console.log("-------------1");
       		 alert("제목을 입력해주세요.");
       		 return;
       	 }
      	 
      	 if(content == ""){
      		console.log("-------------2");
       		 alert("내용을 입력해주세요.");
      		 return;
       	 }
      	 
      	 if(id == ""){
      		 console.log("-------------3");
       		 alert("작성자를 입력해주세요.");
      		 return;
       	 }
		
		
		var str = "";
		
		$(".uploadResult ul li").each(function(i,obj){
			var jobj = $(obj);
			console.dir(jobj);
			
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			
		});

 		regform.append(str).attr("action","/mini/register").attr("method","post").submit();
	});
	
	//첨부파일 이미지 보여주기 & 다운로드 처리
	var uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr){
		
		var str ="";
		
		$(uploadResultArr).each(function(i,obj){
			
			if(obj.image){
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li class='li' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
				str += "<div>";
				str += "<span>" + obj.fileName + "</span>";
				str += "<button type='button' data-type='"+obj.image+"' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/upload/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str += "</il>";
				
				
			}else{
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				
				var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
				str += "<div>";
				str += "<span>" + obj.fileName + "</span>";
				str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img2/aaa.png'></a>";
				str += "</div>";
				str += "</il>";
			}
		});
		
		uploadResult.append(str);
	}
	
	
	//첨부파일 확장자나 크기 사전 처리
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)");
	var maxSize = 5242880; //5메가바이트
	
	function checkExtension(fileName, fileSize){

		if(fileSize >= maxSize){

			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){

			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	var cloneObj = $(".uploadDiv").clone();
	
	//Upload 버튼
	$("#uploadBtn").on("click",function(e){
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadfile']");
		var files = inputFile[0].files;
		
		console.log(files);
		
		//form태그에 파일 추가하기
		for(var i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadfile",files[i]);	
		}
		
		
		$.ajax({
			url: '/upload/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success : function(result){
				console.log(result);
				
				showUploadedFile(result);
				
				$(".uploadDiv").html(cloneObj.html());
				
			}
		});// end ajax
		
		
	});// end Upload 버튼
	
});


</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<style>

	.uploadResult{
		width: 100%;
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
	
	.chat li{
	border-bottom:1px solid gray;
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

											<button id="goModify" type="submit" class="btn btn-primary">수정하기</button>
											<button id="goList" type="submit" class="btn btn-default golist">목록으로</button>

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

	</div>
		<span class="form-control">파일명을 클릭하면 다운로드가 가능합니다^^</span>
		<br/>
		
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
			
		
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i>댓글
							<button id="addReplyBtn" class="btn btn-primary pull-right">New 댓글</button>
						</div>
						
						<div class="panel-body">
							
							<ul class="chat">
								<li class="left clearfix" data-rno='3'>
									<div>
										<div class="header">
											<strong class="primary-font">user00</strong>
											<small class="pull-right text-muted">18.11.02 00:54</small>
										</div>
										<p>댓글시작</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class="panel-footer">
				
			</div>
			
   
   			
 <!-- 댓글 Modal -->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="myModalLabel">댓글 작성</h4>
            </div>
            <div class="modal-body"></div>
            
            <div class="form-group">
            	<label>내용</label>
            	<input class="form-control" name="reply" value="New 댓글!!!">
            </div>
            <div class="form-group">
            	<label>작성자</label>
            	<input class="form-control" name="id" value="New 댓글!!!">
            </div>
            <div class="form-group">
            	<label>작성 날짜</label>
            	<input class="form-control" name="regDate" value="New 댓글!!!">
            </div>
            
            
            <div class="modal-footer">
        	   <button id="modalModBtn" type="button" class="btn btn-warning" data-dismiss="modal">수정하기</button>
               <button id="modalRemoveBtn" type="button" class="btn btn-danger" data-dismiss="modal">삭제하기</button>
               <button id="modalRegisterBtn" type="button" class="btn btn-primary" data-dismiss="modal">등록하기</button>
               <button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">창 닫기</button>
            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->
			
			

<div class='bigPictureWrapper'>
	<div class="bigPicture">
	</div>
</div>

  <!-- 성공여부 Modal -->
   <div class="modal fade" id="smyModal" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body smodal"></div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->



		<form class="actionform">
			<input type="hidden" id="bno" name="bno" value="${read.bno}">
			<input type="hidden" id="page" name="page" value="${page.page}">
			<input type="hidden" id="display" name="display" value="${page.display}">
			<input type="hidden" id="keyword" name="keyword" value="${page.keyword}">
			<input type="hidden" id="type" name="type" value="${page.type}">
		</form>




		<!--main content end-->
	</section>
	<!-- container section start -->
	<%@include file="../includes/footer.jsp"%>
	
	<script type="text/javascript" src="/resources/js2/reply.js"></script>
	

	
	<script>
	
	$(document).ready(function(){
		
		//댓글 페이징
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(dto){
			
			var str = "<ul class='pagination pull-right'>";
			
			if(dto.prev){
				str += "<li class='page-item'><a class='page-link' href='" + (dto.start-1) + "'>Prev</a></li>";
			}
			
			console.log("---------------dto");
			console.log(dto);
			console.log("---------------dto");
			
		}//end showReplyPage
		
		//댓글목록 가져오기
		var bnoValue = '<c:out value="${read.bno}"/>';
		var replyUL = $(".chat");
		
		showList(1);
		
		function showList(page){
			
			console.log("show list" + page);
			
			replyService.getList({bno:bnoValue,page: page|| 1 }, function(list){
				
				console.log("------------------?");
				console.log(${dto});
				console.log("------------------?");
				
				if(page == -1){
					showList(1);
					return;
				}
				
				var str = "";
				if(list == null || list.length ==0){
					replyUL.html("");
					
					return;
				}//end if
				
				for(var i = 0, len = list.length || 0 ; i < len ; i++){
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "<div><div ><strong class='primary-font'>["+list[i].rno+"]"+list[i].id+"</strong>";
					str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].regDate)+"</small></div>";
					str += "<p>"+list[i].reply+"</p></div></li>";
				}//end for
				
				replyUL.html(str);
				
				//showReplyPage(dto);
				
			});//end getList
		}//end showList
		
		//댓글 모달창
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='id']");
		var modalInputReplyDate = modal.find("input[name='regDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		$("#addReplyBtn").on("click",function(e){
			
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id !='modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		//댓글 등록 및 목록 갱신
		modalRegisterBtn.on("click",function(e){
			
			var reply = {
					reply: modalInputReply.val(),
					id: modalInputReplyer.val(),
					bno: bnoValue
			};
			replyService.add(reply,function(result){
				
				alert(result);
				
				modal.find("input").val("");
				modal.modal("hide");
				
				showList(1);
			});
		});//end modalRegisterBtn
		
		
		//댓글 클릭 이벤트
		$(".chat").on("click","li",function(e){
			var rno = $(this).data("rno");
			
			replyService.get(rno,function(reply){
				
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.id).attr("readonly","readonly");
				modalInputReplyDate.val(replyService.displayTime(reply.regDate)).attr("readonly","readonly");
				modal.data("rno",reply.rno);
				
				modal.find("button[id !='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
			});
		});
		
		//댓글 수정
		modalModBtn.on("click",function(e){
			
			var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
			
			replyService.update(reply,function(result){
				alert(result);
				modal.modal("hide");
				showList(1);
			});
			
		});//end modalModBtn
		
		//댓글 삭제
		modalRemoveBtn.on("click",function(e){
			
			var rno = modal.data("rno");
			
			replyService.remove(rno, function(result){
				alert(result);
				modal.modal("hide");
				showList(1);
			});
		});//end modalRemoveBtn
		
		//원본이미지 숨기기
		$(".bigPictureWrapper").on("click",function(e){
			$(".bigPicture").animate({width:'0%',height:'0%'},1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			},1000);
		});
		
		//다운로드
		$(".uploadResult").on("click","span",function(e){
			e.preventDefault();
			console.log("view image");
			
			var liObj = $(this).closest("li");
			
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));

			self.location = "/upload/download?fileName="+path;
			
		});
		
		//보여주기
		$(".uploadResult").on("click","img",function(e){
			e.preventDefault();
			console.log("click");
			
			var liObj = $(this).closest("li");
			
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
			
			if(liObj.data("type")){
				
				showImage(path.replace(new RegExp(/\\/g),"/"));
				
			}else{
				
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
						str += "<span>" + attach.fileName + "</span><br/>";
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
		
		
		var actionform = $(".actionform");
		//이동 버튼
		$("#goModify").on("click",function(e){
			
			actionform.attr("action","/mini/modify").attr("method","get").submit();
		});
		$("#goList").on("click",function(e){
			
			actionform.attr("action","/mini/list").attr("method","get").submit();
		});
		
		//수정여부 Modal창
        var msg = $("#smyModal");
        var result = '<c:out value="${result}"/>';

        checkModal(result);
        history.replaceState({}, null, null);
        
        function checkModal(result){
        	
       	console.log(result === ''||history.state);
       	
       	if(result === ''||history.state){
       		 return;
       	}
       	 
       	if (result === 'success') {
            $(".smodal").html("요청하신 작업이 수행되었습니다.");
            msg.modal();
        }
       	
        }
		

		
	});
	
	
	
	
	</script>
	
	
	
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
					<li><i class="fa fa-home"></i><a href="list">Home</a></li>
					<li><i class="fa fa-laptop"></i>Dashboard</li>
					<li>

                    
                    </li>
				</ol>
			</div>
		</div>
					<div class="btn-group">
					
                      <button data-toggle="dropdown" class="btn btn-success" type="button"> *개씩 보기 <span class="caret"></span> </button>
                      <ul class="dropdown-menu">
                        <li value=10><a href="#">10</a></li>
                        <li value=20><a href="#">20</a></li>
                        <li value=50><a href="#">50</a></li>
                        <li value=100><a href="#">100</a></li>
                      </ul>
                      
                	</div>


		<div class="row">

			<div class="col-lg-12 col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h2>
							<i class="fa fa-flag-o red"></i><strong>자유게시판 목록</strong>
						</h2>
						<div class="panel-actions">
							<a href="list" class="btn-setting"><i
								class="fa fa-rotate-right"></i></a> <a href="list"
								class="btn-minimize"><i class="fa fa-chevron-up"></i></a> <a
								href="list" class="btn-close"><i class="fa fa-times"></i></a>
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
										<td>${board.id}</td>
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
		
<div class="row">
          <div class="col-lg-2">
            <section class="panel">
              	<select class="form-control col-lg-2 select">
                   <option value="">- Choose Cateogry -</option>
                   <option value="t" ${page.type == 't' ? "selected":""}>제목</option>
                   <option value="w" ${page.type == 'w' ? "selected":""}>작성자</option>
                   <option value="c" ${page.type == 'c' ? "selected":""}>내용</option>
                   <option value="tc" ${page.type == 'tc' ? "selected":""}>제목+내용</option>
                   <option value="twc" ${page.type == 'twc' ? "selected":""}>제목+작성자+내용</option>
                </select>
            </section>
          </div>
          
          <div class="col-lg-6">
            <section class="panel">
              <input class="form-control" id="sKeyword" placeholder="검색할 내용을 입력해주세요." type="text" value="${page.keyword}">
            </section>
          </div>
          
          <div class="col-lg-2">
              <a class="btn btn-success" id="sBtn" href="#"><span class="icon_lightbulb_alt"></span>검색</a>
          </div>
        </div>


		<div class="col-lg-12" id="paging">
		
			<c:if test="${page.prev}">
			<button class="btn btn-success" id="prev" type="button">previous</button>
			</c:if>
			
			<c:forEach var="pageNum"  begin="${page.start}" end="${page.end}" step="1">
			<button class="btn btn-success letitgo" value="${pageNum}" type="button">${pageNum}</button>
			</c:forEach>
			
			<c:if test="${page.next}">
			<button class="btn btn-success" id="next" type="button">next</button>
			</c:if>

		</div>
		
		<form class="actionform">
			<input type="hidden" id="page" name="page" value="${page.page}">
			<input type="hidden" id="display" name="display" value="${page.display}">
			<input type="hidden" id="keyword" name="keyword" value="${page.keyword}">
			<input type="hidden" id="type" name="type" value="${page.type}">
		</form>

  <!-- Modal -->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-hidden="true">&times;</button>
               <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>
   <!-- /.modal -->
</div>


<!-- container section start -->
<%@include file="../includes/footer.jsp"%>
			  
<script>

	$(document).ready(function(){
		var actionform = $(".actionform");
		
        //search
        $('#sBtn').on("click",function(e){
         e.preventDefault();
         
       	 var keyword = $("#sKeyword").val();
       	 var type =  $(".select").val();
       	 
       	 if(type == ""){
       		 alert("카테고리를 입력해주세요.");
       		 return;
       	 }else if(keyword=""){
       		 alert("검색할 내용을 입력해주세요.");
      		 return;
       	 }
       	 
       	 $("#keyword").val(keyword);
       	 $("#type").val(type);
       	 $("#page").val(1);
       	 
         actionform
           .attr("action", "/mini/list")
           .attr("method", "get")
           .submit();
       	 
        });
		
		//현재 페이지 표시
		$(".letitgo[value="+ ${page.page} +"]").attr("class","btn btn-danger letitgo");
		
		//게시판 제목 클릭
		$(".board").on("click",function(e){
			e.preventDefault();
			
			var bno = $(this).attr("href");
			
			actionform.append("<input type='hidden' id='bno' name='bno' value='"+ bno +"'>");
			
			actionform.attr("action","/mini/read").attr("method","get").submit();
		});
		
		//페이지 prev 클릭
		$("#prev").on("click",function(e){
			$("#page").attr("value","${page.start-1}");
			actionform.attr("action","/mini/list").attr("method","get").submit();
		});
		
		//페이지 next 클릭
		$("#next").on("click",function(e){
			$("#page").attr("value","${page.end + 1}");
			actionform.attr("action","/mini/list").attr("method","get").submit();
		});
		
		//페이지 번호 클릭
		$(".letitgo").on("click",function(e){
			$("#page").attr("value",$(this).val());
			actionform.attr("action","/mini/list").attr("method","get").submit();
		});
		
		//display
		$(".dropdown-menu li").on("click",function(e){
			e.preventDefault();
			$("#display").attr("value",$(this).val());
			$("#page").attr("value",1);
			actionform.attr("action","/mini/list").attr("method","get").submit();
		});
		
		//Modal창
        var msg = $("#myModal");
        var result = '<c:out value="${result}"/>';

        checkModal(result);
        history.replaceState({}, null, null);
        
        function checkModal(result){
        	
       	console.log(result === ''||history.state);
       	
       	if(result === ''||history.state){
       		 return;
       	}
       	 
       	if (result === 'success') {
            $(".modal-body").html("요청하신 작업이 수행되었습니다.");
            msg.modal();
        }
       	
     }
		
	});

</script>



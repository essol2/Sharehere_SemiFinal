<%@page import="java.util.ArrayList"%>
<%@page import="roommate.model.vo.CommentReply"%>
<%@page import="roommate.model.vo.RoommateReport"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="roommate.model.vo.RoommateComment, member.model.vo.User, administrator.model.vo.ADM_Admin" %>
<% 
	RoommateComment c = (RoommateComment)request.getAttribute("comments");
	User user = (User) request.getSession().getAttribute("loginUser");
	ArrayList<CommentReply> crList = (ArrayList<CommentReply>) request.getAttribute("crList");
	Admin admin = (Admin)request.getSession().getAttribute("loginAdmin");
	
	System.out.println("crList : " + crList);
	System.out.println("loginAdmin : " + admin);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

 <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<style>
	
	body {
		text-align: center;
	}
	#title {
	text-align: center;
	 margin: 20px 0;
 	 padding: 10px;
	}
	
/* 바깥 영역 */
	.outer{
		width:60%;
		min-width : 650px;
		margin:auto;
		margin-top : 70px;
		margin-bottom : 70px;
	}
	
	/* 공지사항 목록 영역 */
	.tableArea{
		padding : 20px;
		width:750px;
		margin:0 auto;
	}
	
	/* span 태그 */
	.input_area {
	    border: solid 1px #dadada;
	    padding : 10px 10px 14px 10px;
	    background : white;
	}
	
	/* input 태그 */
	.input_area input {
		width : 550px;
		height : 30px;
		border: 0px;
	}
	
	/* textarea */ 
	textarea {
		width : 550px;
		height : 300px;
		padding : 10px 10px 14px 10px;
		border: solid 1px #dadada;
	}
	/* 버튼 영역 */
	.btnArea {
		text-align:center;
	}
	
	/* 댓글 영역 */
	.replyArea {
		text-align:center;
		padding : 50px;
	}
	
	#replySelectTable {
		width : 100%;
	}
	
	#replySelectTable td:nth-child(3), #replySelectTable2 td:nth-child(3) {
		width : 90px;
	}
	
	#replySelectTable td:nth-child(1), #replySelectTable2 td:nth-child(1) {
	text-align: left;
	}

</style>

<!-- navi css 경로 -->
<link
	href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">
	
<!-- jQuery라이브러리 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>

	<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/navi.jsp"%>

	<h2 id = "title"> 쉐어메이트들의 솔직하고 사실적인 후기를 인터뷰를 통해 확인하세요! </h2>

	<div class = "outer">
		<div class = "tableArea">
				
				<h1><%= c.getnTitle() %></h1>
				<div>
					<h4 style = "text-align: left; font-size : 15px; margin-left: 7%; color : green;"><%= c.getnDate() %> 
					<span style="margin-left: 53%; color: pink;">작성자 : <%=c.getnWriter()%></span></h4>					
				</div>	
				<br>
				
				<div class="col"><img src="${pageContext.request.contextPath}/resources/roommate/img/comment_photo.PNG" style="width: 700px; height: 700px;"></div>
			<br>
			<%=c.getnContent()%>

			<div class="col">
			<br>
			
			<img src="${pageContext.request.contextPath}/resources/roommate/img/rm_main2.PNG"></div>

			<!-- AJAX 수업 후 완성할 댓글 -->
				<div class="replyArea">
				
					<div class="replyWriterArea">
						<h4 class="reply_title">댓글작성</h4> <br>
						<div style="display: flex;">
							<div class="form-floating" style="width:83%;">
							  <textarea class="form-control" placeholder="Leave a comment here" id="replyContent" style="resize: none;"></textarea>
							  <label for="replyContent">Comments</label>
							</div>
							<br>
							<button id="addReply" class="btn btn-outline-secondary" style="margin-left: 2%;">댓글등록</button>						
						</div>
					</div>
				
						  <br><br><br><br>
						  
						  <table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col" style="text-align: left; width: 32%;">작성자</th>
						      <th scope="col">내용</th>
						      <th scope="col" style="text-align: right;">작성일</th>
						    </tr>
						  </thead>
						</table>
				
					<div class="replySelectArea">
						<table id="replySelectTable">
						
						<% if(crList != null && !crList.isEmpty()) { %>
						
							<% for(CommentReply cr : crList) { %>
							
							<tr>
								<td><%= cr.getUser_no() %></td>
								<td><%= cr.getContent() %></td>
								<td><%= cr.getCreate_date() %></td>
							</tr>
							<% } %>
						<% } else { %>
						<tr>
							<td colspan="3">작성 된 댓글이 없습니다.</td>
						</tr>
						<% } %>
						</table>
					</div>
				</div>
			</div>

			<div class = "btnArea">
				<button type = "button" id = "BacktoBtn" class="btn btn-outline-secondary">목록으로</button>
				 <% if(admin != null && admin.getAdm_id().equals("rm1004")){%>
				<button type = "button" id = "deleteBtn" class="btn btn-outline-secondary">삭제하기</button>
				
				
				<!--  form 태그를 post 방식으로 제출 : 어떤 글을 삭제할건지 값 알아오기
				nno를 화면에 드러내지 않고 form을 submit하면서 넘길 수 있음-->
				<form id = "nnoForm" method = "post">
					<input type = "hidden" name = "nno" value = "<%= c.getnNo() %>">
				</form>
				
		 	    <!-- rm1004만 관리할 수 있기때문에 스크립트를 스크립틀릿 안에 작성 -->
				<script>
				// 삭제하기 버튼 이벤트
				const deleteBtn = document.getElementById('deleteBtn');
				deleteBtn.addEventListener('click',function(){
					$("#nnoForm").attr("action", "<%=request.getContextPath() %>/comment/delete");
					$("#nnoForm").submit();
				});
				
				
				</script>
				<%} %>
			</div>		
		</div>
	

	<!-- 목록으로 -->
	<script>
	$(function(){
		$("#BacktoBtn").click(function(){
			location.href="<%= request.getContextPath()%>/roommate/comment";
		});
	});


	<% if (admin == null || user != null) { %>
	   $(function(){
	      // addReply 버튼 클릭 시 댓글 달기(insert) 기능 수행 후 
	      // 비동기적으로 새로 갱신 된 rList를 테이블에 적용시키는 ajax 통신
	      $("#addReply").click(function(){
	         var writerNo = "<%= user.getUserNo() %>";
	         var bId = <%= c.getnNo() %>;
	         var content = $("#replyContent").val();

	         $.ajax({
	            url : "<%= request.getContextPath() %>/comment/reply",
	            type : "post",
	            dataType : "json",
	            data : {writerNo : writerNo, bId : bId, content : content},
	            success : function(data){
	               // 갱신 된 rList를 테이블에 다시 적용            
	               
	               replyTable = $("#replySelectTable");
	               replyTable.html(""); // 기존 테이블 정보 초기화
	               
	               // 새로 받아온 갱신된 댓글리스트들을 for문을 통해 다시 table에 추가
	               for(var key in data){
	                  console.log(key); // 배열이므로 key 값은 인덱스
	                  console.log(data[key].create_date);
	                 
	                  var tr = $("<tr>");
	                  var writerTd = $("<td>").text(data[key].user_id);
	                  var contentTd = $("<td>").text(data[key].content);
	                  var dateTd = $("<td>").text(data[key].create_date);
	            
	                  tr.append(writerTd, contentTd, dateTd);
	                  
	                  replyTable.append(tr);
	               }
	               
	               // +) 댓글 작성 부분 리셋
	               $("#replyContent").val("");
	            },
	            error : function(e){
	               console.log(e);
	            }
	         });
	         
	      });
	   });
	   <%}%>

	</script>
	
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>
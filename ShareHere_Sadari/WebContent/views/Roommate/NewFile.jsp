<%@page import="roommate.model.vo.RoommateUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User) request.getSession().getAttribute("loginUser");
	RoommateUser ru = (RoommateUser)request.getAttribute("ru");
	
	String msg = (String)request.getAttribute("msg");
%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title>Room and Mate</title>
    <!-- navi css 경로 -->
	<link
	   href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	   rel="stylesheet" type="text/css">
	<!-- 타이틀 이미지 -->
	<link
	   href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
	   rel="shortcut icon" type="image/x-icon">
	</head>
	<!-- 글씨체 -->
	<link
	   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	   rel="stylesheet">
    
  </head>
  
<script src="https://code.jquery.com/jquery-latest.js"></script>

<% if(session.getAttribute("msg") != null) { %>
<script>
	alert('<%= session.getAttribute("msg") %>');
</script>
<%
	session.removeAttribute("msg");
	}
%>

<style>
.modal {
	margin-bottom : 50%;
    display: none; /* Hidden by default */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color:
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: auto, 20; /* 15% from the top and centered */
    border: 1px solid #888;                         
}

 a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: none;}
</style>

  <body>
   <!-- 네비게이션 바 유지-->
   <%@include file="/views/common/navi.jsp"%>
   <br><br><br><br>
   
    
    <div class="container">
	  <div class="row">
	    <div class="col">
	      <% if (ru.getrUserResult().equals(" 어머님이 누구니")) { %>
				<img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result1.PNG" style="width : 350px; border-radius :50%; height: 450px;">
			<% } else if (ru.getrUserResult().equals("복세편살 바로나")) { %>
				<img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result2.PNG" style="width : 350px; border-radius :50%; height: 450px;">
			<% } else if (ru.getrUserResult().equals("이성적 겉바속촉")) { %>
				<img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result3.PNG" style="width : 350px; border-radius :50%; height: 450px;">	
			<% } else { %>
				<img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result4.PNG" style="width : 350px; border-radius :50%; height: 450px;">	
			<% } %>
	    </div>
	    <div class="col">
	      <table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col"><%= ru.getrUserNo() %></th>
			      <th scope="col"><%= ru.getrUserResult() %></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row"></th>
			      <td><%= ru.getRage() %></td>
			    </tr>
			    <tr>
			      <th scope="row"></th>
			      <td><%= ru.getRlivingType()%></td>
			    </tr>
			    <tr>
			      <th scope="row">입주 날짜</th>
			      <td colspan="2"><%= ru.getRlivingTerm() %></td>
			    </tr>
			    <tr>
			      <th scope="row">입주 날짜</th>
			      <td colspan="2"><%= ru.getrMoviInDate() %></td>
			    </tr>
			    <tr>
			      <th scope="row">입주 날짜</th>
			      <td colspan="2"><%= ru.getrUserGender() %></td>
			    </tr>
			    <tr>
			      <th scope="row">입주 날짜</th>
			      <td colspan="2"><%= ru.getrUserLocal() %></td>
			    </tr>
			    <tr>
			      <th scope="row">입주 날짜</th>
			      <td colspan="2"><%= ru.getrSnsAddress() %></td>
			    </tr>
			    <tr>
			      <th scope="row">입주 날짜</th>
			      <td colspan="2"><%= ru.getrUserIntro() %></td>
			    </tr>
			  </tbody>
		</table>
	    </div>
	  </div>
	  <br><br><br><br>
	</div>
	  <div class="btnDiv" style="text-align: center;">
	  	<button type="button" id="keep" class="btn btn-warning"
						style="background-color: rgb(0, 0, 0); color: white; border-color: black; width: 70px; height: 40px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
					</svg></button>
						
			<button type="button" id="chat" class="btn btn-warning"
						style="background-color: rgb(0, 0, 0); color: white; border-color: black; width: 70px; height: 40px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
  						<path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
						</svg></button>
			
			<button type="button" id="report" class="btn btn-warning"
						style="background-color: rgb(0, 0, 0); color: white; border-color: black; width: 70px; height: 40px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					
			<a class="btn btn-warning" style="background-color: black; border-color: black; color: white; width: 70px; height: 40px;" href="<%= request.getContextPath() %>/select/roommateuserlist">
			←</a> 
	  </div>
	
	  
    <div id="myModal" class="modal" style="width: 60%; height: 90%;">
 
      <!-- Modal content -->
      <div class="modal-content" style="width : 70%;">
                <p style="text-align: center;">
                <br><br>
                <b><span style="font-size: 24pt; margin: auto;">신고</span></b>
                </p><br>
                <img src="${pageContext.request.contextPath}/resources/roommate/img/logo.png" style="width : 10%; height : 10%; margin: auto;">
                <p style="text-align: center; line-height: 1.5;">
                <br>
                                 신고 사유를 선택하세요.
                </p>
                <br>
               <form action="<%= request.getContextPath() %>/roommate/report" style="margin: auto;" method="post" id="reportForm">
                <div id="report_content" style="margin: auto;">
                
					<select name="reportContent" id="select">
						<option>신고 사유</option>
						<option value="부적절한 언어사용">부적절한 언어사용</option>
						<option value="무리한 부탁요구">무리한 부탁요구</option>
						<option value="계속되는 연락">계속되는 연락</option>
						<option value="기타">기타</option>
					</select>
					<br><br>
					<div id="output" style="text-align: center;"></div>
				</div>
                <br><br><br>
           	
            	<input type="hidden" name="loginUser" value="<%= loginUser.getUserNo() %> ">
            	<input type="hidden" name="rUserNo" value="<%= ru.getrUserNo() %>">				
            </form>
            
            <form action="<%= request.getContextPath()%>/roommate/keepUser" method="post" id="goToKeepUserForm">
            	<input type="hidden" name="rUserNo" value="<%= ru.getrUserNo() %>">				      	
            </form>
            	<script>
            	
            	var selected = "";
            	$("#select").change(onSelectChange);
            		
            	function onSelectChange() {
            		selected = $("#select option:selected");
            		var output = "";
            		if (selected.val() != 0) {
            			output = selected.text();
            		}
            		$("#output").html("신고사유<br><br><span style='font-size : 20px; color : red;'>" + output + "</span><br><br>신고 하시겠습니까?");
            	}
            	</script>
            	
	            <button id="reportBtn" style="cursor:pointer;background-color:#DDDDDD;margin:auto; width : 30%; text-align: center; padding-bottom:10px; padding-top: 10px;">신고하기</button><br>    
	            <button id="closeBtn" style="cursor:pointer;background-color:#DDDDDD; margin:auto; width : 30%; text-align: center; padding-bottom:10px; padding-top: 10px;" onClick="close_pop();">닫기</button>
 			<br><br><br>
 			</div>
      </div>
	 
    <script>
		// 채팅 버튼
		const chat = document.getElementById('chat');
		chat.addEventListener('click', function(){
			location.href='<%= request.getContextPath() %>/views/Roommate/livechat.jsp';
		});	
		
		// 신고 버튼
		const report = document.getElementById('report');
		report.addEventListener('click', function(){
			
         $('#myModal').show(1000);	
		});	
		
		// 찜 버튼
		const keep = document.getElementById('keep');
		keep.addEventListener('click', function(){
			$("#goToKeepUserForm").submit();
		});	
	</script>
	<script>
		const reportBtn = document.getElementById('reportBtn');
		reportBtn.addEventListener('click', function() {
			$('#reportForm').submit();	
		});
	</script>

	<script>
      	 function close_pop(flag) {
            $('#myModal').hide(1000);
       	 };		
	</script>
    
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
    
    <!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>
  </body>
</html>


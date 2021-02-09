<%@page import="member.model.vo.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="roommate.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	User user = (User) request.getSession().getAttribute("loginUser");
	RoommateUser ru = (RoommateUser)request.getAttribute("ru"); // 내 정보
	RoommateAttachment rmat = (RoommateAttachment)request.getAttribute("attOne"); // 내 프로필 사진
	ArrayList<RoommateReport> rp = (ArrayList<RoommateReport>)request.getAttribute("rp");
	ArrayList<RoommateJjim> rj = (ArrayList<RoommateJjim>)request.getAttribute("rj"); // 내가 찜한 내역
	ArrayList<RoommatePay> rpay = (ArrayList<RoommatePay>)request.getAttribute("rpay"); // 내 결제 내역
	ArrayList<RoommateMatching> myRm = (ArrayList<RoommateMatching>)request.getAttribute("myRm"); // 내가 보낸 매칭
	ArrayList<RoommateMatching> intoRm = (ArrayList<RoommateMatching>)request.getAttribute("intoRm"); // 내게 온 매칭
	ArrayList<RoommateMatching> allowRm = (ArrayList<RoommateMatching>)request.getAttribute("allowRm"); // 매칭 성공
	
	String msg = (String)request.getAttribute("msg");
%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>sharehere</title>
    
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

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/offcanvas/">
	
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <!-- Bootstrap core CSS -->
	<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	
	<!-- Favicons -->
	<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
	<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
	<meta name="theme-color" content="#7952b3">
	
    <title>sharehere</title>
  </head>
  
   <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
       	a:link { color: black; text-decoration: none;}
		a:visited { color: black; text-decoration: none;}
		a:hover { color: white; text-decoration: none;}
    </style>
	 <!-- Custom styles for this template -->
    <link href="offcanvas.css" rel="stylesheet">
  </head>
  
<% if(session.getAttribute("msg") != null) { %>
<script>
	alert('<%= session.getAttribute("msg") %>');
</script>
<%
	session.removeAttribute("msg");
	}
%>  

 <body>
 
 <%@include file="/views/common/navi.jsp"%>
   
<br><br><br>
<div class="container">
  <div class="d-flex align-items-center p-3 my-3 text-white bg-purple rounded shadow-sm">
  <% if (rmat != null) { %>
    	<% if (rmat.getrUserNo().equals(ru.getrUserNo())) { %>
   		<img class="me-3" src="<%= request.getContextPath() %><%= rmat.getImgPath() %><%= rmat.getImgChName()%>" alt="" width="300px" height="300px">
   		<% } %>
  <% } else { %>
  		<% if (ru.getrUserResult().equals("어머님이 누구니")) { %>
   			<img class="me-3" src="${pageContext.request.contextPath}/resources/roommate/img/rm_result1.PNG" alt="" width="300px" height="300px">
		<% } else if (ru.getrUserResult().equals("복세편살 바로나")) { %>
   			<img class="me-3" src="${pageContext.request.contextPath}/resources/roommate/img/rm_result2.PNG" alt="" width="300px" height="300px">
		<% } else if (ru.getrUserResult().equals("이성적 겉바속촉")) { %>
   			<img class="me-3" src="${pageContext.request.contextPath}/resources/roommate/img/rm_result3.PNG" alt="" width="300px" height="300px">
		<% } else { %>
   			<img class="me-3" src="${pageContext.request.contextPath}/resources/roommate/img/rm_result4.PNG" alt="" width="300px" height="300px">	
		<% } %>
  <% } %> 

  </div>
   <div class="lh-1">
 	<% if(rmat == null){ %>
 	<button class="btn btn-warning" style="float: left;" id="insertThumbnailBtn">프로필 사진 등록하기</button>
 	<% } %>
 	<br>
 	<% if(rmat != null) {%>
 	 <form id = "thumbForm" method = "post" action = "<%= request.getContextPath() %>/roommate/thumbnail/delete">
	 	<button id = "deleteBtn" class="btn btn-warning" style = "float : left;">프로필 사진 삭제하기</button>
	  </form>
    <%} %>
	</div>
  
 <br><br>
  <div class="my-3 p-3 bg-white rounded shadow-sm">
    <h4 class="border-bottom pb-2 mb-0">회원 정보</h4>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"/><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">회원 번호</strong>
        <%= ru.getrUserNo() %>
      </p>
    </div>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#e83e8c"/><text x="50%" y="50%" fill="#e83e8c" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">회원 이름</strong>
        <%= user.getUserName() %>
      </p>
    </div>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#e83e8c"/><text x="50%" y="50%" fill="#e83e8c" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">성별</strong>
        <%= user.getUserGender() %>
      </p>
    </div>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">룸메이트 유형검사 결과</strong>
        <%= ru.getrUserResult() %>        
      </p>
    </div>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">희망 거주 지역</strong>
        <%= ru.getrUserLocal() %>        
      </p>
    </div>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">희망 나이대</strong>
        <%= ru.getRage() %>        
      </p>
    </div>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">희망 주거 타입</strong>
        <%= ru.getRlivingType() %>        
      </p>
    </div>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">희망 거주 기간</strong>
        <%= ru.getRlivingTerm() %>        
      </p>
    </div>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">인스타그램 아이디</strong>
        <% if (ru.getrSnsAddress().equals("없음")) { %>
        	인스타그램 계정이 없습니다.
        <% } else { %>
        <a href="http://instagram.com/<%= ru.getrSnsAddress() %>" target="_new"><%= ru.getrSnsAddress() %></a>                
        <% } %>
      </p>
    </div>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">희망 입주 날짜</strong>
        <%= ru.getrMoviInDate() %>        
      </p>
    </div>
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>

      <p class="pb-3 mb-0 small lh-sm border-bottom">
        <strong class="d-block text-gray-dark">자기 소개</strong>
        <%= ru.getrUserIntro() %>        
      </p>
    </div>
    
    
    <small class="d-block text-end mt-3">
     	<button id="updateRmInfoBtn" class="btn btn-outline-secondary" type="button">
     	정보 수정
     	</button>
    </small>
  </div>

  <div class="my-3 p-3 bg-white rounded shadow-sm">
    <h4 class="border-bottom pb-2 mb-0">내가 신청한 매칭</h4>
	<% if (myRm != null) { %>
     <% for (int i = 0; i < myRm.size(); i++) { %> 
       <% if (!myRm.get(i).getStatus().equals("Y")) { %>
	    <div class="d-flex text-muted pt-3">
	      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#00991f"/><text x="50%" y="50%" fill="#00991f" dy=".3em">32x32</text></svg>
	
	      <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
	        <div class="d-flex justify-content-between">   
	        </div>
	        <span class="d-block">       
	          <form action="<%= request.getContextPath()%>/roommate/payCheck" method="post">
	          <h6><input type="submit" style="color: blue; border: none;" name="getUserNo" value="<%= myRm.get(i).getUserNo2() %>">님에게 매칭을 신청하셨습니다.</h6>              
	          </form>
	          <br>      	
	          	매칭 성공시 연락받을 번호 : <input type="text" style="border: none; background-color: white;" name="tel" value="<%= myRm.get(i).getTel() %>">                
	            <br>
	                        매칭 요청 메세지 : <input type="text" style="border: none; background-color: white; width: 1000px;" name="text" value="<%= myRm.get(i).getText() %>">            
	          <form action="<%= request.getContextPath()%>/delete/matching" method="post">
	          <input type="hidden" name="userNo2" value="<%= myRm.get(i).getUserNo2()%>"><br>
	          <button type="submit" id="cancleMyMatching" class="btn btn-outline-secondary" style="margin-left: 95%; margin-top: -8%;">철회</button>      
	          </form>
	        </span>
	      </div>
	    </div>
    	<% } %>
    <% } %>
  <% }%>
  </div>
  
   <div class="my-3 p-3 bg-white rounded shadow-sm">
    <h4 class="border-bottom pb-2 mb-0">내게 신청한 매칭</h4>
     <% for (int i = 0; i < intoRm.size(); i++) { %>  
     	<% if (intoRm.get(i).getStatus().equals("N")) { %> 
    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#ffa200"/><text x="50%" y="50%" fill="#ffa200" dy=".3em">32x32</text></svg>
		
     	    <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
	        <div class="d-flex justify-content-between">  
	        </div>
	        <span class="d-block">       
	          <form action="<%= request.getContextPath()%>/roommate/payCheck" method="post">
	          <input type="hidden" name="redirectURL" id="redirectURL" value="/views/Roommate/rm_userDetail.jsp">	
			  <input type="hidden" name="backURL" id="backURL" value="/views/Roommate/rm_myPage.jsp">        	          
	          <h6><input type="submit" style="color: blue; border: none;" name="getUserNo" value="<%= intoRm.get(i).getUserNo() %>">님으로부터 매칭 요청이 왔습니다.</h6> <!-- 상대방 -->        
	          <br>
	          </form>      	              
	                    [<%= intoRm.get(i).getUserNo() %>님이 보낸 매칭 요청 메세지]<br><input type="text" style="border: none; background-color: white; width: 1000px;" name="text" value="<%= intoRm.get(i).getText() %>"> <!-- 상대방이 나에게 적은 글 -->       
	          <form action="<%= request.getContextPath()%>/reject/matching" method="post">
	          <input type="hidden" name="userNo" value="<%= intoRm.get(i).getUserNo()%>"> <!-- 여기서 status r로 바뀜 -->
	          <br>
	          <button type="submit" id="cancleMyMatching" class="btn btn-outline-secondary" style="margin-left: 95%; margin-top: -9.5%;">거절</button>
	          </form><br>
	          <form action="<%= request.getContextPath()%>/allow/matching" method="post">
	          <input type="hidden" name="userNo" value="<%= intoRm.get(i).getUserNo()%>"> <!-- 여기서 status y로 바뀜 -->
	          <button type="submit" id="cancleMyMatching" class="btn btn-outline-secondary" style="margin-left: 95%; margin-top: -7%;">승인</button>      
	          </form>
     		 </div>
    </div>
     	<% } %>
    <% } %>
  </div>
  
  <div class="my-3 p-3 bg-white rounded shadow-sm">
    <h4 class="border-bottom pb-2 mb-0">승인된 매칭</h4>
	<% for (int i = 0; i < allowRm.size(); i++) { %>   

    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#3af2e3"/><text x="50%" y="50%" fill="#3af2e3" dy=".3em">32x32</text></svg>
		
      <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
        <div class="d-flex justify-content-between">    
        </div>
        <span class="d-block">       
			<form action="<%= request.getContextPath()%>/roommate/payCheck" method="post">
			  <input type="hidden" name="redirectURL" id="redirectURL" value="/views/Roommate/rm_userDetail.jsp">	
			  <input type="hidden" name="backURL" id="backURL" value="/views/Roommate/rm_myPage.jsp">        	
				<% if (allowRm.get(i).getUserNo().equals(user.getUserNo())) { %> <!-- 내가 보낸건지 판단 -->
					<h6>내가 보낸 매칭을 <input type="submit" style="color: blue; border: none;" name="getUserNo" value="<%= allowRm.get(i).getUserNo2() %>">
					님께서 <span style="color: red;">수락</span>하셨습니다. </h6> <br>
					연락이 올 때 까지 기다려 주시기 바랍니다.               				
				<% } else { %> <!-- 내가 받은 매칭 -->       	
					<h6>나에게 온 <input type="submit" style="color: blue; border: none;" name="getUserNo" value="<%= allowRm.get(i).getUserNo() %>">
					님의 매칭을<span style="color: red;">수락</span>하셨습니다.</h6> <br>
					연락처 : <%= allowRm.get(i).getTel() %> <br>               								
					메세지 : <%= allowRm.get(i).getText() %>                								
				<% } %>
          	</form> 
      </div>
    </div>
    <% } %>
  </div>
  
  <hr>
  
  <div class="my-3 p-3 bg-white rounded shadow-sm">
    <h4 class="border-bottom pb-2 mb-0">찜 내역</h4>
	<% for (int i = 0; i < rj.size(); i++) { %>   

    <div class="d-flex text-muted pt-3">
      <svg class="bd-placeholder-img flex-shrink-0 me-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 32x32" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="darkred"/><text x="50%" y="50%" fill="darkred" dy=".3em">32x32</text></svg>
		
      <div class="pb-3 mb-0 small lh-sm border-bottom w-100">
        <div class="d-flex justify-content-between">    
        </div>
        <span class="d-block">       
			<form action="<%= request.getContextPath()%>/roommate/payCheck" method="post">
			  <input type="hidden" name="redirectURL" id="redirectURL" value="/views/Roommate/rm_userDetail.jsp">	
			  <input type="hidden" name="backURL" id="backURL" value="/views/Roommate/rm_myPage.jsp"> 
			  <h6><input type="submit" style="color: blue; border: none;" name="getUserNo" value="<%= rj.get(i).getUsNo2() %>">님을 찜하셨습니다.</h6> <!-- 상대방 -->        
	          <br>       	
          	</form>
          	<form action="<%= request.getContextPath()%>/delete/jjim" method="post">
	          <input type="hidden" name="userNo2" value="<%= rj.get(i).getUsNo2()%>"><br>
	          <button type="submit" id="cancleMyMatching" class="btn btn-outline-secondary" style="margin-left: 95%; margin-top: -5%;">취소</button>      
	          </form>
      </div>
    </div>
    <% } %>
  </div>
  

  <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" onclick="history.go(-1);">뒤로가기</button>
  
  
  <script>
  		// 정보 수정
		const updateRmInfoBtn = document.getElementById('updateRmInfoBtn');
		updateRmInfoBtn.addEventListener('click', function() {
			// 새 창 띄우기
			window.open('<%=request.getContextPath() %>/views/Roommate/rm_updateInfo.jsp', 'width=100px, height=100px', 'newWindow');	
		});
	</script>
	
  <script>
  		// 썸네일 등록
		const insertThumbnailBtn = document.getElementById('insertThumbnailBtn');
		insertThumbnailBtn.addEventListener('click', function() {
			// 새 창 띄우기
			window.open('<%=request.getContextPath()%>/views/Roommate/rm_insertThumbnail.jsp', 'width=100px, height=100px', 'newWindow');	
		});
	</script>
		
  
</div>
<br><br><br><br><br><br>


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
  </body>
</html>
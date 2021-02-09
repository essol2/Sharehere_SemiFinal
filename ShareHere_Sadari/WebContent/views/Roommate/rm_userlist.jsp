<%@page import="roommate.model.vo.RoommateAttachment"%>
<%@page import="member.model.vo.User"%>
<%@page import="roommate.model.vo.RoommateUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%
	ArrayList<RoommateUser> ruList = (ArrayList<RoommateUser>)request.getAttribute("roommateUserList");
	ArrayList<RoommateAttachment> rmat = (ArrayList<RoommateAttachment>)request.getAttribute("roommateAttachmentList");
	User user = (User) request.getSession().getAttribute("loginUser");
	
%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <!-- 글씨체 -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- css 경로 -->
<link href="./hst_info.css" rel="stylesheet" type="text/css">
<!-- navi css 경로 -->
<link
	href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">
<!-- 제이쿼리 라이브러리 추가 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Room </title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/">

    <!-- Bootstrap core CSS -->
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">



<title>RoomMate</title>
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
      
    button {
	outline: 0;
	}
	
	.li{
   display:none;
	}
	
	.inline {
	   display:inline-block;
	}
	
	#loadMore:hover {
	    color:black;
	}
	
	#showLess:hover {
	    color:black;
	}
	#loadMore {
	    cursor:pointer;
	}
	#showLess {
	    cursor:pointer;
	}
	
	#myList img {
		margin: auto;
		width: 350px;
		height: 400px;
	
	}
    </style>

  </head>
<% if(session.getAttribute("msg") != null) { %>
<script>
	alert('<%= session.getAttribute("msg") %>');
</script>
<%
	session.removeAttribute("msg");
	}
%>

<% if(session.getAttribute("Paymsg") != null) { %>
<script>
	if (confirm("결제가 필요한 서비스입니다. 결제 하시겠습니까?")) {
		location.href="<%= request.getContextPath() %>/views/Roommate/rm_pay.jsp";
	} else {
		location.href="<%= request.getContextPath() %>/select/roommateuserlist";		
	}
</script>
<%
	session.removeAttribute("Paymsg");
	}
%>
<div>

 <!-- 네비게이션 바 유지-->
   <%@include file="/views/common/navi.jsp"%>
<% if (user != null) { %>
	  <section class="py-5 text-center container">
	    <div class="row py-lg-5">
	      <div class="col-lg-6 col-md-8 mx-auto">
	        <h2 class="fw-light">'<span style="color: blue;"><%= user.getUserName() %></span>'님 과 유사한 타입의 <br>예비 룸메를 한눈에!</h2><br>
	        <p class="lead text-muted">마이페이지에서 프로필 이미지를 등록해주세요! <br>매칭률이 더욱 높아집니다 :)</p> <br><br>        
	      	<a href="<%=request.getContextPath()%>/select/roommateuserdata" class="btn btn-outline-secondary" type="button" id="myPage">마이페이지 가기</a>
	      </div>
	    </div>
	  </section>
	  
   <div id="loadMore" style="text-align: left; margin-left: 3.5%; margin-top:-20%; position:fixed; font-size: 40px; z-index: 2;">
	  	 <img src="${pageContext.request.contextPath}/resources/roommate/img/rm_moreBtn.png">
	  </div><br><br><br>
	  <div id="showLess" style="text-align: center; margin-left: 83%; margin-top:-24.5%; position:fixed; font-size: 40px; z-index: 2;">
	  	 <img src="${pageContext.request.contextPath}/resources/roommate/img/rm_lessBtn.png">
	  </div>
	
	  
	  
<div id="myList" style="display:flex; flex-flow: row wrap; margin-left: 14.5%; width: 80%; height: 70%;">

   <% if (ruList != null) { %> <!-- 회원리스트가 낫널일때 -->
	<% for (int i = 0; i < ruList.size(); i++) { %> <!-- 같은 유형 사람 -->
         <% if (!ruList.get(i).getrUserNo().equals(user.getUserNo())) { %> <!-- 본인 제외 -->
     
				  <div class="li album py-5 bg-light" style="width: 30%;">
				    <div class="container">		
				      <div class="col cols-1 cols-sm-2 cols-md-3 g-3">
				        <div class="col">
				          <div class="card shadow-sm" style="overflow: hidden;">
				          <% boolean loopFlag = false; %>
							 <% for (int j = 0; j < rmat.size(); j++) { %>
		               			<% if (rmat.get(j).getrUserNo().equals(ruList.get(i).getrUserNo())) { %> <!-- 유저리스트의 회원 번호와 썸네일 리스트의 회원 번호가 일치하면 출력 -->
		               				<img src="<%= request.getContextPath() %><%= rmat.get(j).getImgPath() %><%= rmat.get(j).getImgChName()%>" class="card-img-top" style="width: 100%;">
		               				<% loopFlag = true; %>
		               			<% } %>
					          <% } %>
					          
					          <% if (loopFlag == false) { %> <!-- 썸네일 없을때 -->
					          		<% if (ruList.get(i).getrUserResult().equals("어머님이 누구니")) { %>
					                  <img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result1.PNG" class="card-img-top" style="width: 100%;">               
					                <% } else if (ruList.get(i).getrUserResult().equals("복세편살 바로나")) { %>
					                  <img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result2.PNG" class="card-img-top" style="width: 100%;">                              
					                <% } else if (ruList.get(i).getrUserResult().equals("이성적 겉바속촉")) { %>
					                  <img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result3.PNG" class="card-img-top" style="width: 100%;">                              
					                <% } else { %>
					                  <img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result4.PNG" class="card-img-top" style="width: 100%;">                              
					                <% } %>
					            <% } %>

				            <div class="card-body">
				              <p class="card-text">'<%= ruList.get(i).getrUserNo() %>'님</p>
				              <p class="card-text"><%= ruList.get(i).getrUserLocal() %></p>
				              <p class="card-text"><%= ruList.get(i).getrUserGender() %></p>
				              <p class="card-text" style="height : 50px; overflow: hidden;"><%= ruList.get(i).getrUserIntro() %></p>
				              <div class="d-flex justify-content-between align-items-center">
				                <div class="btn-group">
				                <form action="<%= request.getContextPath() %>/roommate/payCheck" method="post">
								<input type="hidden" name="getUserNo" id="getUserNo" value="<%= ruList.get(i).getrUserNo() %>">	
								<input type="hidden" name="getUserSurvey" id="getUserResult" value="<%= ruList.get(i).getrUserResult() %>">	
								<input type="hidden" name="redirectURL" id="redirectURL" value="/views/Roommate/rm_userDetail.jsp">	
								<input type="hidden" name="backURL" id="backURL" value="/views/Roommate/rm_userlist.jsp">	
								<button class="btn btn-dark" id="showDetailBtn">자세히</button>							
								</form>
				                </div>
				                <small class="text-muted">sharehere</small>
				              </div>
				            </div>
				          </div>
				        </div>
				      </div>
				    </div>
		  		</div> 
			<% } %>
		<% } %>
	</div>
	<% } else { %>
		<div id="myList" style="display:flex; flex-flow: row wrap; width: 100%;">
		    <div class="li album py-5 bg-light" style="text-align: center; width: 87%;">
				    <div class="container">		
				    
				     	<h2 class="fw-light">'<span style="color: blue;"><%= user.getUserName() %></span>'님 과 유사한 타입의 <br>예비 룸메가 아직 없습니다.</h2><br>
				      	<a href="<%=request.getContextPath()%>/index.jsp"><button class="btn btn-warning">메인으로</button></a>
				    </div>
		  		</div> 
		  	</div>
		<% } %>
	<% } %>
</div>


	 <script>
         $(document).ready(function () {
             size_li = $("#myList .li").length;
             console.log(size_li);
             x=6;
             console.log($('#myList .li:lt('+x+')'));
             $('#myList .li:lt('+x+')').addClass('inline');
             $('#myList .li:lt('+x+')').show();
             
             $('#loadMore').click(function () {
                 x= (x+3 <= size_li) ? x+3 : size_li;
                 $('#myList .li:lt('+x+')').addClass('inline');
                 $('#myList .li:lt('+x+')').show();
             });
             $('#showLess').click(function () {
                 x=(x-3<0) ? 3 : x-3;
                 $('#myList .li').not(':lt('+x+')').removeClass('inline');
                 $('#myList .li').not(':lt('+x+')').hide();
             });
         });
         </script>
		<br><br><br>
	<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous">
	</script>
		
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   User user = (User) session.getAttribute("loginUser");
%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title>sharehere</title>
	<link rel="stylesheet"
	   href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	   integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	   crossorigin="anonymous">
	<link rel="stylesheet"
	   href="${pageContext.request.contextPath}/resources/roommate/css/rm_survey.css">
	
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
	   
	   <style>
	   body{
	   	margin-left : 0;
	   	margin-right : 0;
	   	width : 100%;
	   }
	   	 a:link {text-decoration: none;}
	   	 
		#container {
		  display: flex;
		}
		#box-left {
		  flex: 1;
		  margin-top : 10px;
		}
		#box-center {
		  background: orange;
		  flex: 3;
		  text-align: center;
		}
		#box-right {
		  flex: 1;
		}

	   </style>

<body style="margin-left : 0; margin-right : 0;">

   <!-- 네비게이션 바 유지-->
   <%@include file="/views/common/navi.jsp"%>
   <br>
   <br>
   <!--시작 페이지-->
  <br>
  <div class="start">
  <div class="row row-cols-2" style="border: 1px solid lightgray; padding: 5%;">
    <div class="col"><br><br><br><br><br><h1>나는 어떤 룸메이트일까?</h1><br>
    <h5><span style="color: rgb(87, 134, 236);"><b>룸메이트 유형검사</b></span>를 통해 본인의 유형과
        <br>본인에게 적합한<b>'쉐어메이트'</b>를 추천받아보세요 !</h5><br>

		<% if (user != null) { %> <!-- 로그인 했으면 -->
      		<a href="<%= request.getContextPath() %>/roommate/idCheck" class="btn btn-outline-secondary" type="button" id="start();">나와 맞는 룸메 보러가기</a>		
		<% } else { %> <!-- 로그인 안했으면 -->
      		<a class="btn btn-outline-secondary" type="button" onclick="start();">나와 맞는 룸메 보러가기</a>		
		<% } %>

    </div>
    <div class="col"><img src="${pageContext.request.contextPath}/resources/roommate/img/rm_main2.PNG"></div>
  	</div>
	</div>
  	<br><br><br>
  	
   <article class="start">
		<pre style="font-family: NanumGothic;"><h4>                   쉐어히어 룸메이트 매칭 후기                                                쉐어히어 오픈채팅방</h4></pre>
      <div id='container'>
    <div id='box-left' style="margin-left : 7%; margin-right:0;">
       <div class="col-md-10">
            <div
               class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
               <div class="col p-4 d-flex flex-column position-static">
                  <strong class="d-inline-block mb-2 text-primary">매칭 7호</strong>
                  <h3 class="mb-0">토끼눈님과 방구해님의 매칭</h3><br>
                  <p class="card-text mb-auto">온라인으로 룸메이트를 구한다고? 반신반의 했지만 급한마음에
                     일단 둘러보기 시작했습니다.</p>
                  <a href="<%= request.getContextPath() %>/roommate/comment" style="color: black;" class="stretched-link"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-index-thumb-fill" viewBox="0 0 16 16">
  <path d="M8.5 1.75v2.716l.048-.002c.311-.012.74-.016 1.05.046.28.056.543.18.738.288.274.152.456.385.56.642l.132-.012c.312-.024.794-.038 1.158.108.37.148.689.487.88.716.075.09.141.175.195.248h.582a2 2 0 0 1 1.99 2.199l-.272 2.715a3.5 3.5 0 0 1-.444 1.389l-1.395 2.441A1.5 1.5 0 0 1 12.42 16H6.118a1.5 1.5 0 0 1-1.342-.83l-1.215-2.43L1.07 8.589a1.517 1.517 0 0 1 2.373-1.852L5 8.293V1.75a1.75 1.75 0 0 1 3.5 0z"/>
</svg></a>
               </div>
               <div class="col-auto d-none d-lg-block">
                  <img class="bd-placeholder-img" width="200" height="267"
                     src="${pageContext.request.contextPath}/resources/roommate/img/rm_comment3.jpg">
                  
               </div>
            </div>
         </div>
        <div class="col-md-10">
            <div
               class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
               <div class="col p-4 d-flex flex-column position-static">
                  <strong class="d-inline-block mb-2 text-success">매칭 23호</strong>
                  <h3 class="mb-0">감튀냠냠님과 취뽀님의 매칭</h3><br>
                  <p class="mb-auto">쉐어히어로 베프찾았습니다~! 이렇게 좋은거 웨 안헤? 성향검사로 나랑 맞는
                     친구찾은 느낌이에요!!!</p>
                  <a href="<%= request.getContextPath() %>/roommate/comment" style="color: black;" class="stretched-link"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-index-thumb-fill" viewBox="0 0 16 16">
  <path d="M8.5 1.75v2.716l.048-.002c.311-.012.74-.016 1.05.046.28.056.543.18.738.288.274.152.456.385.56.642l.132-.012c.312-.024.794-.038 1.158.108.37.148.689.487.88.716.075.09.141.175.195.248h.582a2 2 0 0 1 1.99 2.199l-.272 2.715a3.5 3.5 0 0 1-.444 1.389l-1.395 2.441A1.5 1.5 0 0 1 12.42 16H6.118a1.5 1.5 0 0 1-1.342-.83l-1.215-2.43L1.07 8.589a1.517 1.517 0 0 1 2.373-1.852L5 8.293V1.75a1.75 1.75 0 0 1 3.5 0z"/>
</svg></a>
               </div>
               <div class="col-auto d-none d-lg-block">
                  <img class="bd-placeholder-img" width="200" height="267"
                     src="${pageContext.request.contextPath}/resources/roommate/img/rm_comment4.jpg">
                  </svg>
               </div>
            </div>
         </div>
      </div>
 
    <div id='box-right' style="margin-left : -10%; margin-right : 5%;"> 
    <%@ include file="/views/Roommate/livechat.jsp" %>
    </div>
</div>
    
      <script>
  		// 채팅 버튼
		const chat = document.getElementById('chat');
		chat.addEventListener('click', function() {
			// 새 창 띄우기
			window.open('<%=request.getContextPath() %>/views/Roommate/livechat.jsp', 'width=100px, height=100px', 'newWindow');
			<%--location.href='<%= request.getContextPath() %>/views/Roommate/livechat.jsp'; --%>
		});
		</script>
		
		<script>
        function start() {
	          if (confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
	             location.href="<%=request.getContextPath()%>/views/Login/login_Nnavi.jsp";
       		 }	        		
         }
      </script>

   </article>

   <br><br><br><br>
   <!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp"%>

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



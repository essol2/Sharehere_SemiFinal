<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   User u = (User)session.getAttribute("loginUser");
   Host h = (Host)session.getAttribute("loginHost");
%>

<%
   if (request.getAttribute("result") != null) {
      if (request.getAttribute("result").equals("success")) {
%>
<script>
   alert("회원탈퇴가 완료되었습니다.");
   location.href="<%= request.getContextPath() %>"
</script>
<%        } else { %>
<script>
   alert("비밀번호가 틀렸습니다.");
</script>
<%              }
      }%>
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>MYpage_update</title>
<!-- 글자 폰트 -->
    <link
    href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
    rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
    crossorigin="anonymous">

    <!-- navi css 경로 -->
<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <style> 
        @font-face {
    font-family: 'MapoFlowerIsland';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
   font-family: 'MapoFlowerIsland';
}
       
       
/* 은솔님 */
   .nav-link{color:gray;}
   .nav-link:hover{color:black;}
   
    .hst_table {
   padding: 5% 10% 5% 10%;
  
   font-weight: bold;
   height : 600px;
}

#update, #delete {
   background-color: white;
   border: 0px;
   border-radius: 30%;
}

#update:hover {
   background-color: rgb(247, 218, 57);
}

#delete:hover {
   background-color: rgb(175, 29, 29);
}

#update img, #delete img {
   width: 30px;
}

#bottomNav{
    margin-left : 45%;
    margin-right : 45%;
}

#numCss{
      color:black;
}

#numCss:hover{
    background-color: gray;
    color:white;
}

#forCss{
    background-color: black;
    color : white;
}

#forCss:hover{
    background-color: gray;
    color:white;
}


/*나 */
      *{box-sizing: border-box;}
        /* section, #wrap, #usr_updateForm{height: auto;} */
        #Mwrap{margin: 0 auto;height: 500px;width: 500px;margin-top: 30px;}
        #wrap{ height: 230px; width: 500px;padding : 20px;border: 3px solid rgb(196, 196, 196);}
        #usr_updateForm{height: 500px;}
        #Lwrap{height:300px; width: 50%;  display: flex; flex-direction: column; align-content:center}
        #Rwrap{height:250px; width: 50%;  display: flex; flex-direction: column; align-content:center}
        #Lwrap div{display: flex; justify-content: space-between;}
        #Rwrap div{display: flex; justify-content: space-between;}
        #btndiv{display: flex; justify-content: center;}
        #btndiv button{margin : 4px 12px 0 12px;}
        
        .join_title{margin: 10px 0 10px 0;flex-basis: 35%;display: inline;}
        .join_title ~input{flex-basis: 63%;}
        #pwd{width:330px; margin-left:30px;}
        #back{margin-left: 15px;}
        #back,#deleteMem{float:right; background-color: black;color : white;border-radius : 7px;font-size:medium;width: 130px;height : 30px;}
        #back:hover,#deleteMem:hover{background-color: white;color : black;}
        span{text-align: center;}
        #wrap h2{margin-bottom : 30px;}
       /* h1, h2, h4 {font-family: 'Nanum Gothic', sans-serif;} */
       /* 직접 스타일줘야할듯 부트스트랩이랑 충돌때매 안먹음
       h2{font-size:24px;} */
       .join_title{font-size:16px;} 

    </style>
</head>
<body>
<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
      <%@include file="/views/common/navi.jsp" %>
    <section>
    
        <!-- 메뉴탭 코드 삽입 -->
        <form id="deleteform" name="deleteform" action="#" method="POST">
<% if(loginUser != null){ %>
        <input type="hidden" name="user_no" value="<%= u.getUserNo() %>">
        <ul class="nav nav-tabs">
           <li class="nav-item">
             <a class="nav-link" aria-current="page" href="<%= request.getContextPath() %>/views/Mypage/mp_update.jsp">회원 정보 수정</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="<%= request.getContextPath() %>/Mypage/User/ReservationList">예약한 방 정보</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="<%= request.getContextPath() %>/pay/list">결제내역 확인</a>
           </li>
           <li class="nav-item">
               <a id="deleteBtn" class="nav-link active" href="#">회원탈퇴</a>
           </li>
         </ul>
<% }else{ %>
        <input type="hidden" name="user_no" value="<%= h.getHst_no() %>">
        <ul class="nav nav-tabs">
           <li class="nav-item">
             <a class="nav-link" aria-current="page" href="<%= request.getContextPath() %>/views/Mypage/mp_update.jsp">회원 정보 수정</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="<%= request.getContextPath() %>/hst/reservationList">예약한 입주민 정보</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="<%= request.getContextPath() %>/Mypage/hstPay">결제내역 확인</a>
           </li>
           <li class="nav-item">
               <a id="deleteBtn" class="nav-link active" href="#">회원탈퇴</a>
           </li>
         </ul>
<% } %>
        </form>
        <!-- 밑에 -->
        <div class="hst_table">
        <div id="Mwrap">
           <h1>회원탈퇴</h1>
           <div id="wrap"> 
              <!-- 코드추가 -->
<!-- 일반회원 -->
<% if(loginUser != null){ %>
               <h2>비밀번호 확인</h2>
               <form name="usr_updateForm" id="update_user" method="POST"
            action="<%= request.getContextPath() %>/member/delete"">
                      <input type="hidden" name="user_no" value="<%= u.getUserNo() %>">
                      <input type="hidden" name="user_id" value="<%= u.getUserId() %>">
                       <div style="margin-bottom:28px;"><h4 class='join_title'>비밀번호 : </h4><input type="password" name="userPwd" id="pwd"></div>
                   
<!-- 호스트 회원 -->
<% }else if(loginHost != null){ %>                   
            <h2>비밀번호 확인</h2>
               <form name="usr_updateForm" id="update_host" method="POST"
            action="<%= request.getContextPath() %>/member/delete">
                  <input type="hidden" name="user_no" value="<%= h.getHst_no() %>">
                    <input type="hidden" name="user_id" value="<%= h.getHst_id() %>">
                       <div style="margin-bottom:28px;"><h4 class='join_title'>비밀번호 : </h4><input type="password" name="userPwd" id="pwd"></div>
<%} %>                       
                       
               <script>

                </script>


   <div id="btndiv">  
                   <button id="back" onsubmit="history goBack()">뒤로가기</button>
                   <button id="deleteMem" type="submit">탈퇴하기</button>
   <div>
           </div>
        </div>
        </div>
            </form>
    </section>
    <script>
       // 탈퇴하기 버튼 클릭 이벤트
      const deleteBtn = document.getElementById('deleteBtn');
      deleteBtn.addEventListener('click', function(){
         location.href="<%= request.getContextPath() %>/views/Mypage/mp_delete.jsp";
      });
   </script>
        
   <!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp" %>
</body>
</html>
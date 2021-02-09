<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   User u = (User)session.getAttribute("loginUser");
   Host h = (Host)session.getAttribute("loginHost");
%>
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
        #Mwrap{margin:0 auto; height: auto; width: 1000px; margin-top:30px;}
        #wrap{ height: 700px; width: 1000px;}
        #usr_updateForm{height: 500px;}
        #Lwrap{height:300px; width: 50%; float: left; display: flex; flex-direction: column; align-content:center}
        #Rwrap{height:250px; width: 50%; float: left; display: flex; flex-direction: column; align-content:center}
        #Lwrap div{display: flex; justify-content: space-between;}
        #Rwrap div{display: flex; justify-content: space-between;}
        
        .join_title{margin: 10px 0 10px 0;flex-basis: 35%;display: inline;}
        .join_title ~input{flex-basis: 63%;}
/*         #pwdUpdateBtn{float:right; background-color: black;color : white;border-radius : 7px;font-size:medium;width: 130px;height : 30px;} */
/*         #pwdUpdateBtn:hover{background-color: white;color : black;} */
        #wrap{padding : 20px;border: 3px solid rgb(196, 196, 196); height: auto;}
        #back{margin-left: 15px;}
        #back,#modify{float:right; background-color: black;color : white;border-radius : 7px;font-size:medium;width: 130px;height : 30px;}
        #back:hover,#modify:hover{background-color: white;color : black;}
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
             <a class="nav-link active" aria-current="page" href="<%= request.getContextPath() %>/views/Mypage/mp_update.jsp">회원 정보 수정</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="<%= request.getContextPath() %>/Mypage/User/ReservationList">예약한 방 정보</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="<%= request.getContextPath() %>/pay/list">결제내역 확인</a>
           </li>
           <li class="nav-item">
               <a id="deleteBtn" class="nav-link" href="#">회원탈퇴</a>
           </li>
         </ul>
<% }else{ %>
        <input type="hidden" name="user_no" value="<%= h.getHst_no() %>">
        <ul class="nav nav-tabs">
           <li class="nav-item">
             <a class="nav-link active" aria-current="page" href="<%= request.getContextPath() %>/views/Mypage/mp_update.jsp">회원 정보 수정</a>
           </li>
           <li class="nav-item">
            <a class="nav-link" href="<%= request.getContextPath() %>/hst/reservationList">예약한 입주민 정보</a>
           </li>
           <li class="nav-item">
               <a class="nav-link" href="<%= request.getContextPath() %>/Mypage/hstPay">결제내역 확인</a>
           </li>
           <li class="nav-item">
               <a id="deleteBtn" class="nav-link" href="#">회원탈퇴</a>
           </li>
         </ul>
<% } %>
        </form>
        <!-- 밑에 -->
        <div id="Mwrap">
           <h1>회원 정보 수정</h1>
           <div id="wrap"> 
              <!-- 코드추가 -->
<!-- 일반회원 -->
<% if(loginUser != null){ %>
               <h2><%= u.getUserName() %> 님의 정보입니다.</h2>
               <form name="usr_updateForm" id="update_user" method="POST"
            action="<%= request.getContextPath() %>/member/update" onsubmit="return joinValidate();">
                   <div id="Lwrap">
                      <input type="hidden" name="user_no" value="<%= u.getUserNo() %>">
                      <input type="hidden" name="user_id" value="<%= u.getUserId() %>">
                       <div><h4 class="join_title">이름 : </h4><input type="text" maxlength="5" name="us_name" id="name" value="<%= u.getUserName() %>"></div>
                       <span id="nameresult">&nbsp;</span>
<%--                        <div><h4 class='join_title'>성별 : </h4><input type="text" value="<%= gender %>" id="gender" readonly></div> --%>
                       <div><h4 class='join_title'>성별 : </h4><input type="text" value="<%= (u.getUserGender().charAt(0) == 'M') ? "남자" : "여자" %>" id="gender" readonly></div>
                       <span>&nbsp;</span>
                       <div><h4 class='join_title'>비밀번호 : </h4><input type="text" name="us_pwd" id="pwd" placeholder="변경하려면 클릭하세요." readonly></div>
<!-- 비밀번호 변경 -->
<!--                        <button id="pwdUpdateBtn" type="button">비밀번호 변경</button> -->
<!--                        <span id="pwdresult">&nbsp;</span> -->
<!--                        <div><h4 class='join_title'>비밀번호 변경 : </h4><input type="button" id="pwdUpdateBtn" value="비밀번호 변경"></div> -->
<!--                        <span id="pwd2result">&nbsp;</span> -->
                   </div>
                   <div id="Rwrap">
                       <div>&nbsp;&nbsp;<h4 class='join_title'>생년월일 : </h4><input type="text" id="birth" readonly value="<%= u.getUserBirth()%>"></div>
                       <span id="birthresult">&nbsp;</span>
                       <div>&nbsp;&nbsp;<h4 class='join_title'>이메일 : </h4><input type="email" name="us_email" id="email" value="<%= u.getUserEmail()%>"></div>
                       <span id="emailresult">&nbsp;</span>
                       <div>&nbsp;&nbsp;<h4 class='join_title'>휴대전화 : </h4><input type="tel" name="us_phone" id="phone" value="<%= u.getUserPhone() %>"></div>
                       <span id="phoneresult">&nbsp;</span>
                   </div>
                   
<!-- 호스트 회원 -->
<% }else if(loginHost != null){ %>                   
            <h2><%= h.getHst_name() %> 님의 정보입니다.</h2>
               <form name="usr_updateForm" id="update_host" method="POST"
            action="<%= request.getContextPath() %>/member/update" onsubmit="return joinValidate();">
                   <div id="Lwrap" style="height:350px;">
                      <input type="hidden" name="user_no" value="<%= h.getHst_no() %>">
                      <input type="hidden" name="user_id" value="<%= h.getHst_id() %>">
                      <div><h4 class="join_title">사업자번호(-없이) : </h4><input type="text" id="bsnum" name="bsnum" value="<%= h.getHst_bsno() %>" readonly></div>
                      <span id="bsnumresult">&nbsp;</span>
                       <div><h4 class="join_title">이름 : </h4><input type="text" maxlength="5" name="us_name" id="name" value="<%= h.getHst_name() %>"></div>
                       <span id="nameresult">&nbsp;</span>
                       <div><h4 class='join_title'>성별 : </h4><input type="text" value="<%= (h.getHst_gender().charAt(0) == 'M') ? "남자" : "여자" %>" id="gender" readonly></div>
                       <span>&nbsp;</span>
                       
                       <div><h4 class='join_title'>비밀번호 : </h4><input type="text" name="us_pwd" id="pwd" placeholder="변경하려면 클릭하세요." readonly></div>
<!-- 비밀번호 변경 -->                       
<!--                        <span id="pwdresult">&nbsp;</span> -->
<%--                        <div><h4 class='join_title'>비밀번호 확인 : </h4><input type="password" id="pwd2" value="<%= h.getHst_pwd()%>"></div> --%>
<!--                        <span id="pwd2result">&nbsp;</span> -->
                   </div>
                   <div id="Rwrap" style="height:300px;">
                      <div>&nbsp;&nbsp;<h4 class="join_title">상호명 : </h4><input type="text" id="bsname" name="bsname" value="<%= h.getHst_bsname() %>" readonly></div>
                       <span id="bsnameresult">&nbsp;</span>
                       <div>&nbsp;&nbsp;<h4 class='join_title'>생년월일 : </h4><input type="text" id="birth" readonly value="<%= h.getHst_birth()%>"></div>
                       <span id="birthresult">&nbsp;</span>
                       <div>&nbsp;&nbsp;<h4 class='join_title'>이메일 : </h4><input type="email" name="us_email" id="email" value="<%= h.getHst_email()%>"></div>
                       <span id="emailresult">&nbsp;</span>
                       <div>&nbsp;&nbsp;<h4 class='join_title'>휴대전화 : </h4><input type="tel" name="us_phone" id="phone" maxvalue="11" value="<%= h.getHst_phone() %>"></div>
                       <span id="phoneresult">&nbsp;</span>
                   </div>
<%} %>                       
                       
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <button id="back" onsubmit="history goBack()">뒤로가기</button>
                   <button id="modify">수정하기</button>
               <script>
                    $(function () {
                       $("#bsnum").change(function(){
                          var regbsnum = /^[0-9]{10}$/;   
                          if(!regbsnum.test($(this).val())){
                             $("#bsnumresult").html("10자리 숫자만 입력하세요").css("color", "red");
                          }else{
                              $("#bsnumresult").html("정상 입력").css("color", "green");
                          }
                       });
                       
                       $("#bsname").change(function(){
                          // 빈값 못오게
                          var regbsnum = /^.+$/;   
                          if(!regbsnum.test($(this).val())){
                             $("#bsnameresult").html("상호명을 입력해주세요.").css("color", "red");
                          }else{
                              $("#bsnameresult").html("입력 완료").css("color", "green");
                          }
                       });
                        $("#name").change(function () {
                            var regname = /^[가-힣]{2,5}$/;     //2~5글자의 한글 이름
                            if (regname.test($(this).val())) {
                                $("#nameresult").html("정상 입력.").css("color", "green");
                            } else {
                                $("#nameresult").html("올바른 이름이 아닙니다.").css("color", "red");
                            }
                        });

                        $("#birth").change(function () {
                            var date = new Date;
                            var inputbirth = new Date($("#birth").val());

                            if (inputbirth > date) {
                                $("#birthresult").html("생년월일을 정확히 입력하세요.").css("color", "red");
                            } else {
                                $("#birthresult").html("정상 입력").css("color", "green");
                            }
                        });

                        //  성별 Null 값 안되게 다뤄주기--> 선택 안하고 submit 못하게..
                        
                        $("#email").change(function () {
                                var emailVal = $("#email").val();
                                var regemail = /^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                                if (emailVal.match(regemail) != null) {
                                    $("#emailresult").html("정상입력").css("color", "green");
                                }
                                else {
                                    $("#emailresult").html("올바른 이메일을 입력해주세요.").css("color", "red");
                                }
                            });
                        $("#phone").change(function(){
                            var phoneVal = $("#phone").val();
                            var regphone = /^010\D?\d{4}\D?\d{4}$|^01[16789]\D?\d{3}\D?\d{4}$/;

                            if(regphone.test(phoneVal)){
                                $("#phoneresult").html("정상입력").css("color","green");
                            }else{
                                $("#phoneresult").html("올바른 휴대전화 번호를 입력해주세요.").css("color","red");
                            }
                        });
                        
                        // 보완
                        $("#register_btn").mouseenter(function () {
                            if ($("#pwd2").val() != $("#pwd").val()) {
                                $("#pwd2result").html("비밀번호가 일치하지 않습니다.").css("color", "red");
                            } else {
                                $("#pwd2result").html("비밀번호가 일치합니다.").css("color", "green");
                            }
//                             if(!($("#m").checked && $("#f").checked)){
//                                 $("#gerderresult").html("성별을 선택해주세요.").css("color", "red");
//                             }else{
// //테스트해보기
//                                $("#gerderresult").html("성별선택 완료.").css("color", "green");
//                             }
                        });

                    });
                </script>


            </form>
   
           </div>
        </div>
    </section>
    <script>
    // 뒤로가기 버튼
      const back = document.getElementById('back');
      back.addEventListener('click', function(){
         location.href="<%= request.getContextPath() %>";
      });
      
//       // 탈퇴하기 버튼 클릭 이벤트
//       const deleteBtn = document.getElementById('deleteBtn');
//       deleteBtn.addEventListener('click', function(){
//          if(confirm("정말로 탈퇴하시겠습니까?")){
<%--             $("#deleteform").attr("action", "<%=request.getContextPath() %>/member/delete"); --%>
//             $("#deleteform").submit();
//          }
//       });
		const deleteBtn = document.getElementById('deleteBtn');
		deleteBtn.addEventListener('click', function(){
		   location.href="<%= request.getContextPath() %>/views/Mypage/mp_delete.jsp";
		});
      
      
      // 비밀번호 변경창 띄우기
      const pwd = document.getElementById('pwd');
      pwd.addEventListener('click', function(){
         window.open("pwdUpdateForm.jsp", "비밀번호 변경 창", "width=510, height=340", "resizable=no");
      });
      
      
      function joinValidate(){
         if(!(/^[가-힣]{2,5}$/).test($("#name").val())){
            alert('이름은 한글 2~5글자 사이만 가능');
            $("#name").select();
            return false;
         }
         if(!((/^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i).test($("#email").val()))){
            alert('이메일주소를 확인해주세요.');
            $("#email").select();
            return false;
         }
         if(!(/^010\D?\d{4}\D?\d{4}$|^01[16789]\D?\d{3}\D?\d{4}$/).test($("#phone").val())){
            alert('휴대전화번호를 확인해주세요.');
            $("#phone").select();
            return false;
         }
         return true;
      }
   </script>
        <!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp" %>
</body>
</html>
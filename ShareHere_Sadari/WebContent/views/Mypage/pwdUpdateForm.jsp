<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
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
<title>Insert title here</title>
<!--제이쿼리 --><script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<%
	if (request.getAttribute("result") != null) {
		if (request.getAttribute("result").equals("success")) {
%>
<script>
	alert("성공적으로 비밀번호를 변경하였습니다.");
	window.close();
</script>
<% 		 } else { %>
<script>
	alert("비밀번호 변경에 실패하였습니다.");
</script>
<%              }
	    }%>
<style>
   h2{margin-top: 5px;}
   /* 테이블 스타일 */
   table{
      margin:auto;
   }
   td {
      text-align:right;
   }
   #wrap{height:250px;padding : 20px;border: 3px solid rgb(196, 196, 196);}
   /* 버튼 관련 스타일 */
   *{box-sizing: border-box;}
   button:hover {background-color: white;color : black;}
   button{ background-color: black;color : white;border-radius : 7px;font-size:medium;width: 130px;height : 30px;}
   #Rwrap{height:250px; width: 400px; float: left; display: flex; flex-direction: column; align-content:center}
   #Rwrap div{display: flex; justify-content: center;  height:30px;}
   .join_title{margin: 5px 0 0px 0;flex-basis: 50%;display: inline;}
   .join_title ~input{flex-basis: 50%;}
   @font-face {
    font-family: 'MapoFlowerIsland';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
   font-family: 'MapoFlowerIsland';
}
</style>
</head>
<body>
<% if(u != null){ %>
	            <h2>비밀번호 변경</h2>
	            <div id="wrap">
		            <form name="usr_updateForm" id="update_user" method="POST"
	           		 action="<%= request.getContextPath() %>/member/updatePwd" onsubmit="return joinValidate();">
		        <input type="hidden" name="user_no" value="<%= u.getUserNo() %>">
	                <div id="Rwrap">
	                    <div>&nbsp;&nbsp;<h4 class='join_title'>현재 비밀번호 : </h4><input type="password" name="userPwd" id="userPwd" maxlength="16"></div>
<!-- 비밀번호 ajax로 확인해주기	                     -->
	                    <span id="userPwdresult">&nbsp;</span>
	                    <div>&nbsp;&nbsp;<h4 class='join_title'>새로운 비밀번호 : </h4><input type="password" name="newPwd" id="newPwd" maxlength="16"></div>
	                    <span id="pwdresult">&nbsp;</span>
	                    <div>&nbsp;&nbsp;<h4 class='join_title'>비밀번호 확인 : </h4><input type="password" name="newPwd2" id="newPwd2" maxlength="16"></div>
	                    <span id="pwd2result">&nbsp;</span>
		
						<div class="btns" align="center">
							<button id="updatePwdBtn">변경하기</button>
						</div>
	                </div>
	            </div>
	                
<!-- 호스트 회원 -->
<% }else if(h != null){ %>	                
				<h2><%= h.getHst_name() %> 님의 정보입니다.</h2>
				<div id="wrap">
		            <form name="usr_updateForm" id="update_host" method="POST"
	           		 action="<%= request.getContextPath() %>/member/updatePwd" onsubmit="return joinValidate();">
				<input type="hidden" name="user_no" value="<%= h.getHst_no() %>">
	                <div id="Rwrap">
	                    <div>&nbsp;&nbsp;<h4 class='join_title'>현재 비밀번호 : </h4><input type="password" name="userPwd" id="userPwd" maxlength="16"></div>
<!-- 비밀번호 ajax로 확인해주기	                     -->
	                    <span id="userPwdresult">&nbsp;</span>
	                    <div>&nbsp;&nbsp;<h4 class='join_title'>새로운 비밀번호 : </h4><input type="password" name="newPwd" id="newPwd" maxlength="16"></div>
	                    <span id="pwdresult">&nbsp;</span>
	                    <div>&nbsp;&nbsp;<h4 class='join_title'>비밀번호 확인 : </h4><input type="password" name="newPwd2" id="newPwd2" maxlength="16"></div>
	                    <span id="pwd2result">&nbsp;</span>
					<br><br>
					
					<div class="btns" align="center">
						<button id="updatePwdBtn">변경하기</button>
					</div>
	                </div>
				</div>
<%} %>	                    

		
		</form>
		<script>
		$(function(){
	         $("#newPwd").change(function () {   //pwd
		         var regpwd = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/;       // 영어대소문자,숫자,특수문자를 포함한 8자리~16자리
		         if (!regpwd.test($(this).val())) {
		             $("#pwdresult").html("영어대소문자,숫자,특수문자를 포함한 8자리~16자로 작성해주세요.").css("color", "red");
		         } else {
		             $("#pwdresult").html("사용 가능한 비밀번호 형식입니다.").css("color", "green");
		         }
        
    		});

	     $("#newPwd2").change(function () {
	         if ($("#pwd2").val() != $("#pwd").val()) {
	             $("#pwd2result").html("비밀번호가 일치하지 않습니다.").css("color", "red");
	         } else {
	             $("#pwd2result").html("비밀번호가 일치합니다.").css("color", "green");
	         }
   	 		});
		});
// 		function checkPwd(){
// 			const userPwd = document.getElementById('userPwd');
// 			const newPwd = document.getElementById('newPwd');
// 			const newPwd2 = document.getElementById('newPwd2');
			
// 			if(userPwd.value == ""||newPwd.value == "" || newPwd2.value == ""){
// 				alert("비밀번호를 입력해주세요.");
// 				return false;
// 			}
			
// 			if(newPwd.value != newPwd2.value){
// 				alert("비밀번호가 다릅니다.");
				
// 				newPwd2.select();
// 				return false;
// 			}
// 			return true;
// 		};
		
		
	     function joinValidate(){
				
	 			if(!(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,16}/.test($("#newPwd").val()))){
	 				alert('비밀번호는 영어대소문자,숫자,특수문자를 포함한 8자리~16자리로 설정해 주세요.');
	 				$("#newPwd").select();
	 				return false;
	 			}
	 			if($("#newPwd2").val() != $("#newPwd").val()){
	 				alert('비밀번호가 일치하지 않습니다.');
	 				$("#newPwd2").select();
	 				return false;
	 			}
				return true;
		};
		</script>
</body>
</html>
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
   
</style>
</head>
<body>

	            <h2>비밀번호 확인</h2>
	            <div id="wrap">
		            <form name="usr_updateForm" id="update_user" method="POST"
	           		 action="<%= request.getContextPath() %>/member/updatePwd" onsubmit="return joinValidate();">
		        <%-- <input type="hidden" name="user_no" value="<%= u.getUserNo() %>"> --%>
	                <div id="Rwrap">
	                    <div>&nbsp;&nbsp;<h4 class='join_title'>비밀번호 확인 : </h4><input type="password" name="newPwd2" id="newPwd2" maxlength="16"></div>
	                    <span id="pwd2result">&nbsp;</span>
		
						<div class="btns" align="center">
							<button id="updatePwdBtn">확인</button>
						</div>
	                </div>
	            </div>
		
		</form>
	
</body>
</html>
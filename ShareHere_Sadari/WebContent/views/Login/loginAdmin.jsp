<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String admPwd = (String)request.getAttribute("admPWd"); %>

<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
   h3 {
      text-align:center;
   }
   /* 테이블 스타일 */
   table{
      margin:auto;
   }
   td {
      text-align:right;
   }
   /* 버튼 관련 스타일 */
   button:hover {
      cursor:pointer
   }
   
   button {
      margin-top:5px;   
      width:110px;
      height:25px;
      color:white;
      background:lightblue;
      border:lightblue;
      border-radius:5px;
   }
</style>
</head>
<body>
	<h3>관리자등록</h3>
	<br>
	
	<form id="loginAdminForm" action="<%= request.getContextPath() %>/login/member" method="post" onsubmit="return goLogin();">
		<table>
			<tr>
				<td><lablel> 아이디 </lablel></td>
				<td width="50"></td>
				<td><input type="text" name="admId" id="admId" maxlength="15"></td>
			</tr>
			<tr>
				<td><lablel> 비밀번호</lablel></td>
				<td width="50"></td>
				<td><input type="password" name="admPwd" id="admPwd" maxlength="15"></td>
			</tr>
		</table>
		<br>
		<div class="btns" align="center">
			<button id="loginBtn">등록하기</button>
		</div>
	</form>
	
	<script>
		function goLogin(){
			const admId = document.getElementById('admId');
			const admPwd = document.getElementById('admPwd');
			//console.log(admId);
			//console.log(admPwd);
			
			if(admPwd.value == "" || admId.value == ""){
				alert("아이디 혹은 비밀번호를 입력해주세요.");
				return false;
			}
			
			return true;
			
		}
	</script>
</body>
</html>
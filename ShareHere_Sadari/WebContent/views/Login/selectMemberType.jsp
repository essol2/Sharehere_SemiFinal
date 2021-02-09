<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Login MemberType</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- navi css 경로 -->
	<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
	
    <style>
        *{box-sizing: border-box;font: 1rem "나눔 고딕",sans-serif}
        ol,li,ul{list-style-type: none;}
        a{text-decoration: none;}
		
        /* 헤더 */
        .header{
            width: 100%;
            height: 118px;
            text-align: center;
        }

        /* 섹션 */
        section{
        	height : auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        section .wrap{
            width : 600px;
            height : 450px;
        }
        /* 전체 페이지 설정 */
        .wrap{
            width: 100%;
            height: 1119px;
		
        } 
/*         버튼 속성 */
		.BtnWrap{display: flex; justify-content: space-between; align-items:center;}
/* 		.BtnWrap > button{margin-right:120px;}		 */
		.selecttypeBtn{width:250px; height:250px; background: black; color:white; border-radius : 10px; font-size: 38px}
        .selecttypeBtn:hover{background: white; color:black;}
        
        .footer{
            width : 100%;
            height : 238px;
            border: 1px black solid;
        }

        
    </style>
</head>
<body>
	<div class="header">
		<h1>
			<a href="<%=request.getContextPath()%>"> <img
				src="${pageContext.request.contextPath}/views/Login/image/nlogo.png"
				class="header_logo" alt="Sharehere_Logo">
			</a>
		</h1>
	</div>
	<section>
		<div class="wrap">
			<h2>회원가입 유형</h2>
			<br><br>
			<div class="BtnWrap">
				<button id="userType" class="selecttypeBtn">일반 회원</button>
				<button id="hostType" class="selecttypeBtn">호스트 회원</button>
			</div>
		</div>
	</section>
	<!-- footer -->
   <%@include file="/views/common/footer.jsp" %>
   <script>
   // 일반회원가입으로 이동
   const userType = document.getElementById("userType");
   userType.addEventListener("click", function(){
     location.href='<%= request.getContextPath()%>/views/Login/register_user.jsp';
  }); 
   const hostType = document.getElementById("hostType");
   hostType.addEventListener("click", function(){
     location.href='<%= request.getContextPath()%>/views/Login/register_hst.jsp';
  }); 
   
   
   </script>
</body>
</html>
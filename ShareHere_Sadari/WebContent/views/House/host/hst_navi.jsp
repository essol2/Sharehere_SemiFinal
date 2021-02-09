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
<title>HOST 전용 네비</title>
 <!-- font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
    
</head>
<body>
<nav class="navibar">
            <ul class="nav_menu">
                <li id="info">House 등록</li>
                <li id="confirm">House 확인</li>
            </ul>
            
            <hr class="line">

            <div class="nav_logo">
                <button id="navlogo" style="background-color: white; border: 0px;"><img src="${pageContext.request.contextPath}/views/common/img/naviLogo.png"></button>
            </div>

            <ul class="nav_buttons">
                <li><button type="button" onclick="location.href='#'" id="lgBtn">Register</button></li>
                <li><button type="button" onclick="location.href='#'" id="reBtn">Login</button></li>
            </ul>

            <a href="#" class="navibar_toggleBtn" style="width: 5%;">
                <img src="./main_img/bars-solid.svg" style="width: 100%;">
            </a>
    </nav>
    
    <script>
    
    // 로고 클릭시 hst_index.jsp로 이동
    const navlogo = document.getElementById("navlogo");
    navlogo.addEventListener("click", function() {
		location.href='<%= request.getContextPath()%>/views/House/host/hst_index.jsp';
	});
    
    // info 페이지 이동
    const infoBtn = document.getElementById("info");
    infoBtn.addEventListener("click", function(){
    	location.href='<%= request.getContextPath()%>/views/House/host/hst_pay.jsp ';
    });
    
    // confirm페이지 이동
    const confirmBtn = document.getElementById("confirm");
    confirmBtn.addEventListener("click", function(){
    	location.href='<%= request.getContextPath()%>/views/House/host/hst_confirm.jsp ';
    });
    
    </script>
</body>
</html>
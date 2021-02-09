<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<!-- 경고 알람 띄우기 -->
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>Welcome to the ShareHere</title>
<!-- navi css 경로 -->
<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/navi.jsp" %>
   
   <%@include file="/views/common/main.jsp" %>
   
   <!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp" %>
   
</body>
</html>
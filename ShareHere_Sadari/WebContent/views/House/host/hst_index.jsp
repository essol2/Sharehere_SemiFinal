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
<title>HOST 전용 페이지</title>
 <!-- navi css 경로 -->
<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!--  페이지를 이동해도 Host_navi는 계속 상단에 노출되게끔 -->
   <%@include file="/views/House/host/hst_navi.jsp" %>

	<div>
		<img src="${pageContext.request.contextPath}/views/common/img/searchImg.jpeg" style="width:100%">
	</div>

	<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp" %>
</body>
</html>
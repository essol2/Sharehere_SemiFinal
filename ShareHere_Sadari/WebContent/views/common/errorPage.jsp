<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String message = (String) request.getAttribute("msg");
%>
<!doctype html>
<html lang="en">
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- navi css 경로 -->
<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<style>

	body {
		text-align: center;
	}

</style>
<title>error!</title>
</head>
<body>

	<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/navi.jsp"%>
	<br>
	<br>
	<div class="alert alert-dark"
		style="height: 365px; width: 80%; margin: auto;" role="alert">
		<br>
		<h1 class="alert-heading">Error!</h1>
		<br>
		<h1 align="center"><%=message%></h1>
		<br>
		<hr>
		<div align="center">
			<button onclick="location.href='<%=request.getContextPath()%>'"
				class="btn btn-warning"
				style="background-color: black; border-color: black; color: white; margin-top: 2%;">
				HOME으로 돌아가기</button>
		</div>
	</div>
	<br>
	<br>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->

	<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>
</body>
</html>


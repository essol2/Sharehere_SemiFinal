<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Tutorial: real-time presence counter</title>
<!-- 글씨체 -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- css 경로 -->
<link href="./hst_info.css" rel="stylesheet" type="text/css">
<!-- navi css 경로 -->
<link
	href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/navi.jsp"%>
	
	<h1>Real-time presence counter</h1>
	<div id="counter"
		style="color: #39aae1; font-size: 3rem; font-weight: bold">-</div>
	<div>This is the number of people who are viewing this page right
		now!</div>
	<p>
		<b>Context:</b><br> <span id="context"
			style="color: #39aae1; font-size: 1.2rem"></span>
	</p>

	<script>
		function subscribeCounter() {
			const counterEl = document.getElementById('counter');

			now4real.subscribe('COUNTER_PAGE_VIEWERS', function(counterUpdate) {
				let updatedValue = counterUpdate.data.value;
				counterEl.innerText = updatedValue;
			});
		}

		function showContext() {
			let context = now4real.siteContext + now4real.pageContext;
			document.getElementById('context').innerText = context;
		}

		window.now4real = window.now4real || {};
		now4real.config = {
			target : 'api+widget'
		};
		now4real.onload = function() {
			console.log('Now4real loaded');
			subscribeCounter();
			showContext();
		};
		(function() {
			var n4r = document.createElement('script');
			n4r.type = 'text/javascript';
			n4r.async = true;
			n4r.src = 'https://cdn.now4real.com/now4real.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(n4r, s);
		})();
	</script>
	
	<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>
</body>
</html>
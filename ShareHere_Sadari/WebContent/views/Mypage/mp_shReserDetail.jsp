<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mypage.model.vo.ShUserResDetail"%>
<%
	User u = (User)session.getAttribute("loginUser");
	ShUserResDetail shusdetail = (ShUserResDetail)request.getAttribute("shusdetail");
%>
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<!-- navi css 경로 -->
<link href="<%= request.getContextPath() %>/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">
<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<title>방 예약 세부 페이지</title>
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
#reser {
	padding: 2%;
}

*{
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
}

</style>
</head>
<body>

	<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/navi.jsp"%>
	
	<% if(loginUser != null){ %>
	<div class="container" id="reser">
	  <div class="row">
	    <div class="col-6">
	    	<div class="houseimagesection">
        		<img style="width: 600px; height: 400px;" src="<%= request.getContextPath()%><%= shusdetail.getShIpath() %><%= shusdetail.getShChname() %>"
        		class="roomimage" alt="방이미지영역">
        	</div>
	    </div>
	    <div class="col-5" style="padding-left:2%;">
	    	<h1><%= shusdetail.getShTitle() %></h1>
	    	<br>
	    	<h5>
	    		<img alt="지도" style="width:30px;" src="https://cdn.iconscout.com/icon/free/png-64/location-1912221-1617690.png">
	    		서울시 용산구 소월로2길 5
	    	</h5>
	    	<!-- 이미지 지도를 표시할 div 입니다 -->
			<div id="map" style="width:600px;height:250px;"></div>
	    </div>
	    <div>
	    		<br>
				<div class="hst_table">
					<h2>Host 정보</h2>
					<table class="table">
						<thead>
							<tr class="table-dark">
								<th scope="col">사업자번호</th>
								<th scope="col">상호명</th>
								<th scope="col">호스트 이름</th>
								<th scope="col">이메일</th>
								<th scope="col">전화번호</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%= shusdetail.getHstBsNo() %></td>
								<td><%= shusdetail.getHstBsName() %></td>
								<td><%= shusdetail.getHstName() %></td>
								<td><%= shusdetail.getHstEmail() %></td>
								<td><%= shusdetail.getHstPhone() %></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
	  </div>
	</div>
	<% } %>
	<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a48a450831988c6babadada9c0aed59&libraries=services&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(<%= shusdetail.getShLa() %>, <%= shusdetail.getShLo() %>), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(<%= shusdetail.getShLa() %>, <%= shusdetail.getShLo() %>); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	
    const deleteBtn = document.getElementById('deleteBtn');
    deleteBtn.addEventListener('click', function(){
       location.href="<%= request.getContextPath() %>/views/Mypage/mp_delete.jsp";
    });
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	</script>
</body>
</html>
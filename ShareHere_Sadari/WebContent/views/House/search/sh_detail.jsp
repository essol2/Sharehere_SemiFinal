<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="house.model.vo.*, java.util.ArrayList"%>
<%
	HostInfo info = (HostInfo)request.getAttribute("info");
	ArrayList<HostPhoto> photo = (ArrayList<HostPhoto>)request.getAttribute("photo");
	ArrayList<HostRoom> room = (ArrayList<HostRoom>)request.getAttribute("room");
	
	// 시설 및 서비스
	// 개인공간
	String[] pers = new String[4];
	if(info.getShPers() != null)
		pers = info.getShPers().split(",");
	
	// 공용공간
	String[] coms = new String[4];
	if(info.getShComs() != null)
		coms = info.getShComs().split(",");
	
	//서비스
	String[] ss = new String[4];
	if(info.getShSs() != null)
		ss = info.getShSs().split(",");
	
	// 주소
	String[] address = new String[2];
	String addDetail = "";
	if(info.getShAddress() != null){
		address = info.getShAddress().split(",");	
	}
	
	//[정보]
		// 은행
		String[] bank = new String[4];
		if(info.getShBank() != null)
			bank = info.getShBank().split(",");
		// 마트
		String[] mart = new String[4];
		if(info.getShMart() != null)
			mart = info.getShMart().split(",");
		// 약국
		String[] par = new String[4];
		if(info.getShParmacy() != null)
			par = info.getShParmacy().split(",");
		// 지하철
		String[] sub = new String[4];
		if(info.getShSubway() != null)
			sub = info.getShSubway().split(",");
		// 카페
		String[] cafe = new String[4];
		if(info.getShCafe() != null)
			cafe = info.getShCafe().split(",");
		// 편의점
		String[] con = new String[4];
		if(info.getShStore() != null)
			con = info.getShStore().split(",");
	
	// 방 정보 사진
	// arrayList로 뽑아서 객체에 넣기
	ArrayList<HostPhoto> photoRoom = new ArrayList<>();	
	for(int pr = 0; pr < photo.size(); pr++){
		HostPhoto pRoom = new HostPhoto();
		if(photo.get(pr).getShItype().equals("RI")) {
			pRoom.setShI(photo.get(pr).getShI()); //사진 번호
			pRoom.setShIname(photo.get(pr).getShIname()); // 사진 이름
			pRoom.setShIpath(photo.get(pr).getShIpath()); // 사진 경로
			pRoom.setShItype(photo.get(pr).getShItype()); // 사진 타입
			pRoom.setShNo(photo.get(pr).getShNo()); // 하우스 번호
			pRoom.setShChName(photo.get(pr).getShChName());  // 변경된 사진 이름
			
			photoRoom.add(pRoom);

		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>검색 세부 페이지</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- css 경로 -->
<link href="<%= request.getContextPath() %>/views/House/search/sh_detail.css" rel="stylesheet" type="text/css">
<!-- navi css 경로 -->
<link href="<%= request.getContextPath() %>/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">
	
<style>
/*kakao 지도 */
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

/*글씨체*/
@font-face {
    font-family: 'MapoFlowerIsland';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.intro > pre, .imgBtn{
	font-family: 'MapoFlowerIsland';
}
#hs_navi{
	background-color: white;
}
 /* 두 번째 섹션 */
	#reportForm{
	text-align : center;
	border : 5px double black;
	width : 100%;
	}
/* 신고내용 textarea */
       #reportcontent {
           width : 90%;
           height : 150px;
           resize: none;
       }
       
/* 버튼 영역 */
.btnArea {
text-align:center;
  }
     
/* 신고하기 버튼*/
#report {
   background-color: black;
   color : white; 
   border-radius: 5px 5px 5px 5px;
}
/* 취소하기 버튼 */
#cancel {
	  background-color: black;
   color : white; 
   border-radius: 5px 5px 5px 5px;
} 


/* 버튼 */
.imgBtn:hover{
	background: black;
	color: white;
}
/* 하우스 메뉴바 */
#hs_navi {
	margin-top: 1%;
	border-top: 3px double black;
	border-bottom: 3px double black;
	color: black;
	width: 100%;
	float: left;
}
#hs_navi>ul>li {
	float: left;
	padding: 1% 7% 1% 7%;
	text-align: center;
	font-size: 16px;
}
.address{
	margin-top: 40px;
	margin-bottom: 0px;
	font-size: 20px;
}
/* 방 정보 */
.roomInfo{
    padding: 0px;
}
.mb-3 {
	float: left;
	width: 50%;
}

#possible {
	background-color: rgb(14, 92, 18);
	font-family: 'MapoFlowerIsland';
	color: white;
	margin-top: 5%;
	margin-right: 5%;
	padding: 10px 35px 10px 35px;
	border-radius: 5px 5px 5px 5px;
	border: 0px;
	float: right;
	font-size: 13px;
}

#impossible {
	background-color: rgb(119, 13, 13);
	font-family: 'MapoFlowerIsland';
	color: white;
	margin-top: 5%;
	margin-right: 5%;
	padding: 10px 35px 10px 35px;
	border-radius: 5px 5px 5px 5px;
	border: 0px;
	float: right;
	font-size: 13px;
}

#roomImg {
	width: 300px;
	height: 250px;
}
#rText ul{
	list-style: none;
    padding-left: 0px;
}
#rText li{
	margin-top: 2%;
}

#rText{
	float: left;
	margin: 0px;
	padding-right: 5%;
	font-size: 17px;
}

#rText b {
	font-size: 15px;
	font-weight: bold;
	color: rgb(92, 91, 91);
	padding: 0px;
}

/* 시설 및 서비스 */
.ss{
    text-align: center;
    width: 100%;
}
.ss ul{
	padding-left: 0px;
	list-style:none;
}
.ss td{
    border-left: 1px solid gray;
    border-right: 1px solid gray;
}

/* 정보 */
.informTB{
	margin-top: 5%;
  text-align: center;
  margin: 0 auto;
}
.informTB  img {
	display: block;
	margin: 0 auto;
	width: 40px;
}
.informTB ul{
	padding-left: 0px;
	list-style:none;
}
.informTB  li {
	font-size: 15px;
	padding-top: 10%;
}
.informTB th, .informTB td{
	width: 170px;
	text-align: center;
}
</style>
</head>
<body>
	<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/navi.jsp"%>	
	<section id="detail">
	<form id="shnoForm" method="GET">
		<input type="hidden" name="shNo" id="shNo" value="<%= info.getShNo() %>">
	</form>
		<!-- 이미지 버튼 -->
		<div class="imgButtons">
			<button class="imgBtn ceo">대표사진</button>
			<button class="imgBtn public">공용시설</button>
			<button class="imgBtn room">방사진</button>
			<button class="imgBtn amenities">편의시설</button>
			<button class="imgBtn etc">기타</button>
		</div>	
		<!-- carousel slide-->
		<div id="carouselExampleDark" class="carousel carousel-dark slide"
			data-bs-ride="carousel">
			<ol class="carousel-indicators">
			<% for(int s = 0; s < photo.size(); s++) { %>
				<% if(photo.get(s).getShItype().equals("T")) { %>
					<li data-bs-target="#carouselExampleDark" data-bs-slide-to="<%= s%>" class="active"></li>
				<% } %>	
			<% } %>
			<% for(int s = 0; s < photo.size(); s++) { %>
				<li data-bs-target="#carouselExampleDark" data-bs-slide-to="<%= s%>" ></li>
			<% } %>
			</ol>
			<div class="carousel-inner">
				<!-- 슬라이드 쇼 -->
				<% for(int s = 0; s < photo.size(); s++) { %>
					<% if(photo.get(s).getShItype().equals("T")) { %>
				<div class="carousel-item active" data-bs-interval="10000">
					<!--가로 사진-->
					<img
						src="<%= request.getContextPath()%><%= photo.get(s).getShIpath() %><%= photo.get(s).getShChName() %>"
						class="d-block w-100" alt="...">
				</div>
				<% } %>	
					<% } %>	
				<% for(int s = 0; s < photo.size(); s++) { %>
				<div class="carousel-item" data-bs-interval="2000">
					<img
						src="<%= request.getContextPath()%><%= photo.get(s).getShIpath() %><%= photo.get(s).getShChName() %>"
						class="d-block w-100" alt="...">
				</div>
				<% } %>	
			</div>
			<!-- / 슬라이드 쇼 끝 -->

			<!-- 왼쪽 오른쪽 화살표 버튼 -->
			<a class="carousel-control-prev" href="#carouselExampleDark"
				role="button" data-bs-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleDark"
				role="button" data-bs-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
			</a>
			<!-- / 화살표 버튼 끝 -->
		</div>
	
		<!-- 하우스 이름 -->
		<div class="house name">
			<span class="w1">
				<h1><%= info.getShTitle() %></h1>
			</span>
			<!-- 매물 신고하기  -->
			<span class="w1">
				<button type="button" data-bs-toggle="modal" data-bs-target="#reportModal" data-bs-whatever="@mdo" id="siren">
					<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/OOjs_UI_icon_alert-yellow.svg/1024px-OOjs_UI_icon_alert-yellow.svg.png"
					alt="" width="30px">
				</button>
			</span>
			<!-- 예약하기 버튼 -->
			<span class="w1" id="reserva">
				<button id="reserBtn">예약하기</button>
			</span>
		</div>

		<!-- 상세 메뉴바 -->
		<div class="house menu">
			<nav id="hs_navi">
				<ul>
					<li>하우스 소개</li>
					<li>방 정보</li>
					<li>시설 및 서비스</li>
					<li>위치</li>
					<li>정보</li>
				</ul>
			</nav>
		</div>

		<!-- 하우스 소개 -->
		<div class="house type">
			<table id="htypeTB" style="margin-left: 0;">
			<tbody>
				<tr>
					<th>주택유형</th>
					<th>건물면적</th>
					<th>주택구조</th>
					<th>운영층수</th>
				</tr>

				<tr>
					<td><%= info.getShType() %></td>
					<td><%= info.getShArea() %>m²</td>
					<td><%= info.getShStr() %></td>
					<td><%= info.getShFloor() %></td>
				</tr>
			</tbody>	
			</table>
		</div>
		<div class="house intro">
			<hr>
			<pre style="padding-left: 5%"><%= info.getShIntro() %></pre>
		</div>

		<!-- 방 정보 -->
		<div class="house roomInfo">
			<hr>
			<div class="row row-cols-1 row-cols-md-2 g-4">
			<% for(int r = 0; r < room.size(); r++) { %>
	    <div class="col-md-6">
	      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	        <div class="col p-4 d-flex flex-column position-static">
	        <h4><%= room.get(r).getShRtype() %>(<%= room.get(r).getShGender() %>)</h4>
							<hr>
							<div id="rText">
								<ul>
									<li>타입  : <b><%= room.get(r).getShRtype() %></b></li>
									<li>성별  : <b><%= room.get(r).getShGender() %></b></li>
									<li>면적  : <b><%= room.get(r).getShRarea() %></b></li>
									<li>보증금  : <b><%= room.get(r).getShDeposit() %></b></li>
									<li>관리비  : <b><%= room.get(r).getShAdmcost() %></b></li>
									<li>월세  : <b><%= room.get(r).getShMonthly() %></b></li>
									<li>입주 가능일 : <b><%= room.get(r).getShRdate() %></b></li>
								</ul>
						</div>
		        </div>
		        <div class="col-auto d-none d-lg-block">
		         <% if (room.get(r).getShCapacity() > 0) { %>
					<button id="possible">입주 가능</button>
					<% } else { %>
					<button id="impossible">입주 불가능</button>
					<% } %>
					<br><br><br>
					<img style="width:300px; height:250px;" src="<%= request.getContextPath()%><%= photoRoom.get(r).getShIpath()  %><%= photoRoom.get(r).getShChName() %>" class="card-img-top" alt="방<%= r%>">
		
		        </div>
		      </div>
		    </div>
	    	<% } %>
	  </div>
		</div>

		<!-- 시설 및 서비스 -->
		<div class="house service">
			<hr>
			<br>
			<div class="container">
			  <div class="row">
			    <div class="col-sm">
			      <table class="ss">
				<tr>
					<th><h5>[개인공간]</h5></th>
					<th><h5>[공용공간]</h5></th>
					<th><h5>[ 서비스 ]</h5></th>
				</tr>

				<tr>
					<td id="serviceP">
						<ul>
							<% for(int pe = 0; pe < pers.length; pe++) { %>
	                    		<li><%= pers[pe] %></li>
	                		<% } %>
						</ul>
					</td>
					<td id="serviceC">
						<ul>
						<% for(int com = 0; com < coms.length; com++) { %>
                    		<li><%= coms[com] %></li>
               			 <% } %>
						</ul>
					</td>
					<td id="serviceS">
						<ul>
						<% for(int s = 0; s < ss.length; s++) { %>
                    		<li><%= ss[s] %></li>
                		<% } %>
						</ul>
					</td>
				</tr>
			</table>
			    </div>
			  </div>
			</div>
		</div>

		<!-- 주소 -->
		<div class="house address">
			<hr>
			<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		    <ul id="category">
		        <li id="BK9" data-order="0"> 
		            <span class="category_bg bank"></span>
		            은행
		        </li>       
		        <li id="MT1" data-order="1"> 
		            <span class="category_bg mart"></span>
		            마트
		        </li>  
		        <li id="PM9" data-order="2"> 
		            <span class="category_bg pharmacy"></span>
		            약국
		        </li>   
		        <li id="CE7" data-order="4"> 
		            <span class="category_bg cafe"></span>
		            카페
		        </li>  
		        <li id="CS2" data-order="5"> 
		            <span class="category_bg store"></span>
		            편의점
		        </li>      
		    </ul>
		</div>
		
		
		
		
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a48a450831988c6babadada9c0aed59&libraries=services"></script>
		<script>
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		    markers = [], // 마커를 담을 배열입니다
		    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		 
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
				center: new kakao.maps.LatLng(37.554976038762724, 126.9783444142847), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//
		// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			var address = 	"<%= address[0] %>";
		
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%= info.getShTitle() %></div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		//
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map); 
		
		// 지도에 idle 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', searchPlaces);
		
		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';
		
		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
		
		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);  
		
		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();
		
		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
		    if (target.addEventListener) {
		        target.addEventListener(type, callback);
		    } else {
		        target.attachEvent('on' + type, callback);
		    }
		}
		
		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
		    if (!currCategory) {
		        return;
		    }
		    
		    // 커스텀 오버레이를 숨깁니다 
		    placeOverlay.setMap(null);
		
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
		}
		
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
		        displayPlaces(data);
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
		    	console.log("검색결과 없음");
		
		    } else if (status === kakao.maps.services.Status.ERROR) {
		        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
		        console.log("에러");
		        
		    }
		}
		
		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {
		
		    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		    var order = document.getElementById(currCategory).getAttribute('data-order');
		
		    
		
		    for ( var i=0; i<places.length; i++ ) {
		
		            // 마커를 생성하고 지도에 표시합니다
		            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
		
		            // 마커와 검색결과 항목을 클릭 했을 때
		            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
		            (function(marker, place) {
		                kakao.maps.event.addListener(marker, 'click', function() {
		                    displayPlaceInfo(place);
		                });
		            })(marker, places[i]);
		    }
		}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
		
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
		
		    return marker;
		}
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo (place) {
		    var content = '<div class="placeinfo">' +
		                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
		
		    if (place.road_address_name) {
		        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
		                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
		    }  else {
		        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
		    }                
		   
		    content += '    <span class="tel">' + place.phone + '</span>' + 
		                '</div>' + 
		                '<div class="after"></div>';
		
		    contentNode.innerHTML = content;
		    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		    placeOverlay.setMap(map);  
		}
		
		
		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
		    var category = document.getElementById('category'),
		        children = category.children;
		
		    for (var i=0; i<children.length; i++) {
		        children[i].onclick = onClickCategory;
		    }
		}
		
		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
		    var id = this.id,
		        className = this.className;
		
		    placeOverlay.setMap(null);
		
		    if (className === 'on') {
		        currCategory = '';
		        changeCategoryClass();
		        removeMarker();
		    } else {
		        currCategory = id;
		        changeCategoryClass(this);
		        searchPlaces();
		    }
		}
		
		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
		    var category = document.getElementById('category'),
		        children = category.children,
		        i;
		
		    for ( i=0; i<children.length; i++ ) {
		        children[i].className = '';
		    }
		
		    if (el) {
		        el.className = 'on';
		    } 
		} 
		</script>
                <div class="address">
                	<img src="https://cdn.iconscout.com/icon/free/png-64/map-917-434076.png" alt="address" width="40px">
                    	<%= address[0] %> <%= address[1] %>
                </div>
		</div>

		<!-- 정보 -->
		<div class="house inform">
			<hr>			
			<table class="informTB">
			<tbody>
			<tr>
					<th><img
						src="https://cdn.iconscout.com/icon/free/png-64/atm-1780467-1517557.png"
						alt="bank"> 은행</th>
					<th><img
						src="https://cdn.iconscout.com/icon/free/png-64/mall-1780507-1517597.png"
						alt="mart"> 마트</th>
					<th><img
						src="https://cdn.iconscout.com/icon/free/png-64/pharmacy-1780503-1517593.png"
						alt="pharmacy"> 약국</th>
					<th><img
						src="https://cdn.iconscout.com/icon/free/png-64/ev-station-1780529-1517619.png"
						alt="oil"> 주유소</th>
					<th><img
						src="https://cdn.iconscout.com/icon/free/png-64/local-cafe-1780519-1517609.png"
						alt="cafe"> 카페</th>
					<th><img
						src="https://cdn.iconscout.com/icon/free/png-64/convenience-store-1780517-1517607.png"
						alt="convenienceStore"> 편의점</th>
				</tr>
				<tr>
					<td>
						<ul>
						<% for(int b = 0; b < bank.length; b++) { %>
                        	<li><%= bank[b]%></li>
                    	<% } %>
						</ul>
					</td>

					<td>
						<ul>
							<% for(int m = 0; m < mart.length; m++) { %>
								<li><%= mart[m]%></li>
                    		<% } %>	
						</ul>
					</td>

					<td>
						<ul>
							<% for(int p = 0; p < par.length; p++) { %>
                       			<li><%= par[p]%></li>
                    		<% } %>
						</ul>
					</td>

					<td>
						<ul>
							<% for(int s = 0; s < sub.length; s++) { %>
								<li><%=sub[s]%></li>
                    		<% } %>
						</ul>
					</td>

					<td>
						<ul>
							<% for(int c = 0; c < cafe.length; c++) { %>
                        		<li><%= cafe[c]%></li>
                    		<% } %>
						</ul>
					</td>

					<td>
						<ul>
							<% for(int c = 0; c < con.length; c++) { %>
                        		<li><%= con[c] %></li>
                    		<% } %>
						</ul>
					</td>
				</tr>
			</tbody>
				
			</table>
		</div>
	</section>
 <%@include file="/views/common/footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
		
 
        <script>
       // 신고하기 버튼 이벤트
          const reportBtn = document.getElementById('siren');
        reportBtn.addEventListener('click', function(){
           var shNo = $("#shNo").val();
           <% if(loginUser != null) { %>
           function validate(){
   			// 신고사유, 신고내용 중 입력 되지 않은 값이 있을 시 alert 후 focus 처리 -> submit X
   			if($("#reason").val().trim().length == 0){
   				alert('신고사유를 선택해 주세요.');
   				$("#reason").focus();
   				return false;
   			}
   			
   			if($("#reportcontent").val().trim().length == 0){
   				alert('신고내용을 작성해 주세요.');
   				$("#reportcontent").focus();
   				return false;
   			}
   			return true;
   		}
           
           <% } else { %>
           alert('로그인이 필요한 서비스입니다.로그인을해주세요');
           location.href="<%= request.getContextPath()%>/views/Login/login_Nnavi.jsp";
           <% } %>
        });
        
        
        // 예약하기 버튼 이벤트
        const reservationBtn = document.getElementById('reserBtn');
        reservationBtn.addEventListener('click', function(){
           var shNo = $("#shNo").val();
           <% if(loginUser != null) { %>
           location.href="<%= request.getContextPath()%>/select/reservation?shNo="+shNo;
           <% } else { %>
           alert('로그인이 필요한 서비스입니다.로그인을해주세요');
           location.href="<%= request.getContextPath()%>/views/Login/login_Nnavi.jsp";
         <% } %>
        });
        
        // 입주가능 버튼 이벤트
        const possibleBtn = document.getElementById('possible');
        possibleBtn.addEventListener('click', function(){
           var shNo = $("#shNo").val();
           <% if(loginUser != null) { %>
           location.href="<%= request.getContextPath()%>/select/reservation?shNo="+shNo;
           <% } else { %>
           alert('로그인이 필요한 서비스입니다.로그인을해주세요');
           location.href="<%= request.getContextPath()%>/views/Login/login_Nnavi.jsp";
           <% } %>
        });
        
        // 입주불가능 버튼 이벤트
        const impossibleBtn = document.getElementById('impossible');
        impossibleBtn.addEventListener('click', function(){
           var shNo = $("#shNo").val();
           <% if(loginUser != null) { %>
           location.href="<%= request.getContextPath()%>/select/reservation?shNo="+shNo;
           <% } else { %>
           alert('로그인이 필요한 서비스입니다.로그인을해주세요');
           location.href="<%= request.getContextPath()%>/views/Login/login_Nnavi.jsp";
           <% } %>
           
        });
        
        </script>
        
        <!-- report 모달 -->
        <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" id="reportForm">
		        <form action="<%= request.getContextPath() %>/insert/report" method="post" onsubmit="return validate();">
		        <img src="${pageContext.request.contextPath}/views/common/img/naviLogo.png">
		        	<input type="hidden" name="shNo" id="shNo" value="<%= info.getShNo() %>">
		          <h2> 매물 신고 사유</h2>
			        <br>
			        <select id="reason" name="rreason" required>
			            <option value="허위/과장된 가격 정보를 가진 매물">허위/ 과장된 가격 정보를 가진 매물</option>
			            <option value="거래가 완료되어 존재하지 않는 매물">거래가 완료되어 존재하지 않는 매물</option>
			            <option value="경매 의심매물">경매 의심 매물</option>
			            <option value="기타 사유로 정보가 부정확한 매물">기타 사유로 정보가 부정확한 매물</option>
			        </select>
			      
			    <br><br><br>
			    <h2> 신고 내용</h2>
			    <br>
			    <textarea  id="reportcontent" name="rcontent" placeholder="신고사유에 대한 구체적인 내용을 작성해 주세요." required></textarea>
		      </div>
		      <div class="modal-footer" style="margin: 0 auto;">
		         <button id="report" type="submit">신고하기</button>
    			 <button id="cancel" type="button" data-bs-dismiss="modal">취소하기</button>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
        
        <!-- 예약모달 -->
        
        
        


	<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
	
</body>
</html>
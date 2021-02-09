<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, mypage.model.vo.PageInfo, mypage.model.vo.ShUserReservation, mypage.model.vo.HstReservation"%>
<%
	User u = (User)session.getAttribute("loginUser");
	Host h = (Host)session.getAttribute("loginHost");
	ArrayList<ShUserReservation> shUsRes = (ArrayList<ShUserReservation>)request.getAttribute("shUserRes");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<HstReservation> hstRes = (ArrayList<HstReservation>)request.getAttribute("hstRes");
	PageInfo ph = (PageInfo)request.getAttribute("ph");
	
	System.out.println("pi : " + pi);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약마이페이지</title>

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<!-- navi css 경로 -->
<link
	href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">

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

.nav-link {
	color: gray;
}

.nav-link:hover {
	color: black;
}

.hst_table {
	padding: 5% 10% 5% 10%;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	height: 500px;
}

.Btn{
	background-color: white;
	border: 0px;
	border-radius: 30%;
}
.Btn img{
	width: 30px;
}
.Btn:hover{
	background-color: lightgray;
}

#bottomNav {
	margin-left: 44%;
	margin-right: auto;
}

#numCss {
	color: black;
}

#numCss:hover {
	background-color: gray;
	color: white;
}

#forCss {
	background-color: black;
	color: white;
}

#forCss:hover {
	background-color: gray;
	color: white;
}
</style>

</head>
<body>

	<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/navi.jsp"%>
	
	<% if(loginUser != null){ %>
	<input type="hidden" name="user_no" value="<%= u.getUserNo() %>">
<!-- 상단탭메뉴 -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link"
			href="<%= request.getContextPath() %>/views/Mypage/mp_update.jsp">회원
				정보 수정</a></li>
		<li class="nav-item"><a class="nav-link active"
			aria-current="page"
			href="<%= request.getContextPath() %>/Mypage/User/ReservationList">예약한
				방 정보</a></li>

		<li class="nav-item"><a class="nav-link"
			href="<%= request.getContextPath() %>/pay/list">결제내역
				확인</a></li>
		<li class="nav-item"><a id="deleteBtn" class="nav-link" href="#">회원탈퇴</a>
		</li>
	</ul>
<!-- 하단 내용 -->
<div class="hst_table">
		<h2>예약한방 정보</h2>
		<table class="table">
			<thead>
				<tr class="table-dark">
					<th scope="col">#</th>
					<th scope="col">예약 번호</th>
					<th scope="col">Room Name</th>
					<th scope="col">성별</th>
					<th scope="col">타입</th>
					<th scope="col">면적</th>
					<th scope="col">보증금</th>
					<th scope="col">월세</th>
					<th scope="col">희망거주기간</th>
					<th scope="col">집 보러 갈 날짜</th>
					<th scope="col">예약한 날짜</th>
					<th scope="col">더 자세히 보기</th>
					<th scope="col">예약취소하기</th>
				</tr>
			</thead>
			<tbody>
			<% if(shUsRes != null && !shUsRes.isEmpty()){ %>
               <% for(int ur = 0; ur < shUsRes.size(); ur++) { %>
				<tr>
					<th scope="row"><%= pi.getListCount()-(pi.getListCount()-(pi.getObjectLimit()*(pi.getCurrentPage()-1)))+(ur+1) %></th>
					<td>
                    <%= shUsRes.get(ur).getShRVNo() %>
		
                     </td>
					<td><%= shUsRes.get(ur).getShRname() %></td>
					<td><%= shUsRes.get(ur).getShGender() %></td>
					<td><%= shUsRes.get(ur).getShRtype() %></td>
					<td><%= shUsRes.get(ur).getShRarea() %></td>
					<td><%= shUsRes.get(ur).getShDeposit() %></td>
					<td><%= shUsRes.get(ur).getShMonthly() %></td>
					<td><%= shUsRes.get(ur).getShRVPeriod() %></td>
					<td><%= shUsRes.get(ur).getShRDate() %></td>
					<td><%= shUsRes.get(ur).getShRVtd() %></td>
					<td>
						<button id="detailBtn<%=ur %>" class="Btn">
							<img
								src="https://cdn.iconscout.com/icon/free/png-64/sign-out-2694321-2236317.png"
								alt="detail">
						</button>
					</td>
					<td>
						<button id="deleteBtn<%= ur %>" class="Btn">
							<img
								src="https://cdn.iconscout.com/icon/free/png-64/delete-1912233-1617702.png"
								alt="delete">
						</button>
					</td>
				</tr>
				 <% } %>
                   <% } else { %>
               	<tr>
                  	<td colspan="13" style="text-align:center;">예약된 정보가 없습니다.</td>
               	</tr>
               	<% } %>
			</tbody>
		</table>
	</div>
	
	<!-- 페이징 처리 부트스트랩 -->
	<nav aria-label="Page navigation example" id="bottomNav">
		<ul class="pagination">
			<!-- 처음으로(<<) -->
			<li class="page-item">
			<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/Mypage/User/ReservationList?currentPage=1'"
				aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❮❮</span>
			</button>
			</li>
			<!-- 이전으로 (<) -->
			<% if(pi.getCurrentPage() == 1) { %>
			<li class="page-item">
			<button class="page-link" disabled aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❮</span>
			</button>
			<% } else { %>
			<li class="page-item">
			<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/Mypage/User/ReservationList?currentPage=<%= pi.getCurrentPage() - 1 %>'"
				aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❮</span>
			</button>
			</li>
			<% } %>
			<!-- 페이지 목록 -->
			 <% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
				<% if(p == pi.getCurrentPage()) { %>
				<li class="page-item">
					<button class="page-link" id="numCss" disabled><%= p %></button>
				</li>
				<% } else { %>
				<li class="page-item">
					<button class="page-link" id="numCss" onclick="location.href='<%= request.getContextPath() %>/Mypage/User/ReservationList?currentPage=<%=p %>'"><%= p %></button>
				</li>
				<% } %>
			<% } %>
			
			<!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
			<li class="page-item">
			<button class="page-link" disabled
				aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❯</span>
			</button></li>
			<% } else { %>
				<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/Mypage/User/ReservationList?currentPage=<%= pi.getCurrentPage() + 1 %>'" aria-label="Previous" id="forCss"> 
					<span aria-hidden="true" style="font-size: 10px;">❯</span>
				</button>
				</li>
			<% } %>
			<!-- 맨 끝으로(>>) -->
			<li class="page-item">
			<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/Mypage/User/ReservationList?currentPage=<%= pi.getMaxPage()%>'"
				aria-label="Next" id="forCss"> <span aria-hidden="true" style="font-size: 10px;">❯❯</span>
			</button></li>
		</ul>
	</nav>
	<% }else{ %>
	<input type="hidden" name="user_no" value="<%= h.getHst_no() %>">
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link"
			href="<%= request.getContextPath() %>/views/Mypage/mp_update.jsp">회원
				정보 수정</a></li>
		<li class="nav-item"><a class="nav-link active"
			aria-current="page"
			href="<%= request.getContextPath() %>/hst/reservationList">예약한
				입주민 정보</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<%= request.getContextPath() %>/Mypage/hstPay">결제내역
				확인</a></li>
		<li class="nav-item"><a class="nav-link" id="deleteBtn" href="#">회원탈퇴</a>
		</li>
	</ul>
	
	<div class="hst_table">
		<h2>예약한 입주민 정보</h2>
		<table class="table">
			<thead>
				<tr class="table-dark">
					<th scope="col">#</th>
					<th scope="col">예약한 사람 이름</th>
					<th scope="col">이메일</th>
					<th scope="col">전화번호</th>
					<th scope="col">희망거주기간</th>
					<th scope="col">집 보러 갈 날짜</th>
					<th scope="col">예약한 날짜</th>
				</tr>
			</thead>
			<tbody>
			<% if(hstRes != null && !hstRes.isEmpty()){ %>
               <% for(int hr = 0; hr < hstRes.size(); hr++) { %>
				<tr>
					<th scope="row"><%= ph.getListCount()-(ph.getListCount()-(ph.getObjectLimit()*(ph.getCurrentPage()-1)))+(hr+1) %></th>
					<td><%= hstRes.get(hr).getUsName() %></td>
					<td><%= hstRes.get(hr).getUsEmail() %></td>
					<td><%= hstRes.get(hr).getUsPhone() %></td>
					<td><%= hstRes.get(hr).getShRVperiod() %></td>
					<td><%= hstRes.get(hr).getShRVdate() %></td>
					<td><%= hstRes.get(hr).getShRVtd() %></td>
				</tr>
				<% } %>
                   <% } else { %>
               	<tr>
                  	<td colspan="7" style="text-align:center;">예약된 회원 정보가 없습니다.</td>
               	</tr>
               	<% } %>
			</tbody>
		</table>
	</div>
	
	<!-- 페이징 처리 부트스트랩 -->
	<nav aria-label="Page navigation example" id="bottomNav">
		<ul class="pagination">
			<!-- 처음으로(<<) -->
			<li class="page-item">
			<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/hst/reservationList?currentPage=1'"
				aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❮❮</span>
			</button>
			</li>
			<!-- 이전으로 (<) -->
			<% if(ph.getCurrentPage() == 1) { %>
			<li class="page-item">
			<button class="page-link" disabled aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❮</span>
			</button>
			<% } else { %>
			<li class="page-item">
			<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/hst/reservationList?currentPage=<%= ph.getCurrentPage() - 1 %>'"
				aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❮</span>
			</button>
			</li>
			<% } %>
			<!-- 페이지 목록 -->
			 <% for(int p = ph.getStartPage(); p <= ph.getEndPage(); p++) {%>
				<% if(p == ph.getCurrentPage()) { %>
				<li class="page-item">
					<button class="page-link" id="numCss" disabled><%= p %></button>
				</li>
				<% } else { %>
				<li class="page-item">
					<button class="page-link" id="numCss" onclick="location.href='<%= request.getContextPath() %>/hst/reservationList?currentPage=<%=p %>'"><%= p %></button>
				</li>
				<% } %>
			<% } %>
			
			<!-- 다음으로(>) -->
			<% if(ph.getCurrentPage() == ph.getMaxPage()) { %>
			<li class="page-item">
			<button class="page-link" disabled
				aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❯</span>
			</button></li>
			<% } else { %>
				<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/hst/reservationList?currentPage=<%= ph.getCurrentPage() + 1 %>'" aria-label="Previous" id="forCss"> 
					<span aria-hidden="true" style="font-size: 10px;">❯</span>
				</button>
				</li>
			<% } %>
			<!-- 맨 끝으로(>>) -->
			<li class="page-item">
			<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/hst/reservationList?currentPage=<%= ph.getMaxPage()%>'"
				aria-label="Next" id="forCss"> <span aria-hidden="true" style="font-size: 10px;">❯❯</span>
			</button></li>
		</ul>
	</nav>
	<% } %>

	<script>
	    const deleteBtn = document.getElementById('deleteBtn');
	    deleteBtn.addEventListener('click', function(){
	       location.href="<%= request.getContextPath() %>/views/Mypage/mp_delete.jsp";
	    });
		
		// User 예약 버튼
		<% if(loginUser != null){ %>
		<% for(int b = 0; b< shUsRes.size(); b++) { %>
      	$(function(){ 
      	// 수정하기 버튼 이벤트
      	$('#detailBtn<%= b%>').click(function(){
  			
				var RVNo = '<%= shUsRes.get(b).getShRVNo() %>';		
  				location.href="<%= request.getContextPath()%>/Mypage/shResDetail?RVNo="+RVNo;
		});
      		
      	// 예약 취소하기 버튼 이벤트
			$('#deleteBtn<%=b%>').click(function(){
  			
				var RVNo = '<%= shUsRes.get(b).getShRVNo() %>';
				var roomTitle =  $(this).parents("tr").children().eq(2).text()
  			
				//console.log(hNo);
  			
  				var cb_check = confirm( roomTitle + "예약을 취소하시겠습니까?");
  			
				if(cb_check == true){
  				location.href="<%= request.getContextPath()%>/Mypage/shResdelete?RVNo="+RVNo;
  			} else if(cb_check == false){
  	        	alert("취소되었습니다.");
      		}
			});
		});
      	<% } %>
      	<% } %>
    </script>

	<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>
</body>
</html>
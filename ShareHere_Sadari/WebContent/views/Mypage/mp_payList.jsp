<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, house.model.vo.HostPay, mypage.model.vo.PageInfo"%>
<%
	User u = (User)session.getAttribute("loginUser");
	Host h = (Host)session.getAttribute("loginHost");
	ArrayList<HostPay> hpay = (ArrayList<HostPay>)request.getAttribute("hpay");
	ArrayList<RmPay> ulist = (ArrayList<RmPay>)request.getAttribute("ulist");
	
	System.out.println("ArrayList<RmPay> ulist : " + ulist);
	System.out.println("ArrayList<HostPay> hpay : " + hpay);

	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	PageInfoForOut upi = (PageInfoForOut)request.getAttribute("upi");
	
	ADM_Search s = (ADM_Search)request.getAttribute("search");
		String search = "";
		String searchCondition = "";
		String[] selected = new String[3];
		if(s != null){
			search = s.getSearch();
			searchCondition = s.getSearchCondition();
			if(searchCondition.equals("writer")){
				selected[0] = "selected";
			}else if(searchCondition.equals("title")){
				selected[1] = "selected";
			}else{
				selected[2] = "selected";
			} 
		} 
		

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
<title>마이페이지</title>
<!-- 글자 폰트 -->

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<script src="http://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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

#update, #delete {
	background-color: white;
	border: 0px;
	border-radius: 30%;
}

#update:hover {
	background-color: rgb(247, 218, 57);
}

#delete:hover {
	background-color: rgb(175, 29, 29);
}

.btn img {
	width: 30px;
}

#bottomNav {
	margin-left: 40%; 
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
<!-- user_no필요할때 -->
<%-- 	<input type="hidden" name="user_no" value="<%= u.getUserNo() %>"> --%>
<!-- 	상단네비 -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link"
			href="<%= request.getContextPath() %>/views/Mypage/mp_update.jsp">회원
				정보 수정</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<%= request.getContextPath() %>/Mypage/User/ReservationList">예약한
				방 정보</a></li>
		<li class="nav-item"><a class="nav-link active"
			aria-current="page"
			href="<%= request.getContextPath() %>/pay/list">결제내역
				확인</a></li>
		<li class="nav-item"><a id="deleteBtn" class="nav-link" href="#">회원탈퇴</a>
		</li>
	</ul>
<!-- 	하단메뉴 -->
<%if(hpay == null) { %>
	<div class="hst_table">
		<h2>결제내역 확인</h2>
		<table class="table">
			<thead>
				<tr class="table-dark">
					<th scope="col">#</th>
					<th scope="col">결제항목</th>
					<th scope="col">가격</th>
					<th scope="col">결제일</th>
					<th scope="col">상품기한만료일</th>
					<th scope="col">환불문의</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<%for(int p=0; p<ulist.size(); p++){ %>
						<th scope="row"><%=p%></th>
						<td><%=ulist.get(p).getPay_item() %></td>
						<td><%=ulist.get(p).getPrice() %></td>
						<td><%=ulist.get(p).getPay_date() %></td>
						<td><%=ulist.get(p).getExpiry_date() %></td>
						<td>
                        <button id="refundRmBtn<%= p %>" class="btn">
                            <a><i class="fas fa-undo-alt fa-lg"></i></a>
                        </button>
                       </td>
				
						<%} %>
					</tr>
			</tbody>
		</table>
	</div>
	<%} %>
	
	<!-- 페이징 처리 부트스트랩 -->
	<nav aria-label="Page navigation example" id="bottomNav">
		<ul class="pagination">
			<!-- 처음으로(<<) -->
			<li class="page-item">
			<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/pay/list?currentPage=1'"
				aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❮❮</span>
			</button>
			</li>
			<!-- 이전으로 (<) -->
			<% if(upi.getCurrentPage() == 1) { %>
			<li class="page-item">
			<button class="page-link" disabled aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❮</span>
			</button>
			<% } else { %>
			<li class="page-item">
			<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/pay/list?currentPage=<%=upi.getCurrentPage() - 1 %>'"
				aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❮</span>
			</button>
			</li>
			<% } %>
			<!-- 페이지 목록 -->
			 <% for(int p = upi.getStartPage(); p <= upi.getEndPage(); p++) {%>
				<% if(p == upi.getCurrentPage()) { %>
				<li class="page-item">
					<button class="page-link" id="numCss" disabled><%= p %></button>
				</li>
				<% } else { %>
				<li class="page-item">
					<button class="page-link" id="numCss" onclick="location.href='<%= request.getContextPath() %>/pay/list?currentPage=<%=p %>'"><%= p %></button>
				</li>
				<% } %>
			<% } %>
			
			<!-- 다음으로(>) -->
			<% if(upi.getCurrentPage() == upi.getMaxPage()) { %>
			<li class="page-item">
			<button class="page-link" disabled
				aria-label="Previous" id="forCss"> 
				<span aria-hidden="true" style="font-size: 10px;">❯</span>
			</button></li>
			<% } else { %>
				<li class="page-item">
				<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/pay/list?currentPage=<%= upi.getCurrentPage() + 1 %>'" aria-label="Previous" id="forCss"> 
					<span aria-hidden="true" style="font-size: 10px;">❯</span>
				</button>
				</li>
			<% } %>
			<!-- 맨 끝으로(>>) -->
			<li class="page-item">
			<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/pay/list?currentPage=<%= upi.getMaxPage()%>'"
				aria-label="Next" id="forCss"> <span aria-hidden="true" style="font-size: 10px;">❯❯</span>
			</button></li>
		</ul>
	</nav>
	
	
<!-- 	호스트 -->
	<% }else{ %>
<!-- 	host_no 필요할떄 -->
<%-- 	<input type="hidden" name="user_no" value="<%= h.getHst_no() %>"> --%>

<!-- 네비바 -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link"
			href="<%= request.getContextPath() %>/views/Mypage/mp_update.jsp">회원
				정보 수정</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<%= request.getContextPath() %>/hst/reservationList">예약한
				입주민 정보</a></li>
		<li class="nav-item"><a class="nav-link active"
			aria-current="page"
			href="<%= request.getContextPath() %>/Mypage/hstPay">결제내역
				확인</a></li>
		<li class="nav-item"><a id="deleteBtn" class="nav-link" href="#">회원탈퇴</a>
		</li>
	</ul>
	
<!-- 	하단  -->
		<div class="hst_table">
		<h2>결제내역 확인</h2>
		<table class="table">
			<thead>
				<tr class="table-dark">
					<th scope="col">#</th>
					<th scope="col">결제번호</th>
					<th scope="col">결제항목</th>
					<th scope="col">결제금액</th>
					<th scope="col">결제날짜</th>
					<th scope="col">환불문의</th>
				</tr>
			</thead>
			<tbody>
			<% if(hpay != null && !hpay.isEmpty()){ %>
               <% for(int p = 0; p < hpay.size(); p++) { %>
				<tr>
					<td><%= pi.getListCount()-(pi.getListCount()-(pi.getObjectLimit()*(pi.getCurrentPage()-1)))+(p+1) %></td>
                    <td>
                    <%= hpay.get(p).getPayNo() %>
					<form id="hnoForm" method="GET">
						<input type="hidden" name="payNo" id="payNo" value="<%= hpay.get(p).getPayNo() %>">
					</form>
                      </td>
                      <td><%= hpay.get(p).getShItem() %></td>
                      <td><%= hpay.get(p).getShPrice() %>만원</td>
                      <td><%= hpay.get(p).getShPdate() %></td>
                      <td>
                        <button id="refundBtn<%= p %>" class="btn">
                            <a><i class="fas fa-undo-alt fa-lg"></i></a>
                        </button>
                       </td>
                    </tr>
                   
                    <% } %>
                    <% } else { %>
                	<tr>
                   	<td colspan="8" style="text-align:center;">결제된 정보가 없습니다.</td>
                	</tr>
                	<% } %>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- 페이징 처리 부트스트랩 -->
	<nav aria-label="Page navigation example" id="bottomNav">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous" id="forCss"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#" id="numCss">1</a></li>
			<!--<li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>-->
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next" id="forCss"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
	<% } %>
	
	<script>
	 const deleteBtn = document.getElementById('deleteBtn');
	    deleteBtn.addEventListener('click', function(){
	       location.href="<%= request.getContextPath() %>/views/Mypage/mp_delete.jsp";
	    });
	      
	      // 호스트 버튼 이벤트
	      <% if(u == null){%>
	      <% for(int p = 0; p < hpay.size(); p++) { %>
	         $(function(){ 
		         //환불하기 버튼
		         $('#refundBtn<%=p%>').click(function(){
		            alert("관리자에게 문의해주세요!");
		         
		      });
	      });
	         <%}
	         } else {%>
		      <% for(int p = 0; p < ulist.size(); p++) { %>
		         $(function(){ 
			         //환불하기 버튼
			         $('#refundRmBtn<%=p%>').click(function(){
			            alert("관리자에게 문의해주세요!");
			         
			      });
		      });
		         <%}
		         }%>
    </script>

	<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>
</body>
</html>
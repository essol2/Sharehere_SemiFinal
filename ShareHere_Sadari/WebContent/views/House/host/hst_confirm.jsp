<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, house.model.vo.HostInfo, mypage.model.vo.PageInfo"%>
<%
	ArrayList<HostInfo> infoList = (ArrayList<HostInfo>)request.getAttribute("hostInfo");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>House 확인 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- 글자 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script src="http://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>

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
.hst_table {
	padding: 5% 10% 5% 10%;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	height : 500px;
}

.btnUpd, .btnDel {
	background-color: white;
	border: 0px;
	border-radius: 30%;
}

.btnUpd:hover {
	background-color: rgb(247, 218, 57);
}

.btnDel:hover {
	background-color: rgb(175, 29, 29);
}

.btnUpd img, .btnDel img {
	width: 30px;
}

</style>
 <!-- navi css 경로 -->
<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
</head>
<body>

<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
<%@include file="/views/common/navi.jsp"%>

    <div class="hst_table">
    <h2>HOST 하우스 확인</h2>
        <table class="table">
            <thead>
            <tr class="table-dark">
                <th scope="col">#</th>
                <th scope="col">하우스번호</th>
                <th scope="col">House Name</th>
                <th scope="col">주택유형</th>
                <th scope="col">주택구조</th>
                <th scope="col">건물면적</th>
                <th scope="col">주소</th>
                <th scope="col">등록날짜</th>
                <th scope="col">수정하기</th>
                <th scope="col">삭제하기</th>
            </tr>
            </thead>
            <tbody id="tbody">
			<% if(infoList != null && !infoList.isEmpty()){ %>
               <% for(int h = 0; h < infoList.size(); h++) { %>
                     <tr>
                     	<td><%= pi.getListCount()-(pi.getListCount()-(pi.getObjectLimit()*(pi.getCurrentPage()-1)))+(h+1) %></td>
                        <td>
                        <%= infoList.get(h).getShNo() %>
						<form id="hnoForm" method="GET"  action="<%= request.getContextPath()%>/hst/info" >
							<input type="hidden" name="hno" id="hno" value="<%= infoList.get(h).getShNo() %>">
						</form>
                        </td>
                        <td><%= infoList.get(h).getShTitle() %></td>
                        <td><%= infoList.get(h).getShType() %></td>
                        <td><%= infoList.get(h).getShStr() %></td>
                        <td><%= infoList.get(h).getShArea() %></td>
                        <td><%= infoList.get(h).getShAddress() %></td>
                        <td><%= infoList.get(h).getShDate() %></td>
                        <td>
                          <button id="updateBtn<%= h %>" class="btnUpd">
                              <img src="https://cdn.iconscout.com/icon/free/png-64/edit-1912229-1617698.png" alt="update">
                          </button>
                         </td>
                         <td>
                          <button id="deleteBtn<%= h %>" class="btnDel">
                              <img src="https://cdn.iconscout.com/icon/free/png-64/delete-1912233-1617702.png" alt="delete">
                          </button>
                         </td>
                      </tr>
                     
                      <% } %>
                      <% } else { %>
                  	<tr>
                     	<td colspan="9" style="text-align:center;">존재하는 매물 정보가 없습니다.</td>
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
			<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/hst/confirm?currentPage=1'"
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
			<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/hst/confirm?currentPage=<%= pi.getCurrentPage() - 1 %>'"
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
					<button class="page-link" id="numCss" onclick="location.href='<%= request.getContextPath() %>/hst/confirm?currentPage=<%=p %>'"><%= p %></button>
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
				<button class="page-link" onclick="location.href='<%= request.getContextPath()%>/hst/confirm?currentPage=<%= pi.getCurrentPage() + 1 %>'" aria-label="Previous" id="forCss"> 
					<span aria-hidden="true" style="font-size: 10px;">❯</span>
				</button>
				</li>
			<% } %>
			<!-- 맨 끝으로(>>) -->
			<li class="page-item">
			<button class="page-link" onclick="location.href='<%= request.getContextPath() %>/hst/confirm?currentPage=<%= pi.getMaxPage()%>'"
				aria-label="Next" id="forCss"> <span aria-hidden="true" style="font-size: 10px;">❯❯</span>
			</button></li>
		</ul>
	</nav>
  

	<script>
      <% for(int h = 0; h < infoList.size(); h++) { %>
      	$(function(){ 
      	// 수정하기 버튼 이벤트
      	$('#updateBtn<%=h%>').click(function(){
  			
				var hNo = $(this).parents("tr").children().eq(1).text().trim();
  			
				console.log(hNo);
  				location.href="<%= request.getContextPath()%>/hst/updateForm?hNo="+hNo;
		});
      		
      	// 삭제하기 버튼 이벤트
			$('#deleteBtn<%=h%>').click(function(){
  			
				var hNo = $(this).parents("tr").children().eq(1).text().trim();
				var hTitle =  $(this).parents("tr").children().eq(2).text()

  			
  			var cb_check = confirm( hTitle + "를 삭제하시겠습니까?");
  			
				if(cb_check == true){
  				location.href="<%= request.getContextPath()%>/hst/delete?hNo="+hNo;
  			} else if(cb_check == false){
  	        	alert("취소되었습니다.");
      		}
			});
		});
      <% } %>
	    
	
	</script>
    
    
    <!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp" %>
   
</body>
</html>
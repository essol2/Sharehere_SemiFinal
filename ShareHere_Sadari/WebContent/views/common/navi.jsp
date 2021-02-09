<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.*, administrator.model.vo.*, mypage.model.vo.ResToday"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
	Host loginHost = (Host) session.getAttribute("loginHost");
	Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
	ArrayList<RmReport> raList = (ArrayList<RmReport>)session.getAttribute("rmlist");
	ArrayList<ShReport> shList = (ArrayList<ShReport>)session.getAttribute("shlist");
	
	// YJ
		//ArrayList<ResToday> resToday = (ArrayList<ResToday>)session.getAttribute("resToday");
		//System.out.println("YJresToday :" + resToday);
		
		ArrayList<ResToday> rt = (ArrayList<ResToday>)session.getAttribute("rt");
		System.out.println("YJrt :" + rt);
%>
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">

<meta charset="UTF-8">
<title>This is a ShareHere Navi</title>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<!-- Navi & footer CSS-->
<link
	href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">
<%-- msg읽어서 알람띄워주고 msg 삭제하기 --%>
<%
	if (session.getAttribute("msg") != null) {
%>
<script>
   alert('<%=session.getAttribute("msg")%>');
</script>
<%
	session.removeAttribute("msg");
	}
%>
</head>
<body>

	<%-- 비로그인 상태 --%>
	<%
		if ((loginUser == null) && (loginHost == null) && (loginAdmin == null)) {
	%>
	<!-- 왼쪽네비바 -->
	<nav class="navibar">
		<ul class="nav_menu">
			<li id="house">House</li>
			<li id="rm">RoomMate</li>
			<li id="au">About US</li>
		</ul>

		<hr class="line">

		<div class="nav_logo" style="background-color: none; cursor:pointer">
         <div id="navlogo" style="border: 0px; background-color: none; cursor:pointer" value="">
            <img class="navi_logoImg" style="cursor:pointer" src="${pageContext.request.contextPath}/views/common/img/naviLogoNuggi.png">
         </div>
      </div>


		<!-- 왼쪽네비바 -->
		<ul class="nav_buttons">
			<!-- 회원가입버튼 -->
			<!--            <li><button type="button" id="reBtn">Register</button></li> -->
			<!-- 모달창 회원가입버튼 -->
<!-- 			<li><button type="button" id="reBtn">Register</button></li> -->
			<li><button type="button" 
					data-bs-toggle="modal" data-bs-target="#exampleModal" id="reBtn">
					Register</button></li>
			<li><button type="button"
					onclick="location.href='<%=request.getContextPath()%>/views/Login/login_Nnavi.jsp'"
					id="lgBtn">Login</button></li>
		</ul>
		<a href="#" class="navibar_toggleBtn" style="width: 5%;"> <img
			src="./main_img/bars-solid.svg" style="width: 100%;">
		</a>

		<!-- 모달 영역 -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">회원가입 유형을 선택하세요.</div>
					<div class="modal-footer">
						<button type="button" class="shBtn" id="userType"
							data-bs-dismiss="modal">일반회원</button>
						<button type="button" class="shBtn" id="hostType">호스트회원</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달창			 -->
		<script>
		
		$("#userType").on('click', function(){
			location.href='<%=request.getContextPath() %>/views/Login/register_user.jsp';
		});
		$("#hostType").on('click', function(){
			location.href='<%=request.getContextPath() %>/views/Login/register_hst.jsp';
		});
         	// 회원가입버튼 분류하기 모달창 전 회원가입(confirm)
//             const reBtn = document.getElementById('reBtn');
//             reBtn.addEventListener('click', function(){
//                if(confirm('일반 회원이십니까?')){
<%--                   location.href='<%= request.getContextPath() %>/views/Login/register_user.jsp'; --%>
//                }else{
<%--                   location.href='<%= request.getContextPath() %>/views/Login/register_hst.jsp'; --%>
//                }
//             }); 
         </script>


				<!-- user로 로그인됐을때 -->
				<%
					} else if (loginUser != null) {
				%>
				<!-- 왼쪽네비바 -->
				<%if(raList!=null){%>
					<%for(int k=0; k<raList.size(); k++) { %>
						<div class="alert alert-warning alert-dismissible fade show" role="alert">
						  <strong>경고!!!</strong>
						   <%=loginUser.getUserName()%>님, <br>
						   <%=raList.get(k).getRm_report() %>에 의한 신고가 접수되었습니다.<br>
						   경고 누적시 탈퇴처리됩니다.
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" 
						  onclick="location.href='<%=request.getContextPath()%>/change/checkstatus?uno='+<%=loginUser.getUserId()%>"></button>
						</div>
					<% }
				}%>
				<nav class="navibar">
					<ul class="nav_menu">
						<li id="house">House</li>
						<li id="rm">RoomMate</li>
						<li id="au">About US</li>
					</ul>

					<hr class="line">

					<div class="nav_logo" style="background-color: none;">
				         <div id="navlogo" style="border: 0px; background-color: none;" value="">
				            <img class="navi_logoImg" style="cursor:pointer" src="${pageContext.request.contextPath}/views/common/img/naviLogoNuggi.png">
				         </div>
				      </div>

					<!-- 왼쪽네비바 -->
					<ul class="nav_buttons">
						<li><button type="button" id="outBtn">Logout</button></li>
						<!-- 마이페이지로 갈때, 비밀번호 입력하는 방법 고민해보기 -->
						<li><button type="button" id="mypageBtn">MyPage</button></li>
						<li><a style="text-decoration: none; color: black;"
							id="user_name"><%=loginUser.getUserName()%>님 환영합니다.</a></li>
					</ul>

					<a href="#" class="navibar_toggleBtn" style="width: 5%;"> <img
						src="./main_img/bars-solid.svg" style="width: 100%;">
					</a>
					
					

					<script>
            // 로그아웃
				const outBtn = document.getElementById('outBtn');	//로그아웃
				outBtn.addEventListener('click',function(){
					location.href='<%=request.getContextPath()%>/member/logout';
				});
			// 마이페이지 버튼
				const mypageBtn = document.getElementById('mypageBtn');
				mypageBtn.addEventListener('click',function(){
					location.href="<%=request.getContextPath()%>/views/Mypage/mp_update.jsp";
				});
				
				<%-- const closeAlertRM = document.getElementById('closeAlertRM');
				closeAlertRM.addEventListener('click', function(){
					location.href='<%=request.getContextPath()%>/change/checkstatus?uno='+<%=loginUser.getUserId()%>
				}) --%>
				
				<%-- var myAlert = document.getElementById('myAlert')
				myAlert.addEventListener('closed.bs.alert', function () {
					location.href='<%=request.getContextPath()%>/change/checkstatus?uno='+<%=loginUser.getUserId()%>

				}) --%>
				
			</script>



					<!-- Host 로그인됐을때 -->
					<%
						} else if (loginHost != null) {
					%>
					<%if(shList!=null){%>
					<%for(int j=0; j<shList.size(); j++) { %>
						<div class="alert alert-warning alert-dismissible fade show" role="alert">
						  <strong>경고!!!</strong><br>
						   <%=loginHost.getHst_name()%>님의 <%=shList.get(j).getSh_no() %> 쉐어하우스에 신고가 접수되었습니다.<br>
						  신고사유 : <%=shList.get(j).getSh_reason() %> <br>
						  경고 누적시 자동 삭제처리됩니다.
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					<% }
				}%>
					<!-- 오늘 예약한 사람이 있을 떄 -->
						<!-- Modal -->
						<% if(rt != null && !rt.isEmpty()) { %>
						<div class="alert alert-secondary alert-dismissible fade show" role="alert" style="text-align:center;">
						  	오늘 예약한 사람이 있습니다!
						  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
						<% } %>
					
					<!-- 왼쪽네비바 -->
					<nav class="navibar">
						<ul class="nav_menu">
							<li id="info">House 등록</li>
							<li id="confirm">House 확인</li>
						</ul>

						<script>
	            // info 페이지 이동
	            const infoBtn = document.getElementById("info");
	            infoBtn.addEventListener("click", function(){
	            	location.href='<%=request.getContextPath()%>/views/House/host/hst_pay.jsp ';
	            });
	            
	            // confirm페이지 이동
	            const confirmBtn = document.getElementById("confirm");
	            confirmBtn.addEventListener("click", function(){
	            	location.href='<%=request.getContextPath()%>/hst/confirm';
	            });
	            
            </script>

						<hr class="line">

						<div class="nav_logo" style="background-color: none;">
					         <div id="navlogo" style="border: 0px; background-color: none;" value="">
					            <img class="navi_logoImg" style="cursor:pointer" src="${pageContext.request.contextPath}/views/common/img/naviLogoNuggi.png">
					         </div>
					      </div>

						<!-- 왼쪽네비바 -->
						<ul class="nav_buttons">
							<li><button type="button" id="outBtn">Logout</button></li>
							<li><button type="button" id="mypageBtn">MyPage</button></li>
							<!-- 마이페이지로 갈때, 비밀번호 입력하는 방법 고민해보기 -->
							<li><a style="text-decoration: none; color: black;"
								id="user_name"><%=loginHost.getHst_name()%>님 환영합니다.</a></li>
						</ul>

						<a href="#" class="navibar_toggleBtn" style="width: 5%;"> <img
							src="./main_img/bars-solid.svg" style="width: 100%;">
						</a>
						<!-- 버튼액션 -->

						<script>
            // 로그아웃
            const outBtn = document.getElementById('outBtn');	//로그아웃
        	outBtn.addEventListener('click',function(){
        		location.href='<%=request.getContextPath()%>/member/logout';
        	});
            
        	// 마이페이지 버튼
			const mypageBtn = document.getElementById('mypageBtn');
				mypageBtn.addEventListener('click',function(){
					location.href="<%=request.getContextPath()%>/views/Mypage/mp_update.jsp";
				});
            </script>

						<!-- admin 로그인됐을때 -->
						<%
							} else if (loginAdmin != null) {
						%>
						<!-- 왼쪽네비바 -->
						<nav class="navibar">
							<ul class="nav_menu">
								<li id="house">House</li>
								<li id="rm">RoomMate</li>
								<li id="au">About US</li>
							</ul>

							<hr class="line">

							
							<div class="nav_logo" style="background-color: none;">
						         <div id="navlogo" style="border: 1px soild black; background-color: none;" value="">
						            <img class="navi_logoImg" style="cursor:pointer" src="${pageContext.request.contextPath}/views/common/img/naviLogoNuggi.png">
						         </div>
						      </div>

							<!-- 왼쪽네비바 -->
							<ul class="nav_buttons">
								<li><button type="button" id="outBtn">Logout</button></li>
								<!-- id값 mypageBtn 통일 -->
								<li><button type="button" id="mypageBtn">관리메뉴</button></li>

								<!-- name 테이블을 추가 시켜야 무언가를 넣을듯 해요 dept를 넣기엔 살짝 애매				 -->
								<%--                 <li><a style="text-decoration: none; color: black;" id="user_name" ><%= loginAdmin.get %>님 환영합니다.</a></li> --%>
								<li><a style="text-decoration: none; color: black;"
									id="user_name">ShereHere 관리자</a></li>
							</ul>

							<a href="#" class="navibar_toggleBtn" style="width: 5%;"> <img
								src="./main_img/bars-solid.svg" style="width: 100%;">
							</a>

							<script>
            // 로그아웃
				const outBtn = document.getElementById('outBtn');	//로그아웃
				outBtn.addEventListener('click',function(){
					location.href='<%=request.getContextPath()%>/member/logout';
				});
			// 마이페이지 버튼  --> admin 같은경우는 관리메뉴버튼
				const mypageBtn = document.getElementById('mypageBtn');
				mypageBtn.addEventListener('click',function(){
					window.open("${pageContext.request.contextPath}/views/admin/adm_first.jsp", "관리자 로그인", "width=500, height=300"); 
				});
				
			</script>

							<%
								}
							%>
						</nav>


						<script>
    
    // 로고 클릭시 index.jsp로 이동
    const navlogo = document.getElementById("navlogo");
    navlogo.addEventListener("click", function() {
      location.href='<%=request.getContextPath()%>';
   });
    
    // House 페이지 이동
    const houseBtn = document.getElementById("house");
    houseBtn.addEventListener("click", function(){
       location.href='<%=request.getContextPath()%>/main/house';
    });
    
 // roomMate페이지 이동
    const roomMateBtn = document.getElementById("rm");
    roomMateBtn.addEventListener("click", function(){
      	location.href='<%= request.getContextPath() %>/views/Roommate/rm_main.jsp';
    });
    
    // aboutus페이지 이동
     const aboutUsBtn = document.getElementById("au");
     aboutUsBtn.addEventListener("click", function(){
       location.href='<%=request.getContextPath()%>/views/common/aboutus.jsp ';
    }); 
    </script></body>
</html>
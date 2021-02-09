<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login_easy</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- navi css 경로 -->
	<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
	
<!-- cookie	 -->
<script type="text/javascript" src="./jquery.cookie.js"></script>
	
<%-- msg읽어서 알람띄워주고 msg 삭제하기 (로그인하고 제자리 하고싶음) --%>
<% if(request.getAttribute("msg") != null){ %>
<script>
   alert('<%= request.getAttribute("msg")%>');
</script>
<%
    session.removeAttribute("msg");}
%>  
    <style>
        *{box-sizing: border-box;font: 1rem "나눔 고딕",sans-serif}
        ol,li,ul{list-style-type: none;}
        a{text-decoration: none;}
		.membertype{display: flex; justify-content: center; align-items:center;}
		.block{display: block;}
		
		#utype,#htype{width: auto; height: auto; background-color: none;}                         /* 회원분류 크기 */
   		#utype + label{margin-right: 40px;}
		#htype + label{margin-right: 40px;}
        /* 전체 페이지 설정 */
        .wrap{
            width: 100%;
            height: 1119px;
		
        } 
        /* 헤더 */
        .header{
            width: 100%;
            height: 118px;
            text-align: center;
        }

        /* 섹션 */
        section{
        	height : auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        section .section{
            width : 500px;
            height : auto;
        }
        /* 아이디,비밀번호 태그 */
        .index{
            display: block;
            padding: 0;
            margin-bottom: 0;
            font-weight: 400;
            font-size: 16px;
        }
        /* 인풋 태그 */
        .loginput{
            width: 100%;
            height: 45px;
            margin: 5;
            background-color:   #e1e1e1;
            border: 1px solid  #e1e1e1;
            border-style: groove;
            border-radius: 5px;
        }
        .login{
            width: 100%;
            height: 60px;
            background-color: black;
            color: white;
            /* border:1px solid  black(209, 209, 209); */
            border-style: groove;
            border-radius: 5px;
            font-size: 16px;
        }
        .login:hover{
            border:1px solid #e1e1e1;
            border-style: groove;
            border-radius: 5px;
            background-color: rgb(49, 49, 49); color: rgb(214, 214, 214);
        }
        /*  */
        .section_ul{
            display: flex;
            justify-content: space-between;
        }
        /* 아이디저장, 아이디찾기 비밀번호찾기 회원가입 */
        .section_ul_2 a:hover, #idremem + label:hover{background-color: #e1e1e1;font-size: 16px;cursor: pointer;}
        /* #idremem + label:hover{color: rgb(23, 23, 255);font-size: 14px;} */

        /* 간편로그인 */
        .easylogin{
            margin-top: 40px;
            padding: 0;
            border-top: 1px solid #e1e1e1;
        }
        .easylogin li{
            display: flex;
            width: 100%;
            height: 45px;
            margin-top: 10px;
            border-style: groove;border-radius: 5px;border: 1px solid rgb(209, 209, 209);
            /* display: flex;
            flex-direction: row; */
            justify-content: space-between;
            align-items: center;
        }
        .easylogin li:hover{background-color: #e1e1e1;}
        .easylogin li img{
            margin-left: 50px;
        }
        .easylogin :nth-child(1) a{margin-right: 188px;}
        .easylogin :nth-child(2) a{margin-right: 193px;}
        .easylogin :nth-child(3) a{margin-right: 193px;}

        .footer{
            width : 100%;
            height : 238px;
            border: 1px black solid;
        }
/* 아이디찾기/비밀번호찾기 회원가입 */
		.noline{text-decoration:none;color: black;}

        
    </style>
</head>
<body>
    <!-- 전체 페이지 -->
    <div class="wrap">
        <header>
            <div class="header">
                <!-- 로고 -->
                <h1>
                	<a href="<%= request.getContextPath() %>">
                		<img src="${pageContext.request.contextPath}/views/Login/image/nlogo.png" class="header_logo" alt="Sharehere_Logo">
                	</a>
                </h1>
            </div>
        </header>

        <section style="text-decoration:none;">
            <div class="section">
                <h2>LogIn</h2>

<!-- 로그인 선택을 어떻게해야할지         -->
                <form method="post" id="loginForm" action="<%= request.getContextPath() %>/member/login"
                onsubmit="return validate();">
                	
                    <label class="index">아이디</label>
                    <!-- required 나중에 지워주기(자바스크립트 추가 시) -->
                    <input type="text" name="userId" id="userId" class="loginput">
                    <span id="logininputresult"></span>
                    
                    <lable class="index">비밀번호</lable>
                    <input type="password" name="userPwd" id="userPwd" class="loginput" maxlength="16"><br>
                    
                    <br>
                    
<!-- id for 일치/// -->
					<div class="membertype">
					<span id="mtypeunsel">
	                    <input type="radio" name="mtype" id="utype" value="u">
	                    <label for="utype">일반회원</label> 
	                    <input type="radio" name="mtype" id="htype" value="h">
	                    <label for="htype">호스트</label>
	                    <input type="radio" name="mtype" id="atype" value="a">
	                    <label for="atype">관리자</label>
					</span>
					</div>




					<br>
        
                    <input class="login" type="submit" value="로그인">
                    <script>
                    function validate(){
    					var membertype = $("input[name=mtype]:checked").val();
    					
    					if($("#userId").val().trim().length == 0){
    						alert('아이디를 입력하세요');
    						$("#userId").focus();
    						return false;	
    					}
    					if($("#userPwd").val().trim().length == 0){
    						alert('비밀번호를 입력하세요');
    						$("#userPwd").focus();
    						return false;
    					}
    					
    					if(membertype == null){
    						alert('회원 타입을 선택해주세요.');
//     						$(".membertype").css({"border":"2px solid red"});
    						$("#mtypeunsel").css({"border":"1.3px dotted gray"});

    						return false;
    					}
    					return true;
    				}
                 	// 아이디 저장 쿠키
					// (쿠키에 userId값이 있다면 쿠키에서 불러오기) 
					$("#userId").val(Cookies.get('remeberId'));
					if ($("#userId").val() != "") {
						$("#idremem").attr("checked", true);
					}
					// 체크값이 변할때 작동 
					// 체크 돼있을때 쿠키값을 input값으로 바꾸기
					// 체 크 안됐을땐 쿠키 지우기
					$("#idremem").change(function() {
						if ($("#idremem").is(":checked")) {
							Cookies.set('remeberId', $("#userId").val(), {
								expires : 14
							});
						} else {
							Cookies.remove('remeberId');
						}
					});
					
					// 아이디가 입력될때 체크돼있다면 쿠키값 변경
					$("#userId").keyup(function() {
						if ($("#idremem").is(":checked")) {
							Cookies.set('remeberId', $("#userId").val(), {
								expires : 14
							});
						}
					});
					
					
                    </script>
                 </form>
                
<!-- 링크 연결 밑 jsp 만들기 -->
                <div class="section_ul">
                    <div class="section_ul_1">
                        <input type="checkbox" id="idremem"><label for="idremem">아이디 저장</label>
                    </div>
                    <div class="section_ul_2">
                        <a href="<%= request.getContextPath() %>/views/Login/findId.jsp" class="noline">아이디찾기</a>&nbsp;/&nbsp;
                        <a href="<%= request.getContextPath() %>/views/Login/findPwd.jsp" class="noline">비밀번호 찾기</a>&nbsp;/&nbsp;
                        <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal" id="reBtn2" style="color:black; text-decoration:none;">회원가입</a>
<!--                         <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" id="reBtn">Register</button> -->
                    </div>
                </div>
                <ul class="easylogin">
                    <li><img src="${pageContext.request.contextPath}/views/Login/image/login-google.png" alt="google"><a href="#" class="noline">Google 로그인</a></li>
                    <li><img src="${pageContext.request.contextPath}/views/Login/image/login-naver.png" alt="Naver"><a href="#" class="noline">Naver 로그인</a></li>
                    <li><img src="${pageContext.request.contextPath}/views/Login/image/login-kakao.png" alt="Kakao"><a href="#" class="noline">Kakao 로그인</a></li>
                </ul>
            </div>
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
		</section>
        
        <!--  관리자 페이지 로그인 -->
<!-- 	<div class="goToAdminLogin">관리자 로그인 하기.</div> -->
<!-- 	<script> -->
<!--  		$('.goToAdminLogin').click(function(){ -->
<!-- 			window.open("${pageContext.request.contextPath}/views/admin/adm_first.jsp", "관리자 로그인", "width=500, height=300"); -->
<!--  		}); -->
<!-- 	</script> -->


        <!-- footer -->
   <%@include file="/views/common/footer.jsp" %>
    </div>
	<script>
	// 회원가입 모달창
			$("#userType").on('click', function(){
				location.href='<%=request.getContextPath() %>/views/Login/register_user.jsp';
			});
			$("#hostType").on('click', function(){
				location.href='<%=request.getContextPath() %>/views/Login/register_hst.jsp';
			});
	
		// 회원가입버튼 분류하기
// 			const reBtn = document.getElementById('registerA');
// 			registerA.addEventListener('click', function(){
// 				if(confirm('일반 회원이십니까?')){
<%-- 					location.href='<%= request.getContextPath() %>/views/Login/register_user.jsp'; --%>
// 				}else{
<%-- 					location.href='<%= request.getContextPath() %>/views/Login/register_hst.jsp'; --%>
// 				}
// 			});
			// 간편로그인 링크 연결해주기
			$(function(){
				$(".easylogin li").mouseenter(function(){
					$(this).css({"background":"lightgray", "cursor":"pointer"});
				}).mouseout(function(){
					$(this).css({"background":"rgb(248,249,250)"});
				}).click(function(){
					location.href='#';
				});
			});
			
			////////////////////// 어드민 로그인 제출
// 			const deleteBtn = document.getElementById('deleteBtn');
// 			deleteBtn.addEventListener('click', function(){
// 				if(confirm("정말로 탈퇴하시겠습니까?")){
<%-- 					$("#deleteform").attr("action", "<%=request.getContextPath()%> --%>
// 			/member/delete");
// 					$("#deleteform").submit();
// 				}
// 			}); 
			/////////////어드민 로그인 제출 ver2
// 		$(function() {
// 			const membertype = $("input[name=mtype]:checked").val();
// 			const deleteBtn = document.getElementById('deleteBtn');
			
// 			if (membertype == 'a') {
<%-- 				$("#loginForm").attr("action", "<%=request.getContextPath()%>/member/Adminlogin"); --%>
// 				$("#loginForm").submit();
// 			}
// 		});
	</script>
</body>
</html>
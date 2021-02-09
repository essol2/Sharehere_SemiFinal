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
    <title>findPwd</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- navi css 경로 -->
<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">

<%
	if (request.getAttribute("result") != null) {
		if (request.getAttribute("result").equals("success")) {
%>
			<script>
				alert("이메일로 임시 비밀번호를 전송하였습니다. 로그인하여 비밀번호를 바꿔주세요.");
				window.close();
			</script>
<% 		 } else { %>
			<script>
				alert("일치하는 정보가 없습니다.");
			</script>
<%        }
	}%>
	
    <style>
        *{box-sizing: border-box;}
        ol,li,ul{list-style-type: none;}
        a{text-decoration: none;}

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
            width : 460px;
            height : auto;
            /* border: 1px black solid; */
        }
        .section h2{font-weight : bold; font-size:20pt;}
        /* 이름 이메일 휴대전화 태그 */
        .index{
            display: block;
            padding: 0;
            margin-bottom: 0;
            font-weight: 400;
            font-size: 16px;
        }
        /* 입력태그 */
        .findinput{
            width: 100%;
            height: 45px;
            margin: 5;
            background-color:   #e1e1e1;
            border: 1px solid  #e1e1e1;
            border-style: groove;
            border-radius: 5px;
        }
        /*  정보찾기버튼 */
        .find{
            width: 100%;
            height: 60px;
            background-color: black;
            color: white;
            /* border:1px solid  black(209, 209, 209); */
            border-style: groove;
            border-radius: 5px;
            font-size: 16px;
        }
        .find:hover{
            border:1px solid #e1e1e1;
            border-style: groove;
            border-radius: 5px;
            background-color: rgb(49, 49, 49); color: rgb(214, 214, 214);
        }
        .section_ul_2 a:hover, #idremem + label:hover{background-color: #e1e1e1;font-size: 16px;cursor: pointer;}
        /*  */
        #nameIncor, #phoneIncor, #emailIncor{
            color: red; text-align: center;
        }

        .footer{
            width : 100%;
            height : 238px;
            border: 1px black solid;
        }

        .section_ul_2{
            display: flex;
            justify-content: flex-end;
        }
    </style>
</head>
<body>
    <!-- 전체 페이지 -->
    <div class="wrap">
        <header>
            <div class="header">
                <!-- 로고 -->
                <h1><a href="<%= request.getContextPath() %>"><img src="${pageContext.request.contextPath}/views/Login/image/nlogo.png" class="header_logo" alt="Sharehere_Logo"></a></h1>
            </div>
        </header>

        <section>
            <div class="section">
                <h2>회원정보 찾기</h2>

				<form method="post" id="FindPwdForm" name="FindPwdForm" action="<%= request.getContextPath() %>/member/findpwd"
                onsubmit="return validate();">
	
                    <label class="index">아이디</label>
                    <!-- required 나중에 지워주기(자바스크립트 추가 시) -->
                    <input type="text" id="userId" name="userId" class="findinput">
<!--                     <span id="nameIncor"></span> -->
                    
                    <lable class="index" onchange="pwdchange();">휴대전화</lable>
                    <input type="text" id="phone" name="phone" class="findinput" maxlength="11"><br>
                    <div>
                        <span id="phoneIncor"></span>
                    </div>
                    <label class="index">이메일</label>
                    <input type="email" id="email" name="email" class="findinput">
                    <span id="emailIncor"></span>
                    <br><br>
                    <input class="find" type="submit" value="정보찾기">
					<div class="section_ul_2">
                        <a href="<%= request.getContextPath() %>/views/Login/findId.jsp" class="noline" style="text-decoration:none; font-size:16px; color:black;">아이디찾기</a>&nbsp;/&nbsp;
                        <a href="<%= request.getContextPath() %>/views/Login/findPwd.jsp" class="noline" style="text-decoration:none; font-size:16px; color:black;">비밀번호 찾기</a>&nbsp;/&nbsp;
                        <a href="#" class="noline" id="registerA" style="text-decoration:none; font-size:16px; color:black;">회원가입</a>
                    </div>
                    <script>
                        $(function () {
                        	$("#userId").change(function () {   // id
                                // 유효성검사
                                var regid = /^[a-z][a-z0-9]{3,15}$/;       // 영어로시작, 영,숫 4~16글자
                                var firsta = /^[a-z]/;  // 영어소문자로 시작
                                // 아이디가 정규식을 만족하지 못한경우
                                if (!firsta.test($(this).val())) {
                                    $("#idresult").html("영어 소문자로 시작해 주세요.").css("color", "red");
                                } else if (!regid.test($(this).val())) {
                                    $("#idresult").html("영어소문자,숫자로 구성된 4~16글자로 작성해주세요.").css("color", "red");
                                } else {
                                    $("#idresult").html("정상 입력").css("color", "green");
                                }
                            });
                        	$("#phone").change(function(){
                                var phoneVal = $("#phone").val();
                                var regphone = /^010\D?\d{4}\D?\d{4}$|^01[16789]\D?\d{3}\D?\d{4}$/;

                                if(regphone.test(phoneVal)){
                                    $("#phoneresult").html("정상입력").css("color","green");
                                }else{
                                    $("#phoneresult").html("올바른 휴대전화 번호를 입력해주세요.").css("color","red");
                                }
                            });
                            $("#email").change(function () {
                                var emailVal = $("#useremail").val();
                                var regemail = /^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                                if (emailVal.match(regemail) != null) {
                                    $("#emailIncor").html("정상입력").css("color", "green");
                                }
                                else {
                                    $("#emailIncor").html("올바른 이메일을 입력해주세요.").css("color", "red");
                                }
                            });
                        });
                    </script>
                    <script>
                        function validate() {
                            // 아이디, 패스워드 중 입력 되지 않은 값이 있을 시 alert 후 focus 처리 -> submit X
                            if ($("#userId").val().trim().length == 0) {
                                //.trim--> 띄어쓰기 없애기
                                alert('아이디를 입력하세요');
                                $("#userId").focus();
                                return false;	//submit 안하게 하기 위해
                            }
                            if(!((/^[a-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i).test($("#email").val()))){
                				alert('이메일주소를 확인해주세요.');
                				$("#email").select();
                				return false;
                			}
                			if(!(/^010\D?\d{4}\D?\d{4}$|^01[16789]\D?\d{3}\D?\d{4}$/).test($("#phone").val())){
                				alert('휴대전화번호를 확인해주세요.');
                				$("#phone").select();
                				return false;
                			}
                            return true;
                        }
                    </script> 
                </form>

        </section>

        
    <!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>
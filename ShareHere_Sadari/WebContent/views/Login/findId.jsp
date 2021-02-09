<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String message = (String)request.getAttribute("msg");
// request.getSession().getAttribute("user)
   
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find_ID</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- navi css 경로 -->
   <link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
   
<!-- cookie    -->
<script type="text/javascript" src="./jquery.cookie.js"></script>
   <!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<%
   if (request.getAttribute("result") != null) {
      if (request.getAttribute("result").equals("success")) {
%>
<script>
   alert("회원님의 회원 타입은 <%= (String)request.getAttribute("userId") %> 입니다.");
   window.close();
</script>
<%        } else { %>
<script>
   alert("일치하는 정보가 없습니다.");
</script>
<%        }
   }%>
    <style>
        *{box-sizing: border-box;font-family: 'Nanum Gothic', sans-serif;
   font-weight: bold;}
        ol,li,ul{list-style-type: none;}
        a{text-decoration: none;}
      .block{display: block;}
      
      
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
            color: black;
            font-size: 14px;
            justify-content: space-between;
        }
        /* #idIncor, #pwdIncor{
            color: red; text-align: center;
        } */
        /* 아이디저장, 아이디찾기 비밀번호찾기 회원가입 */
        .section_ul_2 a:hover, #idremem + label:hover{background-color: #e1e1e1;;font-size: 16px;cursor: pointer;}
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
      .noline{text-decoration:none;}

        
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
                <h2>아이디 찾기</h2>

<!-- 로그인 선택을 어떻게해야할지         -->
                <form method="post" id="FindIdForm" name="FindIdForm" action="<%= request.getContextPath() %>/member/findid"
                onsubmit="return validate();">
                   
                    <label class="index">이름</label>
                    <!-- required 나중에 지워주기(자바스크립트 추가 시) -->
                    <input type="text" name="username" id="username" class="loginput" maxlength="5">
                    <span id="logininputresult">&nbsp;</span>

                    
                    <lable class="index">휴대전화</lable>
                    <input type="text" name="userphone" id="userphone" class="loginput" maxlength="11"><br>
                    <span id="phoneresult">&nbsp;</span>
                    <br>
                    
<!-- id for 일치/// -->
               <br>
                    <input class="login" type="submit" value="아이디 찾기">
                 </form>
                
<!-- 링크 연결 밑 jsp 만들기 -->
                <div class="section_ul">
                    <div class="section_ul_1">
                    </div>
                    <div class="section_ul_2">
                        <a href="#" class="noline" style="text-decoration:none; font-size:16px; color:black;">아이디찾기</a>&nbsp;/&nbsp;
                        <a href="<%= request.getContextPath() %>/views/Login/findPwd.jsp" class="noline" style="text-decoration:none; font-size:16px; color:black;">비밀번호 찾기</a>&nbsp;/&nbsp;
                        <a href="#" class="noline" id="registerA" style="text-decoration:none; font-size:16px; color:black;">회원가입</a>
                    </div>
                </div>
            </div>
        </section>


<!-- footer -->
   <%@include file="/views/common/footer.jsp" %>
    </div>
   <script>
    $(function () {
       
       $("#username").change(function () {
            var regname = /^[가-힣]{2,5}$/;     //2~5글자의 한글 이름
            if (regname.test($(this).val())) {
                $("#logininputresult").html("정상 입력.").css("color", "green");
            } else {
                $("#logininputresult").html("올바른 이름이 아닙니다.").css("color", "red");
            }
        });
       $("#userphone").change(function(){
            var phoneVal = $("#phone").val();
            var regphone = /^010\D?\d{4}\D?\d{4}$|^01[16789]\D?\d{3}\D?\d{4}$/;

            if(regphone.test(phoneVal)){
                $("#phoneresult").html("정상입력").css("color","green");
            }else{
                $("#phoneresult").html("올바른 휴대전화 번호를 입력해주세요.").css("color","red");
            }
        });
       
            // 회원가입버튼 분류하기
            const reBtn = document.getElementById('registerA');
            registerA.addEventListener('click', function(){
               if(confirm('일반 회원이십니까?')){
                  location.href='<%=request.getContextPath()%>/views/Login/register_user.jsp';
               }else{
                  location.href='<%=request.getContextPath()%>/views/Login/register_hst.jsp';
               }
            });
            
            //유효성 검사
            
    });
    
            function validate() {
               if (!(/^[가-힣]{2,5}$/).test($("#username").val())) {
                  alert('이름은 한글 2~5글자 사이만 가능');
                  $("#username").select();
                  return false;
               }
               
               if (!(/^010\D?\d{4}\D?\d{4}$|^01[16789]\D?\d{3}\D?\d{4}$/).test($(
                     "#userphone").val())) {
                  alert('휴대전화번호를 확인해주세요.');
                  $("#userphone").select();
                  return false;
               }
               return true;
             };
            </script>
</body>
</html>
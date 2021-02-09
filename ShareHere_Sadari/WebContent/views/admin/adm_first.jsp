<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>Administrator</title>
<script>
	window.resizeTo(1100,730);
</script>
<style>
    /* 1366 X 1024 사이즈로 새로운 창으로 띄우기*/
    body{
    	background-image: url('../admin/adm_img/background.jpg');
        background-repeat: no-repeat;
        background-size:1170px 768px;
        font-family: 'Nanum Gothic', sans-serif;
    }

    .title{
        color : white;
        width: 100%;
        /*border: 1px solid red;*/
        padding-top:5%;
        margin-top: 3%;
    }

    h1{
        text-align: center;
        font-size: 500%;
    }

    .background{
        /*border: 1px solid yellowgreen;*/
        margin-top: 1%;
    }

    table{
        margin: auto;
    }

    table, tr, td{
        /*border: 1px solid blue;*/
    }

    .firstBtn{
        background-color: black;
        color:white;
        width: 200px;
        height : 100px;
        margin:30px;
        border-radius: 13px;
        font-size: large;
        border : none;
        cursor:pointer;
        outline:none;
    }

    .firstBtn:hover{
        opacity: 60%;
    }
    @font-face {
    font-family: 'MapoFlowerIsland';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
   font-family: 'MapoFlowerIsland';
}
</style>
</head>
<body>
	<div class="title">
        <h1>Administrator</h1>
    </div>
    <div class="background">
       <table id="firstTB">
           <tr>
               <td>
                   <button class="firstBtn" id="adm_member" type="button">회원관리</button>
                   <button class="firstBtn" id="adm_house" type="button">쉐어하우스관리</button>
                   <button class="firstBtn" id="adm_income" type="button">수익관리</button>
               </td>
            </tr>
            <tr>
               <td>
                <button class="firstBtn" id="adm_fourth" type="button">관리자 등록</button>
                <button class="firstBtn" id="adm_fifth" type="button">급여관리</button>
                <button class="firstBtn" id="adm_sixth" type="button">회사일정</button>
               </td>
           </tr>
       </table>
       <script>
       		const adm_member = document.getElementById("adm_member");
       		adm_member.addEventListener('click', function(){
       			location.href='<%=request.getContextPath()%>/rmreport/list';
       		});
       		
       		const adm_house = document.getElementById("adm_house");
       		adm_house.addEventListener('click', function(){
       			location.href='<%=request.getContextPath()%>/shreport/list';
       		});
       		
       		const adm_income = document.getElementById("adm_income");
       		adm_income.addEventListener('click', function(){
       			location.href='<%=request.getContextPath()%>/income/report';
       		});
       		
       		const adm_fourth = document.getElementById("adm_fourth");
       		adm_fourth.addEventListener('click', function(){
       			location.href='<%=request.getContextPath()%>/views/Login/loginAdmin.jsp';
       		});
       </script>
    </div>
</body>
</html>
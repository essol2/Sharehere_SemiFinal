<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="administrator.model.vo.*"%>
    
<%
	Hostmember hm = (Hostmember)request.getAttribute("hostDetail");
	System.out.println("hostDetail 상세 : " + hm);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
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

body{
		    margin: 0;
		    padding: 0;
		}
		
		#menuImg{
		    float : left;
		    width: 400px;
		   height: 690px;
		    position: relative;
		}
		
		.menuBtn{
		    background-color: black;
		    color:white;
		    width: 100px;
		    height : 50px;
		    margin:30px;
		    opacity: 60%;
		    font-size: medium;
		    border : none;
		    width : 250px;
		    height: 60px;
		    cursor:pointer;
		    outline:none;
		}
		
		.menuBtn:hover{
		    opacity: 100%;
		}
		
		#adminLogo{
		    /*border : 1px solid red;*/
		    width : 150px;
		    position : absolute;
		    top : 50px;
		    left : 130px;
		}
		
		#title_Btns{
		    /*border : 1px solid blue;*/
		    position: absolute;
		    top : 280px;
		    left : 3px;
		}
		
		#title_link{
		    color : black;
		    width : 400px;
		    text-align: center;
		    font-size: 90px;
		    position: absolute;
		    left : 1px;
		    top : 150px;
		    text-decoration : none;
		    /*border : 1px solid orange;*/
		}
		
		#btnList{
		    list-style: none;
		    text-align: left;
		    margin-top : 10px;
		    
		}
		#btnList li{
		    /*border : 1px solid white;*/
		    margin-right: 40px;
		    height : 80px;
		}
		
     #wrapTitle{
            /*border: 1px solid red;*/
            text-align: center;
            padding-top: 30px;
            font-size: 40px;
            margin-top:0;
        }

    .summary{
        /*border: 1px solid blue;*/
        display : block;
        margin-left : 400px;
        width : 700px;
        float:center;
    }

    table{
        text-align: center;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        border-collapse: collapse;
        
    }

    th{
        padding-top : 7px;
        padding-bottom: 7px;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
    }

    td{
        padding-top : 3px;
        padding-bottom : 3px;
    }

    #fromSecond{
        border-bottom: 1px solid lightgray;
        height : 30px;
    }

    table{
        width:100%;
        margin-left : 25px;
    }

    #userMemTable{
        width: 650px;
    }

    #searchBtn{
        border: none;
        background : white;
        cursor: pointer;
        border-style: none;
    }

    .bottomSearch{
        display : block;
        margin-top: 30px;
        margin-left : 400px;
        width : 700px;
        height: 35px;
        text-align: center;
        
    }

    .bottomSearch select{
        background-color: gray;
        color: white;
        height : 34px;
        height: 34px;
        margin-right: -2px;
        border-radius: 8px 0px 0px 8px;
    }

    #searchMember{
        width : 250px;
        height : 30px;
        margin-left : -3px;
        border-radius: 0 8px 8px 0;
        border : 1px solid gray;
    }

    .bottomSearch img{
        height : 30px;
        padding : 0;
        margin-left:-2px;
    }

</style>
</head>
<body>
	<div class="leftMenu">
        <img src='../views/admin/adm_img/menuImg.jpg'id="menuImg">
        <a href="../views/admin/adm_first.jsp"><img src = "../views/admin/adm_img/adminLogo.png" id="adminLogo"></a>
        <a href="<%=request.getContextPath()%>/rmreport/list" id="title_link">Member</a>
        <div id="title_Btns">
            <ul id="btnList"> 
                <li><button class="menuBtn" id="userBtn" type="button">일반회원</button></li>
                <li><button class="menuBtn" id="hostBtn" type="button">임대인</button></li>
                <li><button class="menuBtn" id="outMemBtn" type="button">탈퇴회원</button></li>
            </ul>
            <script>
            	const userBtn = document.getElementById('userBtn');
            	userBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/usermem/list';
            	});
            	
            	const hostBtn = document.getElementById('hostBtn');
            	hostBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/hostmem/list';
            	});
            	
            	const outBtn = document.getElementById('outMemBtn');
            	outMemBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/outmem/list';
            	});
            </script>
        </div>
    </div>
    
    <div class="summary">
        <h2 id="wrapTitle">상세 회원 정보</h2>

        <hr><hr>
        <table id="userMemTable">
            <tr>
                <th>회원번호</th>
                <td><%= hm.getHst_no() %></td>
                <th>아이디</th>
                <td><%= hm.getHst_id() %></td>
            </tr>

            <tr id="fromSecond">
                <th>이름</th>
                <td><%= hm.getHst_name() %></td>
                <th>생일</th>
                <td><%= hm.getHst_birth() %></td>
            </tr>

            <tr id="fromSecond">
                <th>성별</th>
                <td><%= hm.getHst_gender() %></td>
                <th>이메일</th>
                <td><%= hm.getHst_email() %></td>
            </tr>

            <tr id="fromSecond">
                <th>연락처</th>
                <td><%= hm.getHst_phone() %></td>
                <th>활동상태</th>
                <td><%= hm.getHst_act() %></td>
            </tr>
            
            <tr id="fromSecond">
                <th>사업자번호</th>
                <td><%= hm.getHst_bsno() %></td>
                <th>사업자이름</th>
                <td><%= hm.getHst_bsname() %></td>
            </tr>

        </table>
    </div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="administrator.model.vo.*"%>
    
<%
	Sharehouse sh = (Sharehouse)request.getAttribute("houseDetail");
%>
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

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
        /* border: 1px solid black;
        border-bottom: 1px solid black; */
        border-collapse: collapse;
        width:100%;
        margin-left : 25px;
    }

    th{
        padding-top : 7px;
        padding-bottom: 7px;
       /*  border : 1px solid black; */
        width : 100px;
        background-color : lightgray;
    }

    td{
        padding-top : 3px;
        padding-bottom : 3px;
    }

    #fromSecond{
        /* border: 1px solid black; */
        height : 30px;
    }

    #userMemTable{
        width: 650px;
       /*  border : 1px solid black; */
    }
    
    .manageBtn{
    	border-style:none;
    	background-color : black;
    	color : white;
    	margin-left : 25px;
    	margin-top : 10px;
    	height : 50px;
    	width : 100px;
    }

</style>
</head>
<body>
	 <div class="leftMenu">
        <img src='${pageContext.request.contextPath}/views/admin/adm_img/menuImg.jpg'id="menuImg">
       <a href="${pageContext.request.contextPath}/views/admin/adm_first.jsp"><img src = "${pageContext.request.contextPath}/views/admin/adm_img/adminLogo.png" id="adminLogo"></a>
        <a href="<%=request.getContextPath()%>/shreport/list" id="title_link">Share House</a>
        <div id="title_Btns">
            <ul id="btnList"> 
          <br><br><br>
                <li><button class="menuBtn" id="shBtn" type="button">쉐어하우스 리스트</button></li>
                <li><button class="menuBtn" id="delShBtn" type="button">삭제된 매물보기</button></li>
            </ul>
             <script>
            	const shBtn = document.getElementById('shBtn');
            	shBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/sharehouse/list';
            	});
            	
            	const delShBtn = document.getElementById('delShBtn');
            	delShBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/delsharehouse/list';
            	});

            </script>
        </div>
    </div>
    
    <div class="summary">
        <h2 id="wrapTitle">상세 쉐어하우스 정보</h2>

        <hr>
        <table id="userMemTable">
            <tr>
                <th>매물번호</th>
                <td><%= sh.getSh_no() %></td>
                <th>이름</th>
                <td><%= sh.getSh_title() %></td>
                <th>임대인 번호</th>
                <td><%= sh.getHst_no() %></td>
            </tr>

            <tr id="fromSecond">
                <th>타입</th>
                <td><%= sh.getSh_type() %></td>
                <th>상태</th>
                <td colspan='3'><%= sh.getSh_status() %></td>
                
            </tr>
            
            <tr>
            	<th>소개</th>
                <td colspan="5"><%= sh.getSh_intro() %></td>
            </tr>

            <tr id="fromSecond">
                <th>주소</th>
                <td colspan="5"><%= sh.getSh_address() %></td>
                
            </tr>

            <tr id="fromSecond">
                <th>등록일</th>
                <td><%= sh.getSh_date() %></td>
                <th>예정마감일</th>
                <td colspan='3'><%= sh.getSh_deldate() %></td>
            </tr>
            


        </table>
    </div>

    <div id="btnBox">
        <button class="manageBtn" id="incomeBtn1" type="button" id="deleteBtn">삭제시키기</button>
        <button class="manageBtn" id="incomeBtn3" type="button" onclick="history.back()">뒤로가기</button>
    </div>
    
    <script>
    	const deleteBtn = document.getElementById("deleteBtn")
    	deleteBtn = addEventListener('click', function(){
    		location.href="<%=request.getContextPath()%>/adm/delete/sh?shno="+'<%=sh.getSh_no()%>';
    	})
    </script>
</body>
</html>
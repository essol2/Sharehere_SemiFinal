<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, house.model.vo.*"%>
<%
ArrayList<HouseInfo> houseinfo = (ArrayList<HouseInfo>)request.getAttribute("houseinfo");
String shNo = (String)request.getAttribute("shNo");
ArrayList<HostRoom> room = (ArrayList<HostRoom>)request.getAttribute("room");
%>      
    
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>예약 페이지</title>
<!-- navi css 경로 -->
<link href="<%= request.getContextPath() %>/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">
<!-- 글씨체 -->
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
   rel="stylesheet">
 <style>
 /*글씨체*/
*{
font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
}
         /* 첫번째 섹션(하우스이미지, 이름, 정보 테이블 표시) */
       .section1{
          
           width : 100%;
       }
       /* 하우스이미지 섹션 */
       .houseimagesection{
           width : 100%;
       }
       /* 하우스 이미지 */
       .houseimage{
           width :100%;
       }
       /*하우스 임대인 정보 테이블*/
       .houseinfotable{
       		width : 100%;
       }
       .houseinfotable td, .houseinfotable th{
       		padding: 2%;
       }
       /* 하우스 이름 및 테이블 섹션 */
       .tablesection{
           text-align: center;
       }
		/*예약폼 스타일*/
		.reservationForm{
		width : 100%;
		text-align: center;
		
		}
		/* 예약 테이블 */
		.reservationroomtable{
		 margin-left: 15%;
		 width : 70%;
		 height : 100px;
         text-align: center;
		}
       
       /* 2번,3번, 부가설명 텍스트 */
       .explanation {
           color : gray;
       }

       /* 2번문항 라디오버튼 */
      	.btnArea{
		text-align:center;
      	
      	}
         
       
       /* 신청하기버튼 */
       #appBtn{
           
           background-color: black;
           color:white;
           width : 10%;
           height: 35%;
           
       }
    	#res{
    		padding-left: 5%;
    	}
    </style>
  
</head>
<body>
<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/navi.jsp"%>
	<br><br><br>
	<hr>
 <!-- 첫번째 섹션(하우스이미지, 이름, 정보 테이블 표시) -->
   <div class="section1">
   <% for(HouseInfo hi : houseinfo) { %>
       <!-- 하우스이미지 섹션 -->
       <div class="container">
	  <div class="row">
	    <div class="col">
	          <div class="houseimagesection">
        <img src="<%= request.getContextPath() %><%= hi.getShIpath() %><%= hi.getShChName() %>" 
        class="houseimage" alt="하우스이미지영역">
    	</div>
	    </div>
	    <div class="col" style="padding: 5%;">
	  <!-- 하우스 이름 테이블섹션 -->
    <div class="tablesection">
        <h2 class="housename"><%= hi.getShTitle() %></h2><br>
        <table class="houseinfotable" border="1">
            <tr>
             <th bgcolor="black" style="color: white;">주택유형</th>
             <td><%= hi.getShType() %></td>
             
             <th bgcolor="black" style="color: white;">관리자</th>
             <td><%= hi.getHstName() %></td>
         </tr>
         <tr>
         	 <th bgcolor="black" style="color: white;">주소</th>
             <td><%= hi.getShAddress() %></td>
             
             <th bgcolor="black" style="color: white;">연락처</th>
             <td><%= hi.getHstPhone() %></td>
         </tr>
         <tr>
             <th bgcolor="black" style="color: white;">등록날짜</th>
             <td><%= hi.getShDate() %></td>
             <th bgcolor="black" style="color: white;">주택구조</th>
             <td><%= hi.getShStr() %></td>
         </tr>
        </table>
    </div>
	    </div>
	  </div>
	  </div>
  </div>
	<hr>
   <br><br><br>
   <!-- 예약 폼 -->
   <div class="section2">
    <form class="reservationForm" action="<%= request.getContextPath() %>/insert/reservation" method="post" onsubmit="return validate();">
    <br><br><br>
    	<input type="hidden" name="shNo" value="<%= hi.getShNo() %>">
    <% } %>
        <h2>1.원하시는 방을 선택해주세요.</h2>
        <br><br>
        <table class="reservationroomtable" border="1">
            <tr bgcolor="black" style="color:white ">
                <th>방번호</th>
                <th>이름</th>
                <th>성별</th>
                <th>타입</th>
                <th>면적</th>
                <th>보증금</th>
                <th>월세</th>
                <th>입주가능일</th>
                <th>선택</th>
            </tr>
            <% for(int r = 0; r < room.size(); r++) { %>
            <tr>
                <td><%= room.get(r).getShRno() %></td>
                <td><%= room.get(r).getShRname() %></td>
                <td><%= room.get(r).getShGender() %></td>
                <td><%= room.get(r).getShRtype() %></td>
                <td><%= room.get(r).getShRarea() %>m²</td>
                <td><%= room.get(r).getShDeposit() %></td>
                <td><%= room.get(r).getShMonthly() %></td>
                <td><%= room.get(r).getShRdate() %></td>
                <% if (room.get(r).getShCapacity() > 0) { %>
                <td><input type="checkbox" id="cha" name="check" value="<%= room.get(r).getShRno() %>" 
                    onclick = 'checkOnlyOne(this)' ></td>
				<% } else { %> 
				<td><input type="checkbox" id="cha" name="check" value="<%= room.get(r).getShRno() %>" 
                    onclick = 'checkOnlyOne(this)' ></td>
                <% } %>       
            </tr>
             <input type="hidden" name="shrdate" value="<%= room.get(r).getShRdate() %>">
            <% } %>
           
        
        </table>
        <br><br><br><br><br><br>

        <h2>2.희망하는 거주기간을 선택해주세요.</h2>
        <p class="explanation">ShareHere은 6개월 계약을 기본으로 합니다.<br>
        거주기간 선택시 참고해 주세요.
        </p>
        <div class="btnArea">
        <input type="radio" id="sixmonth" name="period" value="6개월" required>
        <label for="sixmonth">6개월</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" id="oneyear" name="period" value="1년" required>
        <label for="oneyear">1년</label>
        </div>
        <br><br><br><br><br><br>

        <h2>3.예약하실 날짜를 선택해주세요.</h2>
        <p class="explanation">예약일이 빠를수록 입주에 유리합니다.<br>
       						      매물에 등록된 입주가능일 30일전부터 예약이 가능합니다.</p>
        
       
        <input type="date" name="rvdate" required>
        <br><br><br> <br><br><br>
		
                  <button id="appBtn" type="submit">신청하기</button>
            
            <br><br><br>	  
    </form>
   </div>
   <!--  페이지를 이동해도 footer는 계속 하단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>
</body>

<!-- 유효성 검사(방2개 이상 선택 시 알러트창띄우기, 날짜 선택시 입주가능일 비교하여 한달전부터 예약가능, 수용인원0이면 체크박스 체크못하게)  -->
<script>
//예약날짜 유효성 검사
	var shrdate = document.getElementbyName('shrdate').val(); 	// 입주가능일
	console.log(shrdate);
	var rvdate = document.getElementbyName('rvdate').val();   	// 예약날짜
	console.log(rvdate);
	if(rvdate < shrdate - 30){
		alert("입주가능일 한달전부터 예약이 가능합니다.");
		}
		
	}
    }
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, house.model.vo.*"%>
<%
	ArrayList<HouseInfo> houseinfo = (ArrayList<HouseInfo>)request.getAttribute("houseinfo");
	String shNo = (String)request.getAttribute("shNo");
%>   

<!DOCTYPE html>
<html>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<head>
<meta charset="UTF-8">
<title>신고 페이지</title>
<!-- navi css 경로 -->
<link href="<%= request.getContextPath() %>/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">
<style>
 /* 첫번째 섹션(하우스이미지, 이름, 정보 테이블 표시) */
       .section1{
           
           width : 100%;
           height : 500px;
       }
       /* 하우스이미지 섹션 */
       .houseimagesection{
           
           width : 42%;
           height : 450px;
           margin-top: 20px;
           margin-left: 20px;
           float:left;
       }
       /* 하우스 이미지 */
       .houseimage{
           width :100%;
           height : 450px;
       }
       /* 하우스 이름 및 테이블 섹션 */
       .tablesection{
           
           width : 50%;
           height : 450px; 
           float: right;
           margin-top: 20px;
           margin-left: 0px;
           text-align: center;
       }
       /* 하우스 테이블 */
       .houseinfotable{
           border: 1px solid black;
           width: 75%;
           height: 60%;
           margin-top : 40px;
           margin-left : 150px;
       }
       /* 두 번째 섹션 */
	#reportForm{
	text-align : center;
	background: lightgray;
	width : 60%;
	margin-left: 380px;
	}
           
       }
       /* 매물 신고 사유 selectoption */
       #reason {
           height:35px;
       }

       /* 신고내용 textarea */
       #reportcontent {
           width : 33%;
           height : 150px;
           resize: none;
       }
       
       /* 버튼 영역 */
		.btnArea {
		text-align:center;
		padding : 50px;
	   }
       
       /* 신고하기 버튼*/
       #report {
          background-color: black;
          color : white; 
       }
       /* 취소하기 버튼 */
       #cancel {
       	  background-color: black;
          color : white; 
       } 
</style>
</head>
<body>
<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/navi.jsp"%>
	<br><br><br>
	
	<hr>
	<!-- 첫번째 섹션(얻어온 하우스 번호로 사진,하우스정보,방정보 출력) -->
   <div class="section1">
    <!-- 하우스이미지 섹션 -->
    
 <div class="houseimagesection">
 	<% for(HouseInfo hi : houseinfo) { %>
 	
     <img src="<%= request.getContextPath() %><%= hi.getShIpath() %><%= hi.getShChName() %>" 
     class="houseimage" alt="하우스대표사진영역">
 </div>
     <!-- 하우스 이름 테이블섹션 -->
 <div class="tablesection">
 <br><br>
     <h2 class="housename"><%= hi.getShTitle() %></h2>
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
<hr>
<!-- 2번째 섹션 -->
<div class="section2">
    <!-- 신고 폼 -->
  <form id="reportForm" action="<%= request.getContextPath() %>/insert/report" method="post" onsubmit="return validate();">
  		<br><br><br><br><br><br><br><br><br><br>
  		<input type="hidden" name="shNo" value="<%= hi.getShNo() %>">
  		<% } %>
        <h2> 매물 신고 사유</h2>
        <br>
        <select id="reason" name="rreason" required>
            <option value="허위/과장된 가격 정보를 가진 매물">허위/ 과장된 가격 정보를 가진 매물</option>
            <option value="거래가 완료되어 존재하지 않는 매물">거래가 완료되어 존재하지 않는 매물</option>
            <option value="경매 의심매물">경매 의심 매물</option>
            <option value="기타 사유로 정보가 부정확한 매물">기타 사유로 정보가 부정확한 매물</option>
        </select>
      
    <br><br><br>
    <h2> 신고 내용</h2>
    <br>
    <textarea  id="reportcontent" name="rcontent" placeholder="신고사유에 대한 구체적인 내용을 작성해 주세요." required></textarea>
    
    
  
    
    <div class="btnArea">
    <br><br><br><br><br>
    <button id="report" type="submit">신고하기</button>
    <button id="cancel" type="button" onclick="javascript:history.back();">취소하기</button>
    
    </div>

</form>
</div>

</body>
<!--  페이지를 이동해도 footer는 계속 하단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>

<script>
<!-- 유효성 검사  -->
// validate() 함수 작성 -> 신고 폼 유효성 검사
function validate(){
	// 신고사유, 신고내용 중 입력 되지 않은 값이 있을 시 alert 후 focus 처리 -> submit X
	if($("#reason").val().trim().length == 0){
		alert('신고사유를 선택해 주세요.');
		$("#reason").focus();
		return false;
	}
	
	if($("#reportcontent").val().trim().length == 0){
		alert('신고내용을 작성해 주세요.');
		$("#reportcontent").focus();
		return false;
	}
	return true;
}
	
</script>

		



</html>
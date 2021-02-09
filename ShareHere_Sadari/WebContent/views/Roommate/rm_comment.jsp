<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, roommate.model.vo.RoommateComment, administrator.model.vo.ADM_Admin, member.model.vo.*"%>
	

<%
	ArrayList<RoommateComment> comments = (ArrayList<RoommateComment>) request.getAttribute("comments");
	User user = (User) request.getSession().getAttribute("loginUser");
	Admin admin = (Admin)request.getSession().getAttribute("loginAdmin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<!-- navi css 경로 -->
<link
	href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rm_survey.css">
	
<!-- navi css 경로 -->
<link
	href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">

<style>
/* 바깥 영역 */
.outer {
	width: 60%;
	min-width: 850px;
	margin: auto;
	margin-top: 70px;
	margin-bottom: 70px;
}

/* 매거진 영역 */
.tableArea {
	padding: 20px;
	width: 600px;
	/* margin: auto; */
}

/* span 태그 */
.input_area {
	border: solid 1px #dadada;
	padding: 10px 10px 14px 10px;
	background: white;
}

/* input 태그 */
.input_area input {
	width: 550px;
	height: 30px;
	border: 0px;
}

/* textarea */
textarea {
	width: 550px;
	height: 300px;
	padding: 10px 10px 14px 10px;
	border: solid 1px #dadada;
}
/* 버튼 영역 */
.btnArea {
	text-align: center;
	padding: 50px;
}

td, h1{
	font-size : 30px;
	font-weight : bold;
	font-style : italic;
}

@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
figure.snip1200 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 220px;
  max-width: 310px;
  max-height: 310px;
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: center;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  font-size: 16px;
}
figure.snip1200 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;
}
figure.snip1200 img {
  max-width: 100%;
  position: relative;
  opacity: 0.9;
}
figure.snip1200 figcaption {
  position: absolute;
  top: 45%;
  left: 7%;
  right: 7%;
  bottom: 45%;
  border: 1px solid white;
  border-width: 1px 1px 0;
}
figure.snip1200 .heading {
  overflow: hidden;
  -webkit-transform: translateY(50%);
  transform: translateY(50%);
  position: absolute;
  bottom: 0;
  width: 100%;
}
figure.snip1200 h2 {
  display: table;
  margin: 0 auto;
  padding: 0 10px;
  position: relative;
  text-align: center;
  width: auto;
  text-transform: uppercase;
  font-weight: 400;
}
figure.snip1200 h2 span {
  font-weight: 800;
}
figure.snip1200 h2:before,
figure.snip1200 h2:after {
  position: absolute;
  display: block;
  width: 1000%;
  height: 1px;
  content: '';
  background: white;
  top: 50%;
}
figure.snip1200 h2:before {
  left: -1000%;
}
figure.snip1200 h2:after {
  right: -1000%;
}
figure.snip1200 p {
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  position: absolute;
  width: 100%;
  padding: 0 20px;
  margin: 0;
  opacity: 0;
  line-height: 1.6em;
  font-size: 0.9em;
}
figure.snip1200 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  z-index: 1;
}
figure.snip1200:hover img,
figure.snip1200.hover img {
  opacity: 0.25;
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
figure.snip1200:hover figcaption,
figure.snip1200.hover figcaption {
  top: 7%;
  bottom: 7%;
}
figure.snip1200:hover p,
figure.snip1200.hover p {
  opacity: 1;
  -webkit-transition-delay: 0.35s;
  transition-delay: 0.35s;
}


</style>
</head>

<body>
	<%@include file="/views/common/navi.jsp"%>
	

   
 <div class="outer" style="margin: auto;">
	  	<div class="col"><img src="${pageContext.request.contextPath}/resources/roommate/img/rm_cm_main2.png" style = "width : 100%;"></div>
		<br><br><br><br>
	        
   </div>
   
   <h1 style = "display : inline-block; margin-left : 5%;">매거진 들여다보기</h1>
   
   <br><br>
      
  	<div style = "width : 800px; display : inline-block; float : left; margin-left : 5%;">
    		  <table id="listTable">
				<% if(comments.isEmpty()){ %>
					<tr>
						<td colspan="5">존재하는 매칭 후기가 없습니다.</td>
					</tr>
					<% } else { %>
						<% for(RoommateComment c:comments){%>
						<tr>
							<td style = "visibility : hidden;"><%= c.getnNo() %></td> 
							<td><%= c.getnTitle() %><p style = "font-size : 15px; font-style : normal;">[<%= c.getnCount() %>]</p></td>
						</tr>
						<% } %>
						<% } %>				
				</table>
				
					<!-- 글쓰기 기능 -->
					
			<br>
			<div style = "text-align : center;" >
			<% if(admin != null && admin.getAdm_id().equals("rm1004")) {%>
			<button id = "commentInsert" type = "button" class="btn btn-outline-secondary" style="margin-right: 80%;"> 작성하기 </button>
			<script>
			// 매칭 후기 작성하기
			const commentInsert = document.getElementById('commentInsert');
			commentInsert.addEventListener('click', function(){
				location.href = '<%= request.getContextPath() %>/views/Roommate/rm_commentInsert.jsp';
			});
			</script>
			<%} %>
			</div>
				
				
	</div>
	<div style = "display : inline-block; margin-left : 4cm;">
	
			<!-- 마우스 오버 시 사진 등장 -->
			
	<div class="row" >
    <div class="col" >
     	<figure class="snip1200">
  <img src="https://i.pinimg.com/564x/a1/ef/8e/a1ef8ee32828034cb8c040a84b6bbe53.jpg" alt="sq-sample32" />
  <figcaption>
    <p>룸메이트 후기 인터뷰에 참여해주시면 외식상품권 20만원과 에어프라이어를 드립니다. <br> shareHere28@sh.co.kr로 신청해주세요! </p>
    <div class="heading">
      <h2>룸메이트 <span> 이벤트</span></h2>
    </div>
  </figcaption>
  <a href="/SDR_ShareHere/views/Roommate/rm_comment_event.jsp"></a>
</figure>
    </div>
    <div class="col" >
      <figure class="snip1200">
  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
  <figcaption>
    <p>룸메이트 서비스는 더 나은 서울살이를 위해 만들어진 쉐어히어의<br> 서비스입니다 <br><br> >> 더 알아보기</p>
    <div class="heading" >
      <h2>About<span> US</span></h2>
    </div>
  </figcaption>
  <a href="/SDR_ShareHere/views/common/aboutus.jsp"></a>
</figure>
    </div>
</div>

<script>

/* Demo purposes only */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);
</script>
		</div>	
			<script>
			//후기 상세보기 
			$(function(){
				$("#listTable td").mouseenter(function(){
					$(this).parent().css({"color":"#26C6DA","cursor":"pointer"});
				}).mouseout(function(){
					$(this).parent().css({"color":"black"});
				}).click(function(){
					var num = $(this).parent().children().eq(0).text();	// 몇번째 게시글인지 불러오는거
					location.href="<%= request.getContextPath()%>/comment/detail?nno=" + num;
				});
			});
		</script>



<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
<%@include file="/views/common/footer.jsp"%>
</body>
</html>

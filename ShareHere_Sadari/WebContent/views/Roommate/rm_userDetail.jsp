<%@page import="roommate.model.vo.RoommateAttachment"%>
<%@page import="roommate.model.vo.RoommateUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User) request.getSession().getAttribute("loginUser");
	RoommateUser ru = (RoommateUser)request.getAttribute("ru");
	
	//request.setAttribute("attOne", attOne);
	RoommateAttachment rmat = (RoommateAttachment)request.getAttribute("attOne");
	String msg = (String)request.getAttribute("msg");
%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title>Room and Mate</title>
    <!-- navi css 경로 -->
	<link
	   href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	   rel="stylesheet" type="text/css">
	<!-- 타이틀 이미지 -->
	<link
	   href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
	   rel="shortcut icon" type="image/x-icon">
	</head>
	<!-- 글씨체 -->
	<link
	   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	   rel="stylesheet">
    
  </head>
  
<script src="https://code.jquery.com/jquery-latest.js"></script>

<% if(session.getAttribute("msg") != null) { %>
<script>
	alert('<%= session.getAttribute("msg") %>');
</script>
<%
	session.removeAttribute("msg");
	}
%>

<style>
.modal {
	margin-bottom : 50%;
    display: none; /* Hidden by default */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color:
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: auto; /* 15% from the top and centered */
    border: 1px solid #888;                         
}

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
 
 .half_background {
	background: linear-gradient(to top, yellow 50%, transparent 50%);
  }
 
 
  #snsAddressLink {
 	color: red;
 }
 
 #snsAddressLink:hover {
 	cursor:pointer;
 	color: blue;
 }
</style>

  <body>
   <!-- 네비게이션 바 유지-->
   <%@include file="/views/common/navi.jsp"%>
   <br><br><br><br>
   
   
   <div class="container marketing"> 
<div class="card" style="padding: 5%; border: 7px solid; border-radius: 40px;">
  <div class="card-body">
    <h1 class="card-title" style="text-align: center; font-size: 50px;"><%= ru.getrUserResult() %></h1><br>
    
    	<% if (ru.getrUserResult().equals("복세편살 바로나")) { %>
    		<span class="half_background" style="margin-left: 25%; font-size: 25px; font-style: italic;">세상 살아가기도 복잡한데 남의 눈치까지 봐야해?</span>
    	<% } else if (ru.getrUserResult().equals("어머님이 누구니")) { %>
    		<span class="half_background" style="margin-left: 25%; font-size: 25px; font-style: italic;">너무나도 잘 자라준 당신, 누구든 좋아할거에요</span>
    	<% } else if (ru.getrUserResult().equals("이성적 겉바속촉")) { %>
    		<span class="half_background" style="margin-left: 25%; font-size: 25px; font-style: italic;">선을 긋는 것이 아니라 개인의 공간을 지켜주고 싶은 당신</span>     		
    	<% } else { %>
    		<span class="half_background" style="margin-left: 25%; font-size: 25px; font-style: italic;">소심한 듯 하지만 그 안의 숨겨진 흥은 많은 당신!</span>  		    	
    	<% } %>
    
    	<% if (ru.getrUserResult().equals("복세편살 바로나")) { %>
    		<p class="card-text" style="text-align: center; font-size: 20px; width: 70%; margin: auto;"><small><br>
    		정열적이고 모든 것에 흥미 있어 이러한 태도가 다른 사람을 즐겁게 하는 겅우가 많아요. <br> 여러 가지에 모두 즐거워하는 편이어서 사람들을 기쁘게 하는 것이 나의 즐거움이기도 해요. <br> 매력이 넘치는 대화를 잘하며, 타인의 마음을 헤아리는데에도 이해가 빨라요. <br>상처를 안받는건 아닙니다! 우리한테도 방을 공유할때 룰은 필요해요! 
    		</small></p>
    	<% } else if (ru.getrUserResult().equals("어머님이 누구니")) { %>
    		<p class="card-text" style="text-align: center; font-size: 20px; width: 70%; margin: auto;"><small><br>
    		Hoxy,, 당신은 유교걸 유교보이..? 맘 속 깊이 ‘바름’ 이라는 것이 몸에 자리잡았네요. 자라나면서 부모님의 구속이 싫으셨을 수도 있고 좀 더 자유로운 삶을 꿈꿔본 적도 있었죠. 하지만 아시죠? 어머니이 누구니 유형이 가장 사람들 사이에서 인기가 좋다는 것! 저희 쉐어히어도 어머님이 누구니 유형을 가장 좋아한답니다. 앞으로도 좋은 매너로 좋은 룸메이트 생활 이어가시길 바랄게요 :)
    		</small></p>
    	<% } else if (ru.getrUserResult().equals("이성적 겉바속촉")) { %>
    		<p class="card-text" style="text-align: center; font-size: 20px; width: 70%; margin: auto;"><small><br>
    		가장 독립적이고 단호하며, 때때로 고집이 있을 때도 있어요. 하지만 한편으로는 자신이 가진 영감과 목적을 실현시키려는 의지와 결단력과 인내심이 뛰어나답니다. 목적달성을 위해서라면 시간과 노력을 바치는 편이기도 하죠. 남들은 모를 수 있지만 하나에 꽂히면 그것만은 완벽하게 마스터하려해요. 
			쉐어메이트와 문제가 생기면 너무 어렵게 생각하지말고 적극적으로 타협을 해보는건 어떨까요?
    		</small></p>	
    	<% } else { %>
    		<p class="card-text" style="text-align: center; font-size: 20px; width: 70%; margin: auto;"><small><br>
    		소통력이 뛰어나고 타인을 긍정적으로 변화시키려고 할 때가 많아요. <br> 억지로가 아니라 배려심 넘치는 접근방식으로요. <br> 자신이 아끼는 사람들을 위해 베풀려는 마음이 있습니다. <br> 이런 마음이 지나쳐 가끔은 상대방의 문제를 자기의 문제로 착각하기도 하죠.. <br>
			자기 문제가 아닌데 남의 행동을 통해 반면교사를 삼으려는 경우가 있다는거 쉐어히어는 다 알아요.
    		</small></p>		    	
    	<% } %> 	
    
  </div>

<br><br><br><br>
    <div class="row">
    <div class="container">
  <div class="row">
    <div class="col">
    <% if (rmat != null) { %>
	    	<% if (rmat.getrUserNo().equals(ru.getrUserNo())) { %>
	    	<img src="<%= request.getContextPath() %><%= rmat.getImgPath() %><%= rmat.getImgChName()%>" style="width: 500px; height: 500px; border-radius: 50%; border: solid 1px gray; margin: auto;">
    		<% } %>
	    <% } else { %>  
	     	<% if (ru.getrUserResult().equals("어머님이 누구니")) { %>
				<img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result1.PNG" style="width: 500px; height: 500px; border-radius: 50%; border: solid 1px gray; margin: auto;">
			<% } else if (ru.getrUserResult().equals("복세편살 바로나")) { %>
				<img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result2.PNG" style="width: 500px; height: 500px; border-radius: 50%; border: solid 1px gray; margin: auto;">
			<% } else if (ru.getrUserResult().equals("이성적 겉바속촉")) { %>
				<img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result3.PNG" style="width: 500px; height: 500px; border-radius: 50%; border: solid 1px gray; margin: auto;">	
			<% } else { %>
				<img src="${pageContext.request.contextPath}/resources/roommate/img/rm_result4.PNG" style="width: 500px; height: 500px; border-radius: 50%; border: solid 1px gray; margin: auto;">	
			<% } %>
	    <% } %>
    </div>
    <div class="col">
      <h2><%= ru.getrUserNo() %>회원님</h2><br>
        <p><%= ru.getrUserIntro() %></p>
      <table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col"><b></b></th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">희망 연령</th>
			      <td><%= ru.getRage() %>세</td>
			    </tr>
			    <tr>
			      <th scope="row">주거 타입</th>
			      <td><%= ru.getRlivingType()%></td>
			    </tr>
			    <tr>
			      <th scope="row">거주 기간</th>
			      <td colspan="2"><%= ru.getRlivingTerm() %></td>
			    </tr>
			    <tr>
			      <th scope="row">입주 날짜</th>
			      <td colspan="2"><%= ru.getrMoviInDate() %></td>
			    </tr>
			    <tr>
			      <th scope="row">회원 성별</th>
			      <td colspan="2"><%= ru.getrUserGender() %></td>
			    </tr>
			    <tr>
			      <th scope="row">희망 지역</th>
			      <td colspan="2"><%= ru.getrUserLocal() %></td>
			    </tr>
			    <tr>
			      <th scope="row">인스타 계정</th>
			      	<% if (ru.getrSnsAddress().equals("없음")) { %>
			      <td colspan="2"><span id="emptySnsAddress">
			      SNS 계정이 없습니다.</span></td>
			      	<% } else { %>
			      <td colspan="2"><span id="snsAddressLink">
			              <a href="http://instagram.com/<%= ru.getrSnsAddress() %>" target="_new">인스타그램 보러가기</a></span></td>
			      	<% } %>
 
			    </tr>
			  </tbody>
		</table>
  	</div>       
    <br><br><br><br>
    <div class="btnDiv" style="margin-left: 73%;">
	  <!-- 찜 -->
	  	<button type="button" id="keep" class="btn btn-secondary"
						style="background-color: rgb(0, 0, 0); color: white; border-color: black; width: 70px; height: 40px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
					</svg></button>
						
	  <!-- 매칭 -->
			<button type="button" id="matching" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"
						style="background-color: rgb(0, 0, 0); color: white; border-color: black; width: 70px; height: 40px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-person" viewBox="0 0 16 16">
  <path d="M12 1a1 1 0 0 1 1 1v10.755S12 11 8 11s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h8zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4z"/>
  <path d="M8 10a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
</svg>
						</button>
			
	  <!-- 신고 -->
			<button type="button" id="report" class="btn btn-warning"
						style="background-color: rgb(0, 0, 0); color: white; border-color: black; width: 70px; height: 40px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
					</svg></button>
					
	  <!-- 뒤로가기 -->
			<a class="btn btn-warning" style="background-color: black; border-color: black; color: white; width: 70px; height: 40px;" href="#" onclick="history.go(-1);">
			←</a> 
	  </div>
   </div>
 </div>
</div>
</div><!-- /.col-lg-4 -->
</div><!-- /.row -->
   
    <div id="myModal" class="modal" style="width: 40%; margin-left: 30%; margin-top: 7%;">
 
      <!-- Modal content -->
      <div class="modal-content" style="width : 75%; border-radius: 100px;">
                <p style="text-align: center;">
                <br>
                <img src="${pageContext.request.contextPath}/resources/roommate/img/logo.png" style="width : 150px; height : 130px; margin: auto;">
                <br><br><b><span style="font-size: 24pt; margin: auto;">신고</span></b>
                </p>
                <p style="text-align: center; line-height: 1.5;">
                                 신고 사유를 선택하세요.
                </p>
                <br>
               <form action="<%= request.getContextPath() %>/roommate/report" style="margin: auto;" method="post" id="reportForm">
                <div id="report_content" style="margin: auto;">
                
                <select class="form-select" aria-label="Default select example" name="reportContent" id="select">
				  <option selected>신고 사유</option>
				 	<option value="부적절한 언어사용">부적절한 언어사용</option>
					<option value="무리한 부탁요구">무리한 부탁요구</option>
					<option value="계속되는 연락">계속되는 연락</option>
					<option value="기타">기타</option>
				</select>
				
				</div>
                <br>
                
                <div class="form-floating">
				  <textarea class="form-control" name="reportText" style="width: 300px; height: 100px; resize: none;" id="reportText" placeholder="신고 내용을 입력하세요."></textarea>
				  <label for="reportText">신고 내용을 입력해주세요.</label>
				</div>
				
				<div id="output" style="text-align: center;"></div>
           		<br>
            	<input type="hidden" name="loginUser" value="<%= loginUser.getUserNo() %>">
            	<input type="hidden" name="rUserNo" value="<%= ru.getrUserNo() %>">				
            </form>
            
            	<script>
            	
            	var selected = "";
            	$("#select").change(onSelectChange);
            		
            	function onSelectChange() {
            		selected = $("#select option:selected");
            		var output = "";
            		if (selected.val() != 0) {
            			output = selected.text();
            		}
            		$("#output").html("<br><span style='font-size : 20px; color : red;'>" + output + "</span><br>신고 하시겠습니까?");
            	}
            	</script>
            	
            	<div class="container">
				  <div class="row">
				    <div class="col">
				      <button id="reportBtn" class="btn btn-outline-secondary" style="margin-left: 47%; width: 52%;">신고</button><br>
				    </div>
				    <div class="col">
				       <button id="closeBtn" class="btn btn-outline-secondary" style="width: 52%;" onClick="close_pop();">닫기</button>
				    <br><br>
				    </div>
				  </div>
				</div>
				<br>
 			</div>
      </div>
      
      <!-- 매칭 모달 -------------------------------------------------------- -->	
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">매칭</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form action="<%= request.getContextPath()%>/insert/matching" method="post" id="matchingForm">
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">매칭 성공 시 연락 받을 번호</label>
		            <input type="text" class="form-control" name="tel" id="recipient-name" placeholder="010-1234-5678">
		          </div>
		          <div class="mb-3">
		            <label for="message-text" class="col-form-label">메세지를 입력하세요.</label>
		            <textarea class="form-control" id="message-text" name="text" placeholder="ooo입니다. 매칭 요청합니다!"></textarea>
		          </div>
		          <input type="hidden" name="rUserNo" value="<%= ru.getrUserNo() %>">
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="sendMatchingForm" onclick="send();">매칭 요청 보내기</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
      
            <!-- 찜 중복 체크 폼 -->
            <form action="<%= request.getContextPath()%>/keep/idCheck" method="post" id="goToKeepUserIdCheckForm">
            	<input type="hidden" name="rUserNo" value="<%= ru.getrUserNo() %>">				      	
            </form>

    <script>
		
		
		// 신고 버튼
		const report = document.getElementById('report');
		report.addEventListener('click', function(){
			
         $('#myModal').show(500);	
		});	
		
		// 찜 버튼
		const keep = document.getElementById('keep');
		keep.addEventListener('click', function(){
			$("#goToKeepUserIdCheckForm").submit();
		});
		
		// 매칭 버튼
		const matching = document.getElementById('matching');
		matching.addEventListener('click', function(){
			$("#matchingForm").show();
		});
		
		
	</script>
	<script>
		const reportBtn = document.getElementById('reportBtn');
		reportBtn.addEventListener('click', function() {
			$('#reportForm').submit();	
		});
	</script>

	<script>
      	 function close_pop(flag) {
            $('#myModal').hide(500);
       	 };		
	</script>
	
	<!-- 매칭폼 전송 -->
	<script>
		const sendMatchingForm = document.getElementById('sendMatchingForm');
		sendMatchingForm.addEventListener('click', function() {
			$('#matchingForm').submit();	
		});
	</script>
	
    <br><br><br>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
    
    <!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>
  </body>
</html>


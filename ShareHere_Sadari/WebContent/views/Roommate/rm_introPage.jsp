<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User user = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- navi css 경로 -->
<link
	href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">
<!-- 글씨체 -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>RoomMate</title>

<style>
body {
	text-align: center;
}

.container {
	text-align: center;
	font-weight: bold;
	font-size: 20px;
	padding-top: 5%;
}

.wrap {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.button {
	width: 140px;
	height: 45px;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: #fff;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

.button:hover {
	background-color: #2EE59D;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: #fff;
	transform: translateY(-7px);
}

placeholder {
	font-style: italic;
	color: #E1FFE1;
	text-align: center;
}
</style>
</head>

<body>

	<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/navi.jsp"%>
	<br>
	<br>
	<br>

	<p>
	<h3 style="font-size: 40px;">당신은 어떤 룸메이트인가요?</h3>
	</p>


	<form name="sendResultForm" onsubmit="return send();"
		action="<%=request.getContextPath()%>/insert/survey/result"
		method="post">
		<div style="max-width: 70%; margin: auto; font-size: 15px;">
			<div class="row" style="padding: 30px;">
				<h4 style="font-size: 18px;">
					최대한 길게 입력해주세요! <br> <br>더 구체적이고 자세하게 적는 만큼 <b
						style="color: orangered;">신뢰도도 올라가고 매칭률도 올라간답니다!</b>
				</h4>
				<br>
				<div style="margin: auto; margin-top: 5%;">

						<span id="counter">0</span>/300 <br>
						
						<div class="form-floating">
  						<textarea name="intro" id="intro" class="form-control" 
  						style="height: 300px; resize:none; width: 50%; margin: auto;" placeholder="의미없는홀더"></textarea>
 						<label for="intro" style="height: 300px; width: 70%; margin-left: 15%;">생활패턴, 어떤 룸메이트를 선호하는지 등 자유롭게 적어주세요 :)</label>
						</div>
						
					<br>
					<button type="submit" class="button" style="margin-top: 4%;">
						룸메이트 보러가기</button>

					<script>
						$(document).ready(function() {
							//textarea에서 keyup 이벤트 발생했을 경우
							$("#intro").keyup(function() {
								//textarea의 길이 값 저장
								var inputLength = $(this).val().length;
								//카운터 안에 inputLength가 들어갈 수 있도록 지정
								$("#counter").html(inputLength);

								var remain = 300 - inputLength;

								if (remain >= 0)
									$("#counter").css("color", "black");
								else
									$("#counter").css("color", "red");
							});
						});
					</script>

				</div>
			</div>

		</div>

		<input type="hidden" name="local"
			value="<%=session.getAttribute("local")%>"> <input
			type="hidden" name="survey"
			value="<%=session.getAttribute("survey")%>"> <input
			type="hidden" name="userNo"
			value="<%=session.getAttribute("userNo")%>"> <input
			type="hidden" name="userGender"
			value="<%=session.getAttribute("userGender")%>"> <input
			type="hidden" name="livingTerm"
			value="<%=session.getAttribute("livingTerm")%>"> <input
			type="hidden" name="moveInDate"
			value="<%=session.getAttribute("moveInDate")%>"> <input
			type="hidden" name="livigTypeValue"
			value="<%=session.getAttribute("livigTypeValue")%>"> <input
			type="hidden" name="age" value="<%=session.getAttribute("age")%>">
		<input type="hidden" name="payAmount"
			value="<%=session.getAttribute("payAmount")%>">

	</form>

	<br>
	<br>
	<br>

	<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>

	<script>
		function send() {

			if (!document.sendResultForm.intro.value) { // intro 가 null일 때
				swal("Please!", "내용을 입력하세요!", "error");
				document.sendResultForm.intro.focus();

				return false;
			} else if (document.sendResultForm.intro.value < 50) {
				swal("Please!", "최소 50자 이상 입력하세요!", "error");
				document.sendResultForm.intro.focus();
				
				return false;
			}

			return true;
		}
	</script>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신고하기</title>
<style>
#report {
	background-color: rgb(245, 244, 244);
	text-align: center;
	border-radius: 5%;
	width: 400px;
	height: 300px;
	font-size: auto;
}

#logo {
	margin-top: 35px;
	width: 50px;
	height: 50px;
}
</style>

</head>
<body>
	<div id="report">

		<img src="img/logo.png" id="logo">
		<p class="report_reason">신고하시는 이유를 선택해주세요</p>
		<div>
			<select>
				<option>신고 사유</option>
				<option>부적절한 언어사용</option>
				<option>무리한 부탁요구</option>
				<option>계속되는 연락</option>
				<option>기타</option>
			</select>
		</div>
		<br>



		<p>신고하시겠습니까?</p>
		<br> <input type="button" id="report_yes"
			onclick="report_success();" value="예" /> <input type="button"
			id="report_no" onclick="report_fail();" value="아니오" />

	</div>


	<script>
		function report_success() {
			alert("신고가 접수되었습니다. 관리자 처리까지 최대 3일이 소요됩니다.");
		}
		function report_fail() {
			alert("신고를 취소하셨습니다.")
		}
	</script>

</body>
</html>
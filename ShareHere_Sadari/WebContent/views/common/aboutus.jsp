<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.0/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">
<!-- Custom styles for this template -->
<link href="carousel.css" rel="stylesheet">
<title>Hello, world!</title>

<style>
@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

</head>
<body>
</head>
<body>

	<header>
		<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
		<%@include file="/views/common/navi.jsp"%>
	</header>
	<br>
	<br>
	<div class="card bg-dark text-white">
		<img src="./img/aboutUs_img/aboutUsNonTextMainImg.png" class="card-img" alt="...">
		<div class="card-img-overlay">
			<h1 class="card-title" style="text-align: center; margin-top : 18%;">집으로 오는 당신의 발걸음이 즐거울 때까지 쉐어히어는 노력합니다</h1>
			<h3 class="card-text" style="text-align: center; margin-top : 5%;">Shall your steps to Sharehere be joyful</h3>
		</div>
	</div>
	<br>
	<br>
	<br>
	<img src="./img/aboutUs_img/aboutUsLogoImg.png"
		class="rounded mx-auto d-block" alt="...">
	<br>
	<br>
	<br>
	<div class="container"
		style="background-color: lightgray; padding: 2%; border-radius: 10px">
		<div class="row" style="width: 50%; margin: auto;">
			<div class="col-sm">
				<img src="./img/aboutUs_img/aboutUshouseImg.png"
					class="card-img-top" alt="...">
				<div class="card-body">
					<p class="card-text" style="text-align: center">house</p>
				</div>
			</div>
			<div class="col-sm" style="margin-top: 1.3%;">
				<img src="./img/aboutUs_img/aboutUsroommateImg.png"
					class="card-img-top" alt="...">
				<div class="card-body">
					<p class="card-text" style="text-align: center">roommate</p>
				</div>
			</div>
			<div class="col-sm">
				<img src="./img/aboutUs_img/aboutUshostImg.png" class="card-img-top"
					alt="...">
				<div class="card-body">
					<p class="card-text" style="text-align: center">host</p>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>

	<div class="card border-light mb-3"
		style="max-width: 40%; margin: auto;">
		<div class="card-body">
			<br>
			<h5 class="card-title" style="text-align: center">사회초년생들이 마음 편히
				다리 뻗고 잘 수 있는 공간을 드리고 싶은마음</h5>
			<br>
			<div class="card mb-10" style="max-width: 100%; border-style: none;">
				<div class="row g-0">
					<div class="col-md-4">
						<img src="./img/aboutUs_img/aboutUssadariImg.png" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<br>
							<p class="card-text" style="text-align: center">
								올라오는 매물은 많은데 날 위한 집은 어디에 있을까요? <br> 통장잔고, 안전, 학교와 직장까지의
								거리... <br> 이제 여러분들은 편하게 누리세요, <br> 걱정은 저희가 대신 해드리겠습니다.
								<br> 당신과 좋은 집, 좋은 인연을 이어주는 <br> 저희는 사다리입니다.
							</p>
							<p class="card-text"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="container">
		<!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
		<%@include file="/views/common/footer.jsp"%>
	</footer>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>
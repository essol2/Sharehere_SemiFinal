<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	
	 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>sharehere</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">

   <!-- Favicons -->
	<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
	<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
	<meta name="theme-color" content="#7952b3">

	 <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    <title>sharehere</title>
  </head>
  <body>
  
<div class="container">

    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath}/views/common/img/rmLogo.png" alt="" width="150px" height="130px">
      <h2>룸메이트 서비스 개인정보 수정</h2>
      <p class="lead">수정하고자 하는 정보를 입력해주세요.</p>
    </div>

    <div class="row g-1" style="margin-left:13%;">
      <div class="col-md-10 col-lg-10">
        <form action="<%= request.getContextPath() %>/update/rmuserinfo" method="post">
            <div class="col-12">
              <label for="rmlocal" class="form-label">희망 거주 지역 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="rmlocal" name="rmlocal" placeholder="서초구 강남구 송파구">
              <div class="invalid-feedback">
                	희망 거주 지역에 알맞은 정보를 입력해주세요.
              </div>
            </div>
            <br>
            <div class="col-12">
              <label for="rmage" class="form-label">희망 나이대 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="rmage" name="rmage" placeholder="20대">
              <div class="invalid-feedback">
                	희망 나이대에 알맞은 정보를 입력해주세요.
              </div>
            </div>
            <br>
            <div class="col-12">
              <label for="rmlivingtype" class="form-label">희망 주거 타입 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="rmlivingtype" name="rmlivingtype" placeholder="오피스텔 아파트">
              <div class="invalid-feedback">
                	희망 주거 타입에 알맞은 정보를 입력해주세요.
              </div>
            </div>
            <br>
            <div class="col-12">
              <label for="rmlivingterm" class="form-label">희망 거주 기간 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="rmlivingterm" name="rmlivingterm" placeholder="12개월">
              <div class="invalid-feedback">
                	희망 거주 기간에 알맞은 정보를 입력해주세요.
              </div>
            </div>
            <br>
            <div class="col-12">
              <label for="rmsns" class="form-label">SNS 주소</label>
              <input type="text" class="form-control" id="rmsns" name="rmsns" placeholder="https://www.instagram.com/abc123">
            </div>
            <br>
            <div class="col-12">
              <label for="moveindate" class="form-label">희망 입주 날짜 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="moveindate" name="moveindate" placeholder="9999-01-01">
              <div class="invalid-feedback">
                	희망 입주 날짜에 알맞은 정보를 입력해주세요.
              </div>
            </div>
            <br>
            <div class="col-12">
              <label for="rmintro" class="form-label">자기 소개 <span class="text-muted">(최소 50자 / 필수)</span></label>
              <textarea class="form-control" id="rmintro" name="rmintro" placeholder="안녕하세요! 잘 부탁드려요!"></textarea>
              <div class="invalid-feedback">
                	자기소개에 알맞은 정보를 입력해주세요.
              </div>
            </div>

          <hr class="my-4">

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address" required>개인 정보 수집에 동의합니다.</label>
          </div>
          <hr class="my-4">
          
          <button class="btn btn-outline-secondary" style="margin-left: 88%;" type="submit">확인</button>
        </form>
      </div>
    </div>
   </div> 
    
	<br><br><br><br>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
  </body>
</html>
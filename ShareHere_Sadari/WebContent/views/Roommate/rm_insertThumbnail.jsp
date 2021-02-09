<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<!-- 제이쿼리 라이브러리 추가 -->
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	
    <title>sharehere</title>
    
    <style>
    	#outer {
    		width: 30%;
    		margin: auto;
    		padding-top: 19%;
    	}
    </style>
</head>
<body>

<div id="outer">
	<form action="<%= request.getContextPath() %>/insert/thumbnail" method="post" enctype="multipart/form-data">
	  <div class="mb-3">
	    <label for="exampleInputEmail1" class="form-label">프로필 이미지 선택</label>

	    <input type="file" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="thumbnailImg" required>
	    <div id="emailHelp" class="form-text">본 서비스 목적 이외에는 재사용되지 않습니다.</div>
	  </div>
	  <div class="mb-3 form-check">
	    <input type="checkbox" class="form-check-input" id="exampleCheck1">
	    <label class="form-check-label" for="exampleCheck1">이미지 제공 동의</label>
	  </div>
	  
	  <div id="thumbnailImgArea">
		<img id="thumbnail">
	  </div>
				
	  <button type="submit" id="sendBtn" class="btn btn-warning" onclick="checkNotNull();">등록하기</button>
	</form>
</div>

<script>
	function checkNotNull() {
		// 프로필사진 미선택시 제출 x
		var sendBtn = document.getElementById('sendBtn');
		
		// 이미지 정보 제공 동의 미체크시 제출 x
		var sendBtn = document.getElementById('sendBtn');	
	}
</script>


<script>
	$(function () {
		// input type="file" 태그에 파일이 첨부될 때 동작하는 이벤트
		$("[type=file]").change(function() { 
			loadImg(this); // 이 메소드 실행
		});
	});
	
	function loadImg(element) { 
		// 첨부한 파일(element)을 판별해서 알맞은 위치에 preview 표현하기
		// console.log(element.name);
		
		// input type="file" 엘리먼트에 첨부 파일 속성, 첨부파일이 잘 존재하는지 확인
		if (element.files && element.files[0]) {
			// 파일을 읽어들일 FileReader 객체 생성
			var reader = new FileReader();
			
			// 파일 읽기가 다 완료 되었을 때 실행 되는 메소드
			reader.onload = function(e) {
				
				var selector;
				var size;
				
				// 셀렉터 선택
				switch(element.name) {
				case "thumbnailImg" :
					selector = "#thumbnail";
					size = {width:"550px", height:"300px", border:"solid 1px #dadada"};
					break;
				}
				
				$(selector).attr("src", e.target.result).css(size); // e.target.result : 이미지 경로, size : 미리 지정한 이미지 사이즈
				
				console.log(e);
				console.log(e.target);
				console.log(e.target.result);
			}
			
			// 파일 읽기 하는 메소드
			reader.readAsDataURL(element.files[0]); // element.files[0] : 내가 첨부한 파일
		}
	}	
</script>

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

 
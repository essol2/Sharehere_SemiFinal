<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSE 매물 등록 방정보</title>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
</head>
<body>
	<h2>방 정보</h2>
	<hr>
	<b id="sub">방은 최대 4개 입력할 수 있습니다. <br>
	 + 버튼을 누르시면 입력하실 수 있는 방 form이 나옵니다. <br> 
	 순서대로 입력해주세요!</b> 
	 <br><br>
<div id="roomInfo1" style="width: 100%; float: left;">
<span id="rbox"
	style="width: 50%; border: 1px solid black; padding: 1%;"> 
<b id="sub">1</b>
<!-- +X 버튼 -->
<button type="button" id="r_btn" onclick="addroom()">
<img src="https://cdn.iconscout.com/icon/free/png-64/plus-114-453164.png" style="width: 40px;">
</button> 
	<!-- 방 대표 사진 -->
	<div id="rp">
		<p id="title">방 대표 사진</p>
		<div>
			<input type="file" name="shRImg" id="rImg" class="inputRoom" style="border: 1px solid rgb(165, 165, 165);">
		</div>
		<div id="shRImgArea">
			<img id="Img">
		</div>
	</div>
	<div id="r1" name="shRoom">
		<!-- 방 이름 -->
		<div id="rp" style="padding-top: 10%;">
			<p id="title">방 이름</p>
			<input type="text" class="rName"
				placeholder="방 이름을 입력하세요.(ex. RoomA)" name="shRname" style="width:60%"/>
		</div>
		<!-- 타입 -->
		<div id="rp">
			<p id="title">타입</p>
			<b id="sub">1인실, 2인실, 3인실</b>
			<div style="padding-top: 1%;">
				<select name="shRtype" class="rType">
					<option class="option" value="" selected disabled>
						방 타입선택</option>
					<option class="option" value="1인실">1인실</option>
					<option class="option" value="2인실">2인실</option>
					<option class="option" value="3인실">3인실</option>
				</select>
			</div>
		</div>
		<!-- 성별 -->
		<div id="rp" style="padding-top: 4%;">
			<p id="title">성별</p>
			<div style="padding-top: 1%;">
				<select name="shGender" class="rType">
					<option class="option" value="" selected disabled>성별 선택</option>
					<option class="option" value="남녀공용">남녀공용</option>
					<option class="option" value="남성전용">남성전용</option>
					<option class="option" value="여성전용">여성전용</option>
				</select>
			</div>
		</div>
		<!-- 면적(방 면적) -->
		<div id="rp">
			<p id="title">면적(방 면적)</p>
			<input type="text" class="rArea"
				placeholder="방 면적을 입력하세요.(ex. 7.5)" name="shRarea" style="width:60%"/>
		</div>
		<!-- 보증금 -->
		<div id="rp">
			<p id="title">보증금</p>
			<input type="text" class="rDeposit"
				placeholder="보증금을 입력하세요.(ex. 300만원)" name="shDeposit" style="width:60%"/>
		</div>
		<!-- 관리비 -->
		<div id="rp">
			<p id="title">관리비</p>
			<input type="text" class="rAdmcost"
				placeholder="관리비를 입력하세요.(ex. 10만원)" name="shAdmcost" style="width:60%"/>
		</div>
		<!-- 월세 -->
		<div id="rp">
			<p id="title">월세</p>
			<input type="text" class="rMonth"
				placeholder="월세를 입력하세요.(ex. 40만원)" name="shMonthly" style="width:60%"/>
		</div>
		<!-- 입주 가능일 -->
		<div id="rp">
			<p id="title">입주 가능일</p>
			<input type="date" name="shRdate" class="rDate" style="width:60%">
		</div>
		<!-- 입주 가능한 방 인원 수-->
		<div id="rp">
			<p id="title">입주 가능한 방 인원 수</p>
			<input type="number" name="shCapacity"
				placeholder="인원 수는 4명까지 가능합니다." min="0" max="4"
				style="width: 60%" class="rCap" />
			</div>
		</div>
	
	</span> 
	<span id="rbox2"
		style="width: 50%; border: 1px solid black; padding: 1%;"> <!-- +X 버튼 -->
	<div class="rBtn">
		<b id="sub">2</b>
		<button type="button" id="rx_btn" onclick="cancelroom2()">
			<img
				src="https://cdn.iconscout.com/icon/free/png-64/remove-324-453166.png"
				style="width: 40px;">
		</button>
		<button type="button" id="r_btn" onclick="addroom2()">
			<img
				src="https://cdn.iconscout.com/icon/free/png-64/plus-114-453164.png"
				style="width: 40px;">
		</button>
	</div> 
	<!-- 방 대표 사진 -->
			<div id="rp">
				<p id="title">방 대표 사진</p>
				<div id="inputImg0"></div>
				<div id="shRImgArea0"></div>
			</div>
			<div id="r2"></div>
		</span>
	</div>
	
	<div id="roomInfo2" style="width: 100%; float: left;">
		<span id="rbox3"
			style="width: 50%; border: 1px solid black; padding: 1%;"> <!-- +X 버튼 -->
	<div class="rBtn">
		<b id="sub">3</b>
		<button type="button" id="rx_btn" onclick="cancelroom3()">
			<img
				src="https://cdn.iconscout.com/icon/free/png-64/remove-324-453166.png"
				style="width: 40px;">
		</button>
		<button type="button" id="r_btn" onclick="addroom3()">
			<img
				src="https://cdn.iconscout.com/icon/free/png-64/plus-114-453164.png"
				style="width: 40px;">
		</button>
	</div> <!-- 방 대표 사진 -->
		<div id="rp">
			<p id="title">방 대표 사진</p>
			<div id="inputImg1"></div>
			<div id="shRImgArea1"></div>
		</div>
		<div id="r3"></div>
	</span> <span id="rbox4"
		style="width: 50%; border: 1px solid black; padding: 1%;"> <!-- +X 버튼 -->
	<div class="rBtn" style="margin-bottom: 5px;">
		<b id="sub">4</b>
		<button type="button" id="rx_btn" onclick="cancelroom4()">
			<img
				src="https://cdn.iconscout.com/icon/free/png-64/remove-324-453166.png"
				style="width: 40px;">
		</button>
	</div> 
	<!-- 방 대표 사진 -->
		<div id="rp">
			<p id="title">방 대표 사진</p>
			<div id="inputImg2"></div>
			<div id="shRImgArea2"></div>
		</div>
		<div id="r4"></div>
		</span>
		</div>
	
	<!-- 제이쿼리 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script>
	// 방 정보 폼
	   $("#room2").hide();
		$("#rbox2").hide();
	   $("#rbox3").hide();
	   $("#rbox4").hide();
	   var r2 = true;
	   var r3 = true;
	   var r4 = true;
	   function addroom(){		    	
	   	if(r2 == true){
	           $("#rbox2").show();
	           $("#r2").append($("#r1").html());
	           r2 = false;
	           $("<input type='file' id='shRImg0' name='shRImg0'>").appendTo("#inputImg0");
	           $("<img id='Img0'>").appendTo("#shRImgArea0");
	         }
   	
    $(function(){
              // input type="file" 태그에 파일이 첨부 될 떄 동작하는 이벤트
              $("[type=file]").change(function(){
                 loadImgRoom(this);
                 console.log(this);
              });
           });
   	
          function loadImgRoom(element){
              // element를 판별해서 알맞은 위치에 preview 표현하기
              console.log(element.name);
              
              // input type="file" 엘리먼트에 첨부 파일 속성, 첨부파일이 잘 존재하는지 확인
              if(element.files && element.files[0]){
                 // 파일은 읽어들일 FileReader 객체 생성
                 var reader = new FileReader();
                 
                 // 파일 읽기가 다 완료 되었을 떄 실행 되는 메소드
                 reader.onload = function(e){
                    
                    var selector;
                    var size;
                    switch(element.name){
                    case "shRImg0" :
                       selector = "#Img0";
                       size = {width : "500px", height : "300px", border: "solid 1px #dadada"};
                       break;
   
                    }
                    $(selector).attr("src",e.target.result).css(size);
                 }
                 
                 // 파일 읽기 하는 메소드
                 reader.readAsDataURL(element.files[0]);
                 
              }
   	
  		}
   }
   function addroom2(){
       if(r3 == true){
           $("#room2").show();
           $("#rbox3").show();
           $("#r3").append($("#r1").html());
           
           $("<input type='file' id='shRImg1' name='shRImg1'>").appendTo("#inputImg1");
           $("<img id='Img1'>").appendTo("#shRImgArea1");
           
           r3 = false;
       }
   	
    $(function(){
              // input type="file" 태그에 파일이 첨부 될 떄 동작하는 이벤트
              $("[type=file]").change(function(){
                 loadImgRoom(this);
                 //console.log(this);
              });
           });
   	
          function loadImgRoom(element){
              // element를 판별해서 알맞은 위치에 preview 표현하기
              console.log(element.name);
              
              // input type="file" 엘리먼트에 첨부 파일 속성, 첨부파일이 잘 존재하는지 확인
              if(element.files && element.files[0]){
                 // 파일은 읽어들일 FileReader 객체 생성
                 var reader = new FileReader();
                 
                 // 파일 읽기가 다 완료 되었을 떄 실행 되는 메소드
                 reader.onload = function(e){
                    
                    var selector;
                    var size;
                    switch(element.name){
                    case "shRImg1" :
                       selector = "#Img1";
                       size = {width : "500px", height : "300px", border: "solid 1px #dadada"};
                       break;
   
                    }
                    $(selector).attr("src",e.target.result).css(size);
                 }
                 
                 // 파일 읽기 하는 메소드
                 reader.readAsDataURL(element.files[0]);
                 
              }
   	
  		}
       
   }
   function cancelroom2(){
       if(r2 == false){
       	$("#rImg0").val("");
       	$("#shRImg0").remove();
       	$("#Img0").remove();
           $("#r2").empty();
           $("#rbox2").hide();
           r2 = true;
       }
   }
   function addroom3(){
       if(r4 == true){
           $("#rbox4").show();
           $("#r4").append($("#r1").html());
           
           $("<input type='file' id='shRImg2' name='shRImg2'>").appendTo("#inputImg2");
           $("<img id='Img2'>").appendTo("#shRImgArea2");
           
           r4 = false;
       }
   	
    $(function(){
              // input type="file" 태그에 파일이 첨부 될 떄 동작하는 이벤트
              $("[type=file]").change(function(){
                 loadImgRoom(this);
                 //console.log(this);
              });
           });
   	
          function loadImgRoom(element){
              // element를 판별해서 알맞은 위치에 preview 표현하기
              console.log(element.name);
              
              // input type="file" 엘리먼트에 첨부 파일 속성, 첨부파일이 잘 존재하는지 확인
              if(element.files && element.files[0]){
                 // 파일은 읽어들일 FileReader 객체 생성
                 var reader = new FileReader();
                 
                 // 파일 읽기가 다 완료 되었을 떄 실행 되는 메소드
                 reader.onload = function(e){
                    
                    var selector;
                    var size;
                    switch(element.name){
                    case "shRImg2" :
                       selector = "#Img2";
                       size = {width : "500px", height : "300px", border: "solid 1px #dadada"};
                       break;
   
                    }
                    $(selector).attr("src",e.target.result).css(size);
                 }
                 
                 // 파일 읽기 하는 메소드
                 reader.readAsDataURL(element.files[0]);
                 
              }
   	
  		}
   }
   function cancelroom3(){
       if(r3 == false){
           $("#r3").empty();
           $("#rbox3").hide();
           $("#room2").hide();
           r3 = true;
           
           $("#rImg1").val("");
       	$("#shRImg1").remove();
       	$("#Img1").remove();
       }
   }
   function cancelroom4(){
       if(r4 == false){
           $("#r4").empty();
           $("#rbox4").hide();
           r4 = true;
           
           $("#rImg2").val("");
       	$("#shRImg2").remove();
       	$("#Img2").remove();
       }
   }
   
   $(function(){
            // input type="file" 태그에 파일이 첨부 될 떄 동작하는 이벤트
            $("[type=file]").change(function(){
               loadImgRoom(this);
               //console.log(this);
            });
         });
         
         function loadImgRoom(element){
            // element를 판별해서 알맞은 위치에 preview 표현하기
            //console.log(element.name);
            
            // input type="file" 엘리먼트에 첨부 파일 속성, 첨부파일이 잘 존재하는지 확인
            if(element.files && element.files[0]){
               // 파일은 읽어들일 FileReader 객체 생성
               var reader = new FileReader();
               
               // 파일 읽기가 다 완료 되었을 떄 실행 되는 메소드
               reader.onload = function(e){
                  
                  var selector;
                  var size;
                  switch(element.name){
                  case "shRImg" :
                     selector = "#Img";
                     size = {width : "500px", height : "300px", border: "solid 1px #dadada"};
                     break;
 
                  }
                  $(selector).attr("src",e.target.result).css(size);
               }
               
               // 파일 읽기 하는 메소드
               reader.readAsDataURL(element.files[0]);
               
            }
         }

    </script>
</body>
</html>
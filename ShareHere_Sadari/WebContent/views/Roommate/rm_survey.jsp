<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   User user = (User) session.getAttribute("loginUser");
%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <title>sharehere</title>
	<link rel="stylesheet"
	   href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	   integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	   crossorigin="anonymous">
	<link rel="stylesheet"
	   href="${pageContext.request.contextPath}/resources/roommate/css/rm_survey.css">
	
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
	   
	   <style>
	   	 a:link { color: black; text-decoration: none;}
	   	 button {outline: none;}
	   
	     article {
	     	width: 100%;
	     	height: 500px;
	     }
	   </style>

<body class="container">

   <!-- 네비게이션 바 유지-->
   <%@include file="/views/common/navi.jsp"%>
   <br>
   <br>
   <!--시작 페이지-->
      
        
  <script>
  $(function() {
	   $("#user_info_1").show();
  });
  </script>

   <!-- 지역설정 페이지 -->
   <article class="setarea">
      <div class="row">
         <div class="col">
            <br>
            <h1>관심지역을 클릭하세요!</h1>
            <br>
            <h6>
               <span style="color: #2EE59D; font-weight: bold;">최대 3개</span>까지 설정
               가능합니다.
            </h6>
            <br>
            <br>


            <!-- .disabled = true;를 통해 중복선택 방지 -->
            <div class="selectArea">
               <input type="button" value='강서구' name="강서구" id="gs"
                  class="selectBtn"
                  onclick="document.getElementById('gs').disabled = true;
               document.getElementById('gs').style.opacity='0.7';">
               <input type="button" value='강남구' name="강남구" id="gn"
                  class="selectBtn"
                  onclick="document.getElementById('gn').disabled = true;
               document.getElementById('gn').style.opacity='0.7';">
               <input type="button" value='구로구' name="구로구" id="gr"
                  class="selectBtn"
                  onclick="document.getElementById('gr').disabled = true;
               document.getElementById('gr').style.opacity='0.7';">
               <input type="button" value='노원구' name="노원구" id="nw"
                  class="selectBtn"
                  onclick="document.getElementById('nw').disabled = true;
               document.getElementById('nw').style.opacity='0.7';">
               <input type="button" value='도봉구' name="도봉구" id="db"
                  class="selectBtn"
                  onclick="document.getElementById('db').disabled = true;
               document.getElementById('db').style.opacity='0.7';">
               <input type="button" value='양천구' name="양천구" id="yc"
                  class="selectBtn"
                  onclick="document.getElementById('yc').disabled = true;
               document.getElementById('yc').style.opacity='0.7';">
               <input type="button" value='용산구' name="용산구" id="ys"
                  class="selectBtn"
                  onclick="document.getElementById('ys').disabled = true;
               document.getElementById('ys').style.opacity='0.7';">
               <input type="button" value='서대문구' name="서대문구" id="sdm"
                  class="selectBtn"
                  onclick="document.getElementById('sdm').disabled = true;
               document.getElementById('sdm').style.opacity='0.7';">
               <br> <input type="button" value='은평구' name="은평구" id="ep"
                  class="selectBtn"
                  onclick="document.getElementById('ep').disabled = true;
               document.getElementById('ep').style.opacity='0.7';">
               <input type="button" value='동작구' name="동작구" id="dj"
                  class="selectBtn"
                  onclick="document.getElementById('dj').disabled = true;
               document.getElementById('dj').style.opacity='0.7';">
               <input type="button" value='관악구' name="관악구" id="ga"
                  class="selectBtn"
                  onclick="document.getElementById('ga').disabled = true;
               document.getElementById('ga').style.opacity='0.7';">
               <input type="button" value=' 중구' name="중구" id="ju"
                  class="selectBtn"
                  onclick="document.getElementById('ju').disabled = true;
               document.getElementById('ju').style.opacity='0.7';">
               <input type="button" value='서초구' name="서초구" id="sc"
                  class="selectBtn"
                  onclick="document.getElementById('sc').disabled = true;
               document.getElementById('sc').style.opacity='0.7';">
               <input type="button" value='송파구' name="송파구" id="sp"
                  class="selectBtn"
                  onclick="document.getElementById('sp').disabled = true;
               document.getElementById('sp').style.opacity='0.7';">
               <input type="button" value='영등포구' name="영등포구" id="ydp"
                  class="selectBtn"
                  onclick="document.getElementById('ydp').disabled = true;
               document.getElementById('ydp').style.opacity='0.7';">
               <input type="button" value='상관없음' name="상관없음" id="ydp"
                  class="selectBtn"
                  onclick="document.getElementById('ydp').disabled = true;
               document.getElementById('noset').style.opacity='0.7';">
            </div>



            <!---------------------- 상세정보 입력 페이지------------ -->

            <form id="goIntroForm" action="<%=request.getContextPath()%>/roommate/insert/intro"
               method="post">
               <input id="localString" name="localString" type="hidden" required>
               <input id="surveyResult" name="surveyResult" type="hidden" required>
               <input id="livigTypeValue" name="livigTypeValue" type="hidden" required>
               <input id="payAmount" name="payAmount" type="hidden" required>
               <input id="livingTerm" name="livingTerm" type="hidden" required>
               <input id="moveInDate" name="moveInDate" type="hidden" required>
               <input id="age" name="age" type="hidden" required>
               <input id="snsAddress" name="snsAddress" type="hidden" required>
            </form>

            <br> <br> <br>
            <h6 style="font-weight: bold;">희망 거주 지역</h6>
            <br> <br>
            <div id="selectResult"
               style="font-size: 18px; font-weight: bold; color: #2EE59D"></div>
            <br> <br>

            <button id='resetBtn' type="button" class="button"
               onclick="reset();">관심지역 재설정</button>
            <button id='nextBtn' type="button" class="button"
               onclick="surveystart();">다음</button>
            <br>
         </div>
      </div>


   </article>


   <article id="user_info_1" class="user_info">
      <h1 style="text-align: center;">주거 형태를 선택하세요.</h1>
      <br>
      <br>
      <br>
      <form name="livingTypeForm">
         <div style="text-align: center;">
            <label><input type="checkbox" name="livingType" value="아파트">아파트</label>
            &nbsp;&nbsp; <label><input type="checkbox" name="livingType"
               value="오피스텔">오피스텔</label> &nbsp;&nbsp; <label><input
               type="checkbox" name="livingType" value="기숙사형">기숙사형</label>
            &nbsp;&nbsp; <label><input type="checkbox" name="livingType"
               value="하숙">하숙</label> &nbsp;&nbsp; <label><input
               type="checkbox" name="livingType" value="홈스테이">홈스테이</label>
            &nbsp;&nbsp; <label><input type="checkbox" name="livingType"
               value="쉐어하우스">쉐어하우스</label><br> <br>
            <br><br>
            <button id='nextBtn' type="button" class="button" style="margin: auto;" onclick="setUserInfo1();">다음</button>
         </div>
      </form>
   </article>


   <article id="user_info_2" class="user_info">
      <h1 style="text-align: center;">희망 금액대를 설정하세요.</h1>
      <br><br><br> <input type="range" id="volume"
         name="pay" step=100000 min="200000" max="1200000">

      <svg role="presentation" width="100%" height="16">
         <text class="range__point" x="0%" y="14" text-anchor="start">20만원</text>
         <text class="range__point" x="10%" y="14" text-anchor="middle">30만원</text>
         <text class="range__point" x="20%" y="14" text-anchor="middle">40만원</text>
         <text class="range__point" x="30%" y="14" text-anchor="middle">50만원</text>
         <text class="range__point" x="40%" y="14" text-anchor="middle">60만원</text>
         <text class="range__point" x="50%" y="14" text-anchor="middle">70만원</text>
         <text class="range__point" x="60%" y="14" text-anchor="middle">80만원</text>
         <text class="range__point" x="70%" y="14" text-anchor="middle">90만원</text>
         <text class="range__point" x="80%" y="14" text-anchor="middle">100만원</text>
         <text class="range__point" x="90%" y="14" text-anchor="middle">110만원</text>
         <text class="range__point" x="100%" y="14" text-anchor="end">120만원+</text>
      </svg>

      <br><br>
      <button id='nextBtn' type="button" class="button"
         onclick="setUserInfo2();">다음</button>
   </article>


   <article id="user_info_3" class="user_info">
      <h1 style="text-align: center;">룸메이트와 얼마나 함께 살기를 희망하시나요?</h1>
      <br> <br> <br>
      <form name="howLong">
         <div style="text-align: center;">
            <label><input type="checkbox" name="term" value="7일">7일이내</label>
            &nbsp;&nbsp; <label><input type="checkbox" name="term"
               value="1개월">1개월</label> &nbsp;&nbsp; <label><input
               type="checkbox" name="term" value="3개월">3개월</label> &nbsp;&nbsp; <label><input
               type="checkbox" name="term" value="6개월">6개월</label> &nbsp;&nbsp; <label><input
               type="checkbox" name="term" value="1년">1년</label> &nbsp;&nbsp; <label><input
               type="checkbox" name="term" value="2년">2년</label> <br> <br>
            <br>
            <button id='nextBtn' type="button" class="button"
               onclick="setUserInfo3();">다음</button>
         </div>
      </form>
   </article>

   <article id="user_info_4" class="user_info">
      <h1 style="text-align: center;">희망 입주 날짜를 선택하세요.</h1>
      <br>
      <br>
      <br>

      <form name="moveIn" style="text-align: center;">
         <input type="date" id="moveInDate" name="moveInDate"
            style="width: 400px; margin: auto;"> <br> <br>

         <br>
         <button id='nextBtn' type="button" class="button"
            onclick="setUserInfo4();">다음</button>
      </form>
   </article>

   <article id="user_info_5" class="user_info">
      <form name="rm_age" style="text-align: center;">
         <h1 style="text-align: center;">희망 룸메 나이대 설정하세요.</h1>
         <br>
         <br>
         <br> <input type="range" id="age" name="age" min="20" max="50"
            step=5 style="width: 100%; margin: auto;">
         <!--volume3  -->
         <svg role="presentation" width="100%" height="16">
         <text class="range__point" x="1%" y="14" text-anchor="middle">20</text>
         <text class="range__point" x="17%" y="14" text-anchor="middle">25</text>
         <text class="range__point" x="34%" y="14" text-anchor="middle">30</text>
         <text class="range__point" x="50%" y="14" text-anchor="middle">35</text>
         <text class="range__point" x="66%" y="14" text-anchor="middle">40</text>
         <text class="range__point" x="83%" y="14" text-anchor="middle">45</text>
         <text class="range__point" x="100%" y="14" text-anchor="end">50세이상</text></svg>

         <br>
         <br>
         <button id='nextBtn' type="button" class="button" onclick="setUserInfo5();">다음</button>
      </form>
   </article>

   <article id="user_info_6" class="user_info">
      <form name="sendSNS" style="text-align: center;">
         <h1 style="text-align: center;">인스타그램 아이디를 입력해주세요.</h1>
         <br> 
         
         <div class="form-floating mb-3">
  			<input type="text" class="form-control" name="snsId" id="snsId" style="width: 50%; margin: auto;" placeholder="없으면 '없음'이라고 기재해주세요.">
 			 <label for="snsId" style="width : 50%; margin-left: 8%;">인스타그램 아이디</label>
		</div>
         <!-- <input type="text" id="snsId" name="snsId"
            style="width: 50%;" placeholder="sns 계정 입력">  -->
            <br><br>
         <button id='nextBtn' type="button" class="button"
            onclick="setUserInfo6();">다음</button>
      </form>
   </article>

   <!-- 질문페이지 -->
   
     <article class="question">
   <div class="container">
  <div class="row">
  <div class="progress mt-5"><br>
  <div class="progress-bar" role="progressbar"
            style="width: calc(100 / 12 * 0%)"></div>
              </div>
              <h2 id="title" class="text-center mt-5" style="width: 150%;">나는 룸메이트와 같이 산 경험이 있다</h2>
    <div class="col" style="margin-top: 8%;">
      <button id="A" type="button" class="button mt-5" style="width: 250px;">그렇다</button>
    </div>
    <div class="col-6">

	  <br>
      <input id="type" type="hidden" value="EI"> 
      <div id="rm_img_div" style="margin: auto;">
      <img id="question_img" style="width: 100%; width: 100%;" src="${pageContext.request.contextPath}/resources/roommate/img/rm_ready.gif">      
      </div>
    </div>
    <div class="col" style="margin-top: 8%;">
       <button id="B" type="button" class="button mt-5" style="width: 250px; margin-left: 15%;">아니다</button>
    </div>
   </div>
</div>
   </article>
 
   <!-- `유형 -->
   <article class="result" style="height: 100%;">
      <img id="img_result" class="rounded-circle"
         src="${pageContext.request.contextPath}/resources/roommate/img/rm_result1.PNG"
         style="width: 400px; height: 400px; margin: auto;">
      <h2 id="animal" class="text-center mt-5" style = "color : #FA8258">룸메유형</h2>
      <h3 id="explain" class="text-center mt-5">설명</h3>
      <button id="to_intro" type="button" class="button mt-5"
         style="width: 250px;">
         ✨ 마지막 단계 ✨<br>자기소개 작성하기
      </button>
      <!-- SNS 공유하기 -->

       
   </article>
   <input type="hidden" id="EI" value="0">
   <input type="hidden" id="SN" value="0">
   <input type="hidden" id="TF" value="0">
   <input type="hidden" id="JP" value="0">

   <script>
      // 자기소개 입력 페이지로 넘어가는 버튼
      const to_intro = document.getElementById('to_intro');
      to_intro.addEventListener('click', function() {

         // 1. 선호하는 주거 형태(아파트, 오피스텔, 기숙사형, 하숙, 홈스테이, 쉐어하우스(체크박스)
         var checkedLivingTypeStr = "";
         $("#user_info_1 input[name=livingType]:checked").each(function() {
            checkedLivingTypeStr += " " + $(this).val();
            $("#livigTypeValue").attr("value", checkedLivingTypeStr);
         });


         // 2. 생각하는 금액
         var pay = $("#user_info_2 input[name=pay]").val();
         $("#payAmount").attr("value", pay);

         // 3. 희망 거주 기간
         var checkedTermStr = "";
         $("#user_info_3 input[name=term]:checked").each(function() {
            checkedTermStr += " " + $(this).val();
            $("#livingTerm").attr("value", checkedTermStr);
         });
            
         // 4. 희망 입주 날짜
         var moveInDate = $("#user_info_4 input[name=moveInDate]").val();
         $("#moveInDate").attr("value", moveInDate);

         // 5. 나이
         var age = $("#user_info_5 input[name=age]").val();
         $("#age").attr("value", age);

         // 6. sns 주소
         var snsId = $("#user_info_6 input[name=snsId]").val();
         $("#snsAddress").attr("value", snsId);

         // 7. 지역 설정
         var selectResult = document.getElementById('selectResult');
         $("#localString").attr("value", selectResult.innerHTML);

         // 8. 최종 결과
         var result = $("#animal").html();
         $("#surveyResult").attr("value", result);

         $("#goIntroForm").submit(); // 폼 제출   
      });
   </script>


   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
      crossorigin="anonymous"></script>
   <script>
      var num = 1;
      var q = {
         1 : {
            "progress" : "Question 1/12",
            "title" : "나는 집에 있는 시간보다 밖에있는 시간이 더 많다",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question1.jpg",
            "type" : "EI",
            "A" : "그렇다",
            "B" : "아니다"
         },
         2 : {
            "progress" : "Question 2/12",
            "title" : "나는 다른 사람들과 만나면서 에너지를 받는 편이다",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question2.jpg",
            "type" : "EI",
            "A" : "그렇다",
            "B" : "아니다"
         },
         3 : {
            "progress" : "Question 3/12",
            "title" : "나는 관종끼가 있다",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question3.jpg",
            "type" : "EI",
            "A" : "그렇다",
            "B" : "아니다"
         },
         4 : {
            "progress" : "Question 4/12",
            "title" : "나는 일찍자고 일찍일어나는 편이다(자정전에 잔다)",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question4.jfif",
            "type" : "SN",
            "A" : "그렇다",
            "B" : "아니다"
         },
         5 : {
            "progress" : "Question 5/12",
            "title" : "나는 오전에 준비하고 나가는 고정스케쥴을 가지고 있다(직장인/학생 등)",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question5.jfif",
            "type" : "SN",
            "A" : "그렇다",
            "B" : "아니다"
         },
         6 : {
            "progress" : "Question 6/12",
            "title" : "밤새 핸드폰을 하다가 동이 터야 잠에 든다",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question6.jfif",
            "type" : "SN",
            "A" : "그렇다",
            "B" : "아니다"
         },
         7 : {
            "progress" : "Question 7/12",
            "title" : "나는 방을 자주 치우는 편이다",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question7.gif",
            "type" : "TF",
            "A" : "그렇다",
            "B" : "아니다"
         },
         8 : {
            "progress" : "Question 8/12",
            "title" : "친구들로부터 깔끔하다는 이야기를 자주 듣는다",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question8.jpg",
            "type" : "TF",
            "A" : "그렇다",
            "B" : "아니다"
         },
         9 : {
            "progress" : "Question 9/12",
            "title" : "냄새에 민감하다",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question9.jfif",
            "type" : "TF",
            "A" : "그렇다",
            "B" : "아니다"
         },
         10 : {
            "progress" : "Question 10/12",
            "title" : "나는 나만의 공간과 시간이 필요하다",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question10.jfif",
            "type" : "JP",
            "A" : "그렇다",
            "B" : "아니다"
         },
         11 : {
            "progress" : "Question 11/12",
            "title" : "내 물건을 누군가와 공유하는 것에 민감하다 ",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question11.jpg",
            "type" : "JP",
            "A" : "그렇다",
            "B" : "아니다"
         },
         12 : {
            "progress" : "Question 12/12",
            "title" : "룸메이트가 조용한 생활패턴을 가지고 있으면 좋겠다",
            "src" : "${pageContext.request.contextPath}/resources/roommate/img/question12.jfif",
            "type" : "JP",
            "A" : "그렇다",
            "B" : "아니다"
         }

      }

      var result = {
    	         "ISTJ" : {
    	            "animal" : "어머님이 누구니",
    	            "explain" : "Hoxy,, 당신은 유교걸 유교보이..?  맘 속 깊이 ‘바름’ 이라는 것이 몸에 자리잡았네요. <br> <br>  자라나면서 부모님의 구속이 싫으셨을 수도 있고 좀 더 자유로운 삶을 꿈꿔본 적도 있었죠.하지만 아시죠?  어머니이 누구니 유형이 가장 사람들 사이에서 인기가 좋다는 것! <br>  저희 쉐어히어도 어머님이 누구니 유형을 가장 좋아한답니다.<br> 앞으로도 좋은 매너로 좋은 룸메이트 생활 이어가시길 바랄게요 :)  ",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result1.PNG"
    	         },
    	         "ISFJ" : {
    	            "animal" : "이성적 겉바속촉",
    	            "explain" : "가장 독립적이고 단호하며, 때때로 고집이 있을 때도 있어요. <br><br> 하지만 한편으로는 자신이 가진 영감과 목적을 실현시키려는 의지와 결단력과 인내심이 뛰어나답니다. 목적달성을 위해서라면 시간과 노력을 바치는 편이기도 하죠. 남들은 모를 수 있지만 하나에 꽂히면 그것만은 완벽하게 마스터하려해요. <br><br> 쉐어메이트와 문제가 생기면 너무 어렵게 생각하지말고 적극적으로 타협을 해보는건 어떨까요? ",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result3.PNG"
    	         },
    	         "INFJ" : {
    	            "animal" : "복세편살 바로나",
    	            "explain" : "여러 가지에 모두 즐거워하는 편이어서 사람들을 기쁘게 하는 것이 나의 즐거움이기도 해요. <br><br>  정열적이고 모든 것에 흥미 있어 이러한 태도가 다른 사람을 즐겁게 하는 겅우가 많아요. <br>매력이 넘치는 대화를 잘하며, 타인의 마음을 헤아리는데에도 이해가 빨라요. <br> 그렇다고 상처를 안받는건 아닙니다! 우리한테도 방을 공유할때 룰은 필요해요! ",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result4.PNG"
    	         },
    	         "INTJ" : {
    	            "animal" : "이성적 겉바속촉",
    	            "explain" : "가장 독립적이고 단호하며, 때때로 고집이 있을 때도 있어요. <br><br> 하지만 한편으로는 자신이 가진 영감과 목적을 실현시키려는 의지와 결단력과 인내심이 뛰어나답니다. 목적달성을 위해서라면 시간과 노력을 바치는 편이기도 하죠. 남들은 모를 수 있지만 하나에 꽂히면 그것만은 완벽하게 마스터하려해요. <br><br> 쉐어메이트와 문제가 생기면 너무 어렵게 생각하지말고 적극적으로 타협을 해보는건 어떨까요? ",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result3.PNG"
    	         },
    	         "ISTP" : {
    	            "animal" : "친해지고 싶은 너",
    	            "explain" : "소통력이 뛰어나고 타인을 긍정적으로 변화시키려고 할 때가 많아요. <br> 억지로가 아니라 배려심 넘치는 접근방식으로요.  <br> <br> 자신이 아끼는 사람들을 위해 베풀려는 마음이 있습니다. <br> 이런 마음이 지나쳐 가끔은 상대방의 문제를 자기의 문제로 착각하기도 하죠.. <br> 자기 문제가 아닌데 남의 행동을 통해 반면교사를 삼으려는 경우가 있다는거 쉐어히어는 다 알아요.",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result2.PNG"
    	         },
    	         "ISFP" : {
    	            "animal" : "복세편살 바로나",
    	            "explain" : "여러 가지에 모두 즐거워하는 편이어서 사람들을 기쁘게 하는 것이 나의 즐거움이기도 해요. <br><br>  정열적이고 모든 것에 흥미 있어 이러한 태도가 다른 사람을 즐겁게 하는 겅우가 많아요.<br> 매력이 넘치는 대화를 잘하며, 타인의 마음을 헤아리는데에도 이해가 빨라요. <br> 그렇다고 상처를 안받는건 아닙니다! 우리한테도 방을 공유할때 룰은 필요해요!",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result4.PNG"
    	         },
    	         "INFP" : {
    	            "animal" : "복세편살 바로나",
    	            "explain" : "여러 가지에 모두 즐거워하는 편이어서 사람들을 기쁘게 하는 것이 나의 즐거움이기도 해요. <br><br>  정열적이고 모든 것에 흥미 있어 이러한 태도가 다른 사람을 즐겁게 하는 겅우가 많아요. <br>매력이 넘치는 대화를 잘하며, 타인의 마음을 헤아리는데에도 이해가 빨라요. <br>그렇다고 상처를 안받는건 아닙니다! 우리한테도 방을 공유할때 룰은 필요해요!",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result4.PNG"
    	         },
    	         "INTP" : {
    	            "animal" : "이성적 겉바속촉",
    	            "explain" : "가장 독립적이고 단호하며, 때때로 고집이 있을 때도 있어요. <br><br> 하지만 한편으로는 자신이 가진 영감과 목적을 실현시키려는 의지와 결단력과 인내심이 뛰어나답니다. 목적달성을 위해서라면 시간과 노력을 바치는 편이기도 하죠. 남들은 모를 수 있지만 하나에 꽂히면 그것만은 완벽하게 마스터하려해요. <br> <br>쉐어메이트와 문제가 생기면 너무 어렵게 생각하지말고 적극적으로 타협을 해보는건 어떨까요? ",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result3.PNG"
    	         },
    	         "ESTP" : {
    	            "animal" : "어머님이 누구니",
    	            "explain" : "Hoxy,, 당신은 유교걸 유교보이..?  맘 속 깊이 ‘바름’ 이라는 것이 몸에 자리잡았네요. <br> <br>  자라나면서 부모님의 구속이 싫으셨을 수도 있고 좀 더 자유로운 삶을 꿈꿔본 적도 있었죠.하지만 아시죠?  어머니이 누구니 유형이 가장 사람들 사이에서 인기가 좋다는 것! <br>  저희 쉐어히어도 어머님이 누구니 유형을 가장 좋아한답니다.<br> 앞으로도 좋은 매너로 좋은 룸메이트 생활 이어가시길 바랄게요 :)",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result1.PNG"
    	         },
    	         "ESFP" : {
    	            "animal" : "친해지고 싶은 너",
    	            "explain" : "소통력이 뛰어나고 타인을 긍정적으로 변화시키려고 할 때가 많아요. <br>억지로가 아니라 배려심 넘치는 접근방식으로요. <br>  <br> 자신이 아끼는 사람들을 위해 베풀려는 마음이 있습니다. <br> 이런 마음이 지나쳐 가끔은 상대방의 문제를 자기의 문제로 착각하기도 하죠.. <br> 자기 문제가 아닌데 남의 행동을 통해 반면교사를 삼으려는 경우가 있다는거 쉐어히어는 다 알아요.",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result2.PNG"
    	         },
    	         "ENFP" : {
    	            "animal" : "친해지고 싶은 너",
    	            "explain" : "소통력이 뛰어나고 타인을 긍정적으로 변화시키려고 할 때가 많아요. <br> 억지로가 아니라 배려심 넘치는 접근방식으로요. <br> <br> 자신이 아끼는 사람들을 위해 베풀려는 마음이 있습니다. <br> 이런 마음이 지나쳐 가끔은 상대방의 문제를 자기의 문제로 착각하기도 하죠.. <br> 자기 문제가 아닌데 남의 행동을 통해 반면교사를 삼으려는 경우가 있다는거 쉐어히어는 다 알아요.",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result2.PNG"
    	         },
    	         "ENTP" : {
    	            "animal" : "어머님이 누구니",
    	            "explain" : "Hoxy,, 당신은 유교걸 유교보이..?  맘 속 깊이 ‘바름’ 이라는 것이 몸에 자리잡았네요. <br> <br>  자라나면서 부모님의 구속이 싫으셨을 수도 있고 좀 더 자유로운 삶을 꿈꿔본 적도 있었죠.하지만 아시죠?  어머니이 누구니 유형이 가장 사람들 사이에서 인기가 좋다는 것! <br>  저희 쉐어히어도 어머님이 누구니 유형을 가장 좋아한답니다.<br> 앞으로도 좋은 매너로 좋은 룸메이트 생활 이어가시길 바랄게요 :)",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result1.PNG"
    	         },
    	         "ESTJ" : {
    	            "animal" : "어머님이 누구니",
    	            "explain" : "Hoxy,, 당신은 유교걸 유교보이..?  맘 속 깊이 ‘바름’ 이라는 것이 몸에 자리잡았네요. <br> <br>  자라나면서 부모님의 구속이 싫으셨을 수도 있고 좀 더 자유로운 삶을 꿈꿔본 적도 있었죠.하지만 아시죠?  어머니이 누구니 유형이 가장 사람들 사이에서 인기가 좋다는 것! <br>  저희 쉐어히어도 어머님이 누구니 유형을 가장 좋아한답니다.<br> 앞으로도 좋은 매너로 좋은 룸메이트 생활 이어가시길 바랄게요 :) ",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result1.PNG"
    	         },
    	         "ESFJ" : {
    	            "animal" : "친해지고 싶은 너",
    	            "explain" : "소통력이 뛰어나고 타인을 긍정적으로 변화시키려고 할 때가 많아요. <br> 억지로가 아니라 배려심 넘치는 접근방식으로요. <br> <br>  자신이 아끼는 사람들을 위해 베풀려는 마음이 있습니다. <br> 이런 마음이 지나쳐 가끔은 상대방의 문제를 자기의 문제로 착각하기도 하죠.. <br>자기 문제가 아닌데 남의 행동을 통해 반면교사를 삼으려는 경우가 있다는거 쉐어히어는 다 알아요.",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result2.PNG"
    	         },
    	         "ENFJ" : {
    	            "animal" : "복세편살 바로나 ",
    	            "explain" : "여러 가지에 모두 즐거워하는 편이어서 사람들을 기쁘게 하는 것이 나의 즐거움이기도 해요. <br><br>  정열적이고 모든 것에 흥미 있어 이러한 태도가 다른 사람을 즐겁게 하는 겅우가 많아요. <br>매력이 넘치는 대화를 잘하며, 타인의 마음을 헤아리는데에도 이해가 빨라요. <br> 그렇다고 상처를 안받는건 아닙니다! 우리한테도 방을 공유할때 룰은 필요해요!",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result4.PNG"
    	         },
    	         "ENTJ" : {
    	            "animal" : "이성적 겉바속촉",
    	            "explain" : "가장 독립적이고 단호하며, 때때로 고집이 있을 때도 있어요. <br><br> 하지만 한편으로는 자신이 가진 영감과 목적을 실현시키려는 의지와 결단력과 인내심이 뛰어나답니다. 목적달성을 위해서라면 시간과 노력을 바치는 편이기도 하죠. 남들은 모를 수 있지만 하나에 꽂히면 그것만은 완벽하게 마스터하려해요. <br> <br>쉐어메이트와 문제가 생기면 너무 어렵게 생각하지말고 적극적으로 타협을 해보는건 어떨까요? ",
    	            "src" : "${pageContext.request.contextPath}/resources/roommate/img/rm_result3.PNG"
    	         }
    	      }

      /*------------ 쿼리문 ----------*/

      function surveystart() {
         $(".setarea").hide();
         $(".question").show();
      }
      
      function setUserInfo1() {
         $("#user_info_1").hide();
         $("#user_info_2").show();

      }
      function setUserInfo2() {
         $("#user_info_2").hide();
         $("#user_info_3").show();
      }
      function setUserInfo3() {
         $("#user_info_3").hide();
         $("#user_info_4").show();
      }
      function setUserInfo4() {
         $("#user_info_4").hide();
         $("#user_info_5").show();
      }
      function setUserInfo5() {
         $("#user_info_5").hide();
         $("#user_info_6").show();
      }
      function setUserInfo6() {
         $("#user_info_6").hide();
         $(".setarea").show();
      }

      // 설문조사
      $("#A").click(function() {
         var type = $("#type").val();
         var preValue = $("#" + type).val();
         $("#" + type).val(parseInt(preValue) + 1);
         next();
      });
      $("#B").click(function() {
         next();
      });
      function next() {
         if (num == 13) {
            $(".question").hide();
            $(".result").show();
            var mbti = ""; // 여기에 결과 값이 담김 
            ($("#EI").val() < 2) ? mbti += "I" : mbti += "E";
            ($("#SN").val() < 2) ? mbti += "N" : mbti += "S";
            ($("#TF").val() < 2) ? mbti += "F" : mbti += "T";
            ($("#JP").val() < 2) ? mbti += "P" : mbti += "J";
            //  alert(mbti);  결과값을 눈으로 보고 싶을 때 - alert처리 해놓음
            console.log(mbti);
            $("#img").attr("src", result[mbti]["img"]);
            $("#img_result").attr("src", result[mbti]["src"]);
            console.log(result[mbti]["img"]);

            $("#animal").html(result[mbti]["animal"]);
            $("#explain").html(result[mbti]["explain"]);
         } else {
            $(".progress-bar").attr(
                  'style',
                  'width: calc(100/12*' + num
                        + '%); background-color: #2EE59D;');
            $("#progress").html(q[num]["progress"]);
            $("#title").html(q[num]["title"]);
            $("#type").val(q[num]["type"]);
            $("#question_img").attr(q[num], "src");
            $("#A").html(q[num]["A"]);
            $("#B").html(q[num]["B"]);
            num++;
         }
      }
   </script>

   <!-- 지역설정 코드 -->
   <script>
      $('.selectArea input').on('click',function(e) {

         // 선택한 지역 출력하기
         var selectResult = document.getElementById('selectResult');
         var StringRes = selectResult.innerHTML += e.target.value + " ";

         // 1. 지역을 4개 이상 선택했을 시 alert창 띄우고 값 지우기
         if (StringRes.length > 14) {
            alert("지역은 최대 3개까지 설정할 수 있습니다!");

            selectResult.innerHTML = ""; // 값 지우기
            // 리셋버튼 클릭시 비활성화 해체
            var resetBtn = document.getElementById('gs').disabled = false;
            var resetBtn = document.getElementById('gn').disabled = false;
            var resetBtn = document.getElementById('gr').disabled = false;
            var resetBtn = document.getElementById('nw').disabled = false;
            var resetBtn = document.getElementById('db').disabled = false;
            var resetBtn = document.getElementById('yc').disabled = false;
            var resetBtn = document.getElementById('ys').disabled = false;
            var resetBtn = document.getElementById('sdm').disabled = false;
            var resetBtn = document.getElementById('ep').disabled = false;
            var resetBtn = document.getElementById('dj').disabled = false;
            var resetBtn = document.getElementById('ga').disabled = false;
            var resetBtn = document.getElementById('ju').disabled = false;
            var resetBtn = document.getElementById('sc').disabled = false;
            var resetBtn = document.getElementById('sp').disabled = false;
            var resetBtn = document.getElementById('ydp').disabled = false;
            var resetBtn = document.getElementById('noset').disabled = false;

         }
      });

      // 리셋버튼
      // 1. 선택지역 초기화
      function reset() {
         var selectResult = document.getElementById('selectResult');
         selectResult.innerHTML = "";
      }

      // 2. 리셋버튼 클릭시 비활성화 해제
      $("#resetBtn").click(function() {
         var resetBtn = document.getElementById('gs').disabled = false;
         var resetBtn = document.getElementById('gn').disabled = false;
         var resetBtn = document.getElementById('gr').disabled = false;
         var resetBtn = document.getElementById('nw').disabled = false;
         var resetBtn = document.getElementById('db').disabled = false;
         var resetBtn = document.getElementById('yc').disabled = false;
         var resetBtn = document.getElementById('ys').disabled = false;
         var resetBtn = document.getElementById('sdm').disabled = false;
         var resetBtn = document.getElementById('ep').disabled = false;
         var resetBtn = document.getElementById('dj').disabled = false;
         var resetBtn = document.getElementById('ga').disabled = false;
         var resetBtn = document.getElementById('ju').disabled = false;
         var resetBtn = document.getElementById('sc').disabled = false;
         var resetBtn = document.getElementById('sp').disabled = false;
         var resetBtn = document.getElementById('ydp').disabled = false;
         var resetBtn = document.getElementById('noset').disabled = false;
      });
   </script>

   <br><br><br><br>
   <!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp"%>

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



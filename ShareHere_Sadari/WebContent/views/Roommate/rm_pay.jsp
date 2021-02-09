<%@page import="member.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User user = (User) request.getSession().getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roommate pay</title>
<!-- navi css 경로 -->
<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
<style>
	/* 전체 영역*/
	.outer{
		text-align : center;
	}
	/* 버튼 스타일*/
	#nextBtn {
		background-color: black;
        color : white;
        width : 100px; 
	}
	#cancelBtn{
		background-color: black;
        color : white;
        width : 100px;  
	}
	

</style>
</head>
<body>

  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  
<!--  페이지를 이동해도 Host_navi는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/navi.jsp" %>
	<br><br><br>
<!-- 결제 폼 -->
 <div class="outer">
    
    	
    	<div class="card text-center" style="height: 50%; width: 40%; margin: auto; padding: 1%;">
		  <div class="card-header">
		    <h2>룸메이트 서비스 결제를 시작합니다.</h2>
		    <h5>'취소하기'를 누르시면 이전 페이지로 돌아갑니다.</h5>
		  </div><br>
		  <div class="card-body">
		    <p class="card-text">
		    	<span class="select_area">
       		 		<input type="radio" name="rmitem" value="2주무제한권">
            		 <label for="2weeks">2주무제한권 / 3,900원</label>
      		  </span>	
		    </p><br>
		    <div class="btnArea">
				<button id="nextBtn" type="button">다음</button>
				<button id="cancelBtn" type="button" onclick="javascript:history.back();">취소하기</button>
			</div><br>
		  </div>
		  <div class="card-footer text-muted">
		    결제일로부터 2주간 무제한으로 룸메이트 서비스를 이용할 수 있습니다!
		  </div>
		</div>
 </div>   
 
 <!--  페이지를 이동해도 footer는 계속 하단에 노출되게끔 -->
	<%@include file="/views/common/footer.jsp"%>
	
	
<!-- 결제API 스크립트 -->
	<script>
			$("#nextBtn").click(function () {	
			// 라디오 버튼 클릭시 name 벨류값(상품명) 가져오기	
			var name = $('input[name="rmitem"]:checked').val();
			// 결제금액 가져오기
			var amount = 0;
			if(name == '2주무제한권'){
				amount = 3900;
			} 
			console.log(name);		
				
			var IMP = window.IMP; // 생략가능
			IMP.init('imp85155473');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			
			IMP.request_pay({
			pg: 'html5_inicis', // version 1.1.0부터 지원.
			/*
			'kakao':카카오페이,
			html5_inicis':이니시스(웹표준결제)
			'nice':나이스페이
			'jtnet':제이티넷
			'uplus':LG유플러스
			'danal':다날
			'payco':페이코
			'syrup':시럽페이
			'paypal':페이팔
			*/
			pay_method: 'card',
			/*
			'samsung':삼성페이,
			'card':신용카드,
			'trans':실시간계좌이체,
			'vbank':가상계좌,
			'phone':휴대폰소액결제
			*/
			merchant_uid: 'merchant_' + new Date().getTime(),
			/*
			merchant_uid에 경우
			https://docs.iamport.kr/implementation/payment
			위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			참고하세요.
			나중에 포스팅 해볼게요.
			*/
			//결제창에서 보여질 이름 (6개월권, 1년권인지 판별해야함)
			//name: '6개월권',
			name: name,
			//가격 (6개월이면 100원, 1년이면 200원으로 설정되야함)
			//amount: 100,
			amount: amount,
			

			//결제 마지막 결제내역 확인란(이메일, 이름만보임)
			
			//임대인의 이메일
			//buyer_email: 'iamport@siot.do',
			
			buyer_email:"<%= user.getUserEmail()%>",
			
			//임대인의 이름
			//buyer_name: '구매자이름',
			
			buyer_name:"<%= user.getUserName() %>",
			
			//임대인의 휴대전화
			//buyer_tel: '010-1234-5678',
			
			buyer_tel:"<%= user.getUserPhone() %>",
			
			//임대인의주소
			//buyer_addr: '서울특별시 강남구 삼성동',
			/*
			모바일 결제시,
			결제가 끝나고 랜딩되는 URL을 지정
			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			*/
			buyer_postcode: '123-456',
			m_redirect_url: 'https://www.yourdomain.com/payments/complete'
			}, 
			
			
			function (rsp) {
			console.log(rsp);
			
			// 결제 성공 시  로직
			if (rsp.success) {
			// 결제 후 ALERT창	-> InsertHstpayservlet 이동 -> 매물등록jsp로이동
			var msg = '결제가 완료되었습니다! 룸메이트 상세보기 서비스 이용이 가능합니다!' + '\n';
			//msg += '고유ID : ' + rsp.imp_uid;
			//msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 항목 : ' + rsp.name + '\n';
			msg += '결제 금액 : ' + rsp.paid_amount + '원';
			//msg += '카드 승인번호 : ' + rsp.apply_num;
			
			// GET방식으로 name값(결제항목), amount값(결제금액) servlet으로 보내기
			location.href='<%= request.getContextPath()%>/insert/rmpay?name=' + name + '&amount=' + amount;
			} else {// 결제 실패 시 로직
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			
			}
			alert(msg);
			});
			});
	</script>
	
</body>
</html>
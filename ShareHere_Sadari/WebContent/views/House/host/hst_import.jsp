<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>아임포트 결제</title>
</head>
<body>
  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  	<p>
	    <p>아임 서포트 결제 모듈 테스트 해보기</p>
	    <button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>
	</p>
	
	<script>
			$("#check_module").click(function () {
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
			name: '주문명:결제테스트',
			//가격 (6개월이면 100원, 1년이면 200원으로 설정되야함)
			amount: 100,
			
			//결제 마지막 결제내역 확인란(이메일, 이름만보임)
			
			//임대인의 이메일
			buyer_email: 'iamport@siot.do',
			//임대인의 이름
			buyer_name: '구매자이름',
			//임대인의 휴대전화
			buyer_tel: '010-1234-5678',
			//임대인의주소
			buyer_addr: '서울특별시 강남구 삼성동',
			/*
			모바일 결제시,
			결제가 끝나고 랜딩되는 URL을 지정
			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			*/
			buyer_postcode: '123-456',
			m_redirect_url: 'https://www.yourdomain.com/payments/complete'
			}, function (rsp) {
			console.log(rsp);
			if (rsp.success) {
			
			// 결제 후 ALERT창	
	
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
			});
			});
	</script>










</body>

</html>
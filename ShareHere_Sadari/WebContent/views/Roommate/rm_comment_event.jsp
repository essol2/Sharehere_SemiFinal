<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="member.model.vo.User"%>
<%	User user = (User) request.getSession().getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- navi css 경로 -->
<link
	href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/rm_survey.css">
	
<!-- navi css 경로 -->
<link
	href="${pageContext.request.contextPath}/views/common/nav_foot.css"
	rel="stylesheet" type="text/css">
<style>
h1, p {
 text-align : center;
}
</style>
</head>
<body>
	<%@include file="/views/common/navi.jsp"%>
	<br><br><br><br>
<div>

    <h1> 룸메이트 매칭에 성공하셨나요? </h1>
    <br>
    <p class="content"> 안녕하세요 사다리입니다. 저희 룸메이트 서비스를 이용해주셔서 감사합니다. </p>
    <img id="question_img" class="mt-5" style = "display: block; margin: 0px auto;"
         src="${pageContext.request.contextPath}/views/common/img/aboutUs_img/aboutUssadariImg.png" >
         <br><br>
    <p style="margin: auto; width: 60%;">
    <span style="font-size : 25px;"> 사다리가 준비한 쉐어히어 매칭 후기 이벤트! </span> <br><br> 

   <span style="font-size : 20px; color : red;">※ [필독] 주의사항 - 이벤트 기간은 4월5일까지입니다! ※ </span> <br>
저희 쉐어히어 메일로 어떤 경로로 서로를 만나게되었으며 현재 어떻게 생활하고 있는지 알려주세요! 
<br>내부 심사후에 인터뷰 요청을 드립니다. (웬만하면 거의 다 받아요 찡긋-) <br> 다만, 거짓이나 허위의 사연을 올려주시면 법적책임을 물어야할 수 있으니 다음번 이벤트를 기다려주세요. 
<br>항상 저희 사다리는 많은 분들이 저희 서비스를 이용하시면서 더 많은 혜택을 받을수있도록 연구한답니다!<br> 

저희 인터뷰 시에는 무료로 둘의 이미지 사진을 촬영해드리며, 상당한 상품을 함께드려요. 
<br> 예를들면, 20만원 상당의 외식상품권이나 에어프라이어와 같은 가전기기를 기대하셔도 좋아요! <br>

메일을 보내주실때 실명과 아이디 명, 거주지 등본을 함께 보내주시면 됩니다! <br><br>
혜택을 받을 이메일 주소/휴대폰 번호가 잘못 기재되었을 시 발생하는 불이익에 대해 책임지지 않습니다. 
<br>메일 발송 후 2~3주 내로 전달주신 메일주소로 회신이 갑니다.

   	<br><br><br>
   	<p style="font-size: 15px;">  &gt;&gt;&gt;&gt;  인터뷰 신청 메일    :  email : shareHere452@gmail.com  &lt;&lt;&lt;&lt; </p>

</div>

<br><br><br><br>
<%@include file="/views/common/footer.jsp"%>
</body>
</html>
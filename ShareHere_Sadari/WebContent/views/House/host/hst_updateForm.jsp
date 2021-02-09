<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="house.model.vo.*, java.util.ArrayList"%>
<%
	HostInfo i = (HostInfo)request.getAttribute("info");
	ArrayList<HostPhoto> pho = (ArrayList<HostPhoto>)request.getAttribute("photo");
	ArrayList<HostRoom> room = (ArrayList<HostRoom>)request.getAttribute("room");

	String type = "";
	String selectType[] = new String[3];
	
	if(i.getShType() != null){
		type = i.getShType();
		switch(type){
		case "단독주택" : selectType[0] = "selected"; break;
		case "아파트" : selectType[1] = "selected"; break;
		case "빌라" : selectType[2] = "selected"; break;
		}
	}
	
	String str = "";
	String selectStr[] = new String[2];
	if(i.getShStr() != null){
		str = i.getShStr();
		switch(str){
		case "단층" : selectStr[0] = "selected"; break;
		case "복층" : selectStr[1] = "selected"; break;
		}
	}
	
	// 시설 및 서비스
	// 개인공간
	String[] pers = new String[4];
	if(i.getShPers() != null)
		pers = i.getShPers().split(",");
	
	// 공용공간
	String[] coms = new String[4];
	if(i.getShComs() != null)
		coms = i.getShComs().split(",");
	
	//서비스
	String[] ss = new String[4];
	if(i.getShSs() != null)
		ss = i.getShSs().split(",");
	
	// 주소
	String[] address = new String[2];
	String addDetail = "";
	if(i.getShAddress() != null){
		address = i.getShAddress().split(",");	
		if(address[1] != null){
			addDetail = address[1];
		}
	}

	
	//[정보]
	// 은행
	String[] bank = new String[4];
	if(i.getShBank() != null)
		bank = i.getShBank().split(",");
	// 마트
	String[] mart = new String[4];
	if(i.getShMart() != null)
		mart = i.getShMart().split(",");
	// 약국
	String[] par = new String[4];
	if(i.getShParmacy() != null)
		par = i.getShParmacy().split(",");
	// 지하철
	String[] sub = new String[4];
	if(i.getShSubway() != null)
		sub = i.getShSubway().split(",");
	// 카페
	String[] cafe = new String[4];
	if(i.getShCafe() != null)
		cafe = i.getShCafe().split(",");
	// 편의점
	String[] con = new String[4];
	if(i.getShStore() != null)
		con = i.getShStore().split(",");
	

	// 방 정보 사진
	// arrayList로 뽑아서 객체에 넣기
	ArrayList<HostPhoto> photoRoom = new ArrayList<>();	
	for(int pr = 0; pr < pho.size(); pr++){
		
		if(pho.get(pr).getShItype().equals("RI")) {
			HostPhoto pRoom = new HostPhoto();
			
			pRoom.setShI(pho.get(pr).getShI()); //사진 번호
			pRoom.setShIname(pho.get(pr).getShIname()); // 사진 이름
			pRoom.setShIpath(pho.get(pr).getShIpath()); // 사진 경로
			pRoom.setShItype(pho.get(pr).getShItype()); // 사진 타입
			pRoom.setShNo(pho.get(pr).getShNo()); // 하우스 번호
			pRoom.setShChName(pho.get(pr).getShChName());  // 변경된 사진 이름
			
			photoRoom.add(pRoom);

		}
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>

<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>House 매물  수정</title>

<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- css 경로 -->
<link href="${pageContext.request.contextPath}/views/House/host/hst_info.css" rel="stylesheet" type="text/css">
 <!-- navi css 경로 -->
<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
<style>
.formInfo {
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
}

select {
	color: rgb(0, 0, 0);
	width: 50%;
	padding: 1%;
}
.house {
	padding-top: 2%;
	width: 100%;
	float: left;
}
#roomInfo1, #roomInfo2 {
   width: auto;
   height: auto;
}
</style>
</head>
<body>
	<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/navi.jsp" %>
   
       <form class="formInfo" action="<%= request.getContextPath() %>/hst/update" method="post"  enctype="multipart/form-data">
       <input type="hidden" name="shno" value="<%= i.getShNo() %>">
       <input type="hidden" name="shStatus" value="<%= i.getShStatus() %>">
       <input type="hidden" name="shDate" value="<%= i.getShDate() %>">
       
        <h2>하우스 소개</h2>
        <hr>
        <div class="info">
            <!-- 하우스 이름 -->
            <div class="house name">
            <p id="title">하우스이름</p>
            <input type="text" id="text" name="hName" placeholder="하우스명으로 노출될 문구를 작성해세요.(ex. 일행쉐어하우스)" value="<%= i.getShTitle() %>" />
            </div>
            
            <!-- option 형식 -->
            <div class="house hosing">
                <!-- 주택유형 -->
                <span class="span1">
                    <p id="title">주택유형</p>
                    <b id="sub">단독주택, 아파트, 빌라</b>
                    <div style="padding-top: 1%;">
                        <select name="hType" id="housing type">
                            <option class="option" value="" selected disabled>주택유형 선택</option>
                            <option class="option" value="단독주택" <%= selectType[0] %>>단독주택</option>
                            <option class="option" value="아파트" <%= selectType[1] %>>아파트</option>
                            <option class="option" value="빌라" <%= selectType[2] %>>빌라</option>
                        </select>
                    </div>
                </span>

                <!-- 주택구조 -->
                <span class="span1">
                    <p id="title">주택구조(내부구조)</p>
                    <b id="sub">단층인지 복층인지 선택하세요</b>
                    <div style="padding-top: 1%;">
                        <select name="hStructure" id="housing structure">
                            <option class="option" value="" selected disabled>주택구조 선택</option>
                            <option class="option" value="단층" <%= selectStr[0] %>>단층</option>
                            <option class="option" value="복층" <%= selectStr[1] %>>복층</option>
                        </select>
                    </div>
                </span>
            </div>

            <!-- 건물 면적 -->
            <div class="house area">
            <p id="title">건물 면적</p>
            <input type="text" id="text" name="hArea" placeholder="운영하는 하우스의 실면적을 입력하세요.(ex. 80.2)" value="<%= i.getShArea() %>"/>
            </div>

            <!-- 운영 층수 -->
            <div class="house floor">
                <p id="title">운영 층수</p>
                <input type="text" id="text" name="hFloor" placeholder="실제 운영하는 층수를 입력하세요.(ex. 전체 건물 5층 중 3층)" value="<%= i.getShFloor() %>"/>
            </div>
        </div>

        <!-- 이미지 등록 -->
        <div class="house img">
            <p id="title">이미지 등록</p>
		<b id="sub" style="font-size: 14px;"> 대표사진은 검색 시 나타나는 사진으로 한 장만 입력 가능합니다. <br> 
			공용공간, 방 사진, 편의시설, 기타의 순서대로 각각 최대 5장씩 가능합니다. 각각 한 장씩 필수로 넣어주세요!!!<br>
			공용공간 사진은 가급적 여러각도에서 촬영된 사진 넣어주세요. <br>
		</b>	
		
		<!-- 대표사진 -->
		<div id="imgSection">
			<button id="imgBtn">대표사진</button>
			<% for(int t =0; t< pho.size(); t++) { %>
				<% if(pho.get(t).getShItype().equals("T")) { %>
				<div id="fileceo">
					<input type="file" name="thumbnailImg" id="file">
				</div>
				<div id="thumbnailImgArea">
	            	<img id="thumbnail" style="width:550px;  height : 300px;" src="<%= request.getContextPath()%><%= pho.get(t).getShIpath() %><%= pho.get(t).getShChName() %>">
	         	</div>
	         	<% } %>
         	<% } %>
		</div>
	
		<!-- 공용공간 & 방사진 -->
		<div id="imgSection">
			<span class="rImg">
				<button id="imgBtn">공용 공간</button>
				<div id="sImgZip">
					<% for(int s =0; s< pho.size(); s++) { %>
						<% if(pho.get(s).getShItype().equals("S")) { %>
					<input type="file" name="shareImg" id="file" value="<%= pho.get(s).getShIname() %>">
							<% } %>
		         	<% } %>
					<button type="button" id="img_btn" onclick="addShareImgFile()">
						<img
							src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png"
							style="width: 30px;">
					</button>
					<button type="button" id="img_btn" onclick="delShareImgFile()">
						<img
							src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png"
							style="width: 30px;">
					</button>
				</div>
				<% for(int s =0; s< pho.size(); s++) { %>
					<% if(pho.get(s).getShItype().equals("S")) { %>
				<span id="shareImgArea">
					<img id="sharePhoto" style="width:100px;  height : 100px;"  src="<%= request.getContextPath()%><%= pho.get(s).getShIpath() %><%= pho.get(s).getShChName() %>">
				</span>
				<% } %>
         	<% } %>
			</span> 
			<span class="rImg">
				<button id="imgBtn">방 사진</button>
				<div id="rImgZip">
				<% for(int r =0; r< pho.size(); r++) { %>
					<% if(pho.get(r).getShItype().equals("R")) { %>
					<input type="file" name="roomImg" id="file" value="<%= pho.get(r).getShIname() %>">
					<% } %>
         		<% } %>
					<button type="button" id="img_btn" onclick="addRoomImgFile()">
						<img
							src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png"
							style="width: 30px;">
					</button>
					<button type="button" id="img_btn" onclick="delRoomImgFile()">
						<img
							src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png"
							style="width: 30px;">
					</button>
				</div>
				<% for(int r =0; r< pho.size(); r++) { %>
					<% if(pho.get(r).getShItype().equals("R")) { %>
				<span id="roomImgArea">
					<img id="roomPhoto" style="width:100px;  height : 100px;"  src="<%= request.getContextPath()%><%= pho.get(r).getShIpath() %><%= pho.get(r).getShChName() %>">
				</span>
				<% } %>
         	<% } %>
			</span>
		</div>
	
		<!-- 편의시설 & 기타 -->
		<div id="imgSection">
			<span class="rImg">
				<button id="imgBtn">편의시설</button>
				<div id="aImgZip">
				<% for(int a =0; a< pho.size(); a++) { %>
					<% if(pho.get(a).getShItype().equals("A")) { %>
						<input type="file" name="amenImg" id="file" value="<%= pho.get(a).getShIname() %>">
					<% } %>
         		<% } %>
					<button type="button" id="img_btn" onclick="addAmenImgFile()">
						<img
							src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png"
							style="width: 30px;">
					</button>
					<button type="button" id="img_btn" onclick="delAmenImgFile()">
						<img
							src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png"
							style="width: 30px;">
					</button>
				</div>
				<% for(int a =0; a< pho.size(); a++) { %>
					<% if(pho.get(a).getShItype().equals("A")) { %>
				<span id="amenImgArea">
					<img id="amenPhoto" style="width:100px;  height : 100px;"  src="<%= request.getContextPath()%><%= pho.get(a).getShIpath() %><%= pho.get(a).getShChName() %>">
				</span>
				<% } %>
         	<% } %>
			</span> 
			<span class="rImg">
				<button id="imgBtn">기타</button>
				<div id="eImgZip">
				<% for(int e =0; e< pho.size(); e++) { %>
					<% if(pho.get(e).getShItype().equals("E")) { %>
					<input type="file" name="etcImg" id="file" value="<%= pho.get(e).getShIname() %>">
					<% } %>
         		<% } %>
					<button type="button" id="img_btn" onclick="addEtcImgFile()">
						<img
							src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png"
							style="width: 30px;">
					</button>
					<button type="button" id="img_btn" onclick="delEtcImgFile()">
						<img
							src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png"
							style="width: 30px;">
					</button>
				</div>
				<% for(int e =0; e< pho.size(); e++) { %>
					<% if(pho.get(e).getShItype().equals("E")) { %>
				<span id="etcImgArea">
					<img id="etcPhoto" style="width:100px;  height : 100px;"  src="<%= request.getContextPath()%><%= pho.get(e).getShIpath() %><%= pho.get(e).getShChName() %>">
				</span>
				<% } %>
         	<% } %>
			</span>
        </div>
        </div>

        <!-- 쉐어하우스 소개 -->
        <div class="house intro">
            <p id="title">쉐어하우스 소개</p>
            <textarea name="hIntro" id="ta" cols="30" rows="5" style="text-align: left;"
            placeholder="쉐어하우스에 대해 자세히 30자 내로 작성해주세요. &#13;&#10;입주신청자들이 투어 신청시 착오발생 하지 않도록 최대한 기재해주세요!'"
            ><%= i.getShIntro() %></textarea>
        </div>
        
        <!-- 방 정보 -->
        <div class="house room">
        	<h2>방 정보</h2>
			<hr>
			<b id="sub">방은 최대 4개 입력할 수 있습니다. <br>
			 + 버튼을 누르시면 입력하실 수 있는 방 form이 나옵니다. <br> 
			 순서대로 입력해주세요!</b> 
			 <br><br>
		<div id="roomInfo1" style="width: 100%; float: left;">
		<% for(int ri = 0; ri < room.size(); ri++) { %>
		<span id="rbox" class=rii
			style="width: 50%; border: 1px solid black; padding: 1%;"> 
		<b id="sub"><%= (ri+1) %></b>
		<input type="hidden" name="shRno" value="<%=room.get(ri).getShRno() %>">
			<!-- 방 대표 사진 -->
			<div id="rp">
				<p id="title">방 대표 사진</p>
				<div>
					<input type="file" name="shRImg<%= ri %>" id="rImg" class="inputRoom" style="border: 1px solid rgb(165, 165, 165);">
				</div>
				<div id="shRImgArea">
					<img id="Img<%= ri %>" style="width:500px;  height : 300px;"  src="<%= request.getContextPath()%><%= photoRoom.get(ri).getShIpath()  %><%= photoRoom.get(ri).getShChName() %>">
				</div>
			</div>
			<div id="r1" name="shRoom">
				<!-- 방 이름 -->
				<div id="rp" style="padding-top: 10%;">
					<p id="title">방 이름</p>
					<input type="text" class="rName"
						placeholder="방 이름을 입력하세요.(ex. RoomA)" name="shRname" style="width:60%" value="<%= room.get(ri).getShRname()%>"/>
				</div>
				<%
				String rType = ""; // 타입
				String selectRtype[] = new String[3];
				
				String rGender = ""; // 성별
				String selectRgender[] = new String[3];
				
					// 타입
					if(room.get(ri).getShRtype() != null){
						rType = room.get(ri).getShRtype();
						switch(rType){
						case "1인실" : selectRtype[0] = "selected"; break;
						case "2인실" : selectRtype[1] = "selected"; break;
						case "3인실" : selectRtype[2] = "selected"; break;
						}
					}
					
					// 성별
					if(room.get(ri).getShGender() != null){
						rGender = room.get(ri).getShGender();
						switch(rGender){
						case "남녀공용" : selectRgender[0] = "selected"; break;
						case "남성전용" : selectRgender[1] = "selected"; break;
						case "여성전용" : selectRgender[2] = "selected"; break;
						}
					}
				%>
				<!-- 타입 -->
				<div id="rp">
					<p id="title">타입</p>
					<b id="sub">1인실, 2인실, 3인실</b>
					<div style="padding-top: 1%;">
						<select name="shRtype" class="rType">
							<option class="option" value="" selected disabled>방 타입선택</option>
							<option class="option" value="1인실" <%= selectRtype[0]  %>>1인실</option>
							<option class="option" value="2인실" <%= selectRtype[1]  %>>2인실</option>
							<option class="option" value="3인실" <%= selectRtype[2]  %>>3인실</option>
						</select>
					</div>
				</div>
				<!-- 성별 -->
				<div id="rp" style="padding-top: 4%;">
					<p id="title">성별</p>
					<div style="padding-top: 1%;">
						<select name="shGender" class="rType">
							<option class="option" value="" selected disabled>성별 선택</option>
							<option class="option" value="남녀공용" <%= selectRgender[0] %>>남녀공용</option>
							<option class="option" value="남성전용" <%= selectRgender[1] %>>남성전용</option>
							<option class="option" value="여성전용" <%= selectRgender[2] %>>여성전용</option>
						</select>
					</div>
				</div>
				<!-- 면적(방 면적) -->
				<div id="rp">
					<p id="title">면적(방 면적)</p>
					<input type="text" class="rArea"
						placeholder="방 면적을 입력하세요.(ex. 7.5)" name="shRarea" style="width:60%"  value="<%= room.get(ri).getShRarea() %>"/>
				</div>
				<!-- 보증금 -->
				<div id="rp">
					<p id="title">보증금</p>
					<input type="text" class="rDeposit"
						placeholder="보증금을 입력하세요.(ex. 300만원)" name="shDeposit" style="width:60%" value="<%= room.get(ri).getShDeposit() %>"/>
				</div>
				<!-- 관리비 -->
				<div id="rp">
					<p id="title">관리비</p>
					<input type="text" class="rAdmcost"
						placeholder="관리비를 입력하세요.(ex. 10만원)" name="shAdmcost" style="width:60%" value="<%= room.get(ri).getShAdmcost() %>"/>
				</div>
				<!-- 월세 -->
				<div id="rp">
					<p id="title">월세</p>
					<input type="text" class="rMonth"
						placeholder="월세를 입력하세요.(ex. 40만원)" name="shMonthly" style="width:60%" value="<%= room.get(ri).getShMonthly()%>"/>
				</div>
				<!-- 입주 가능일 -->
				<div id="rp">
					<p id="title">입주 가능일</p>
					<input type="date" name="shRdate" class="rDate" style="width:60%" value="<%= room.get(ri).getShRdate() %>">
				</div>
				<!-- 입주 가능한 방 인원 수-->
				<div id="rp">
					<p id="title">입주 가능한 방 인원 수</p>
					<input type="number" name="shCapacity"
						placeholder="인원 수는 4명까지 가능합니다." min="0" max="4"
						style="width: 60%" class="rCap"  value="<%= room.get(ri).getShCapacity() %>"/>
					</div>
				</div>
			</span> 
			<% } %>
			
			<% for(int ro = room.size(); ro < 4; ro++) { %>
			<span id="rbox2" class=rii style="width: 50%; border: 1px solid black; padding: 1%; float:left;"> 
			<b id="sub"><%= (ro+1) %></b>
			<!-- 방 대표 사진 -->
			<div id="rp">
				<p id="title">방 대표 사진</p>
				<div>
					<input type="file" name="shRImg<%= ro %>" id="rImg" class="inputRoom" style="border: 1px solid rgb(165, 165, 165);">
				</div>
				<div id="shRImgArea">
					<img id="Img<%= ro %>"  style="width:500px;  height : 300px;">
				</div>
			</div>
				<div id="r2"></div>
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
							<option class="option" value="" selected disabled>방 타입선택</option>
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
						style="width: 60%" class="rCap"/>
					</div>
					</span>
				<% } %>
				</div>
			</div>
			<div id="roomInfo2" style="width: 100%; float: left;">
				 
				 <span id="rbox3" class=rii>
				<div id="r3"></div>
				</span>
				
				<span id="rbox4" class=rii>
				<div id="r4"></div>
				</span>  
        	</div>


        <!-- 시설 및 서비스 -->
        <div class="house service" style="padding-top: 5%;">
            <h2>시설 및 서비스</h2>
            <hr>
            <br>
            <span class="ss personal">
                <b>개인공간</b>
                <span class="circleBtn">
                    <button type="button" id="cBtn" onclick="personalAdd()">
                        <img src="https://cdn.iconscout.com/icon/free/png-64/plus-113-453105.png" style="width: 30px;">
                    </button>
                    <button type="button" id="cBtn" onclick="personalDel()">
                        <img src="https://cdn.iconscout.com/icon/free/png-64/minus-130-453104.png" style="width: 30px;">
                    </button>
                </span>
                <div id="serviceP">
                <% for(int pe = 0; pe < pers.length; pe++) { %>
                    <input type="text" class='addedPer' id="personS<%= pe%>" name="hPers" placeholder="비치되어있는 가구를 입력하세요.(ex.침대)" style="width: 100%;" value="<%= pers[pe] %>"/>
                <% } %>
                </div>
            </span>
            <span class="ss common">
                <b>공용공간</b>
                <span class="circleBtn">
                    <button type="button" id="cBtn" onclick="commonAdd()">
                        <img src="https://cdn.iconscout.com/icon/free/png-64/plus-113-453105.png" style="width: 30px;">
                    </button>
                    <button type="button" id="cBtn" onclick="commonDel()">
                        <img src="https://cdn.iconscout.com/icon/free/png-64/minus-130-453104.png" style="width: 30px;">
                    </button>
                </span>
                <div id="serviceC">
                <% for(int com = 0; com < coms.length; com++) { %>
                    <input type="text" id="commonS"  name="hCommon" class='addedC' placeholder="가구와 공용공간을 입력하세요.(ex. 화장실)" style="width: 100%;" value="<%= coms[com] %>"/>
                <% } %>
                </div>
            </span>
            <span class="ss service">
                <b>서비스</b>
                <span class="circleBtn">
                    <button type="button" id="cBtn" onclick="serviceAdd()">
                        <img src="https://cdn.iconscout.com/icon/free/png-64/plus-113-453105.png" style="width: 30px;">
                    </button>
                    <button type="button" id="cBtn" onclick="serviceDel()">
                        <img src="https://cdn.iconscout.com/icon/free/png-64/minus-130-453104.png" style="width: 30px;">
                    </button>
                </span>
                <div id="serviceS">
                <% for(int s = 0; s < ss.length; s++) { %>
                    <input type="text" id="serText" name="hService" class='addedS' placeholder="서비스에 대해 입력하세요.(ex. 와이파이)" value="<%= ss[s] %>"/>
                <% } %>
                </div>
            </span>
        </div>

        <!-- 주소 -->
        <div class="house address" style="padding-top: 5%;">
            <h2>주소</h2>
            <hr>
            <br>
            <div>
                <b id="sub">주소 검색 버튼을 통해 주소를 입력해주세요. <br>
                    단, 상세주소는 직접 입력해야합니다.</b>
            </div>
			<!-- kakao api -->
			<span class="spadd1" style="margin-top: 2%;">
				<div class="add">
					<b class="join_title">도로명주소</b> <br> 
					<input type="text" id="sample5_address" class="postcodify address" name="hAddress" readonly style="width:80%" value="<%= address[0] %>">
					<input type="button" id="postcodify_search_button" onclick="sample5_execDaumPostcode()" value="주소 검색">
				</div>
				<div class="add">
					<b class="join_title">상세주소</b> <br> 
					<input type="text" class="postcodify details" id="detail" name="hAddress" style="width:80%" value="<%= addDetail %>">
				</div>
				<!-- 위도 -->
				<input type="hidden" id="la" name="la" value="<%= i.getShLa() %>">
				<!-- 경도 -->
				<input type="hidden" id="lo" name="lo" value="<%= i.getShLo() %>">
			</span>
			<span id="map"style="width: 400px; height: 300px; margin-top: 10px; display: none;"></span>

			<script
				src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a48a450831988c6babadada9c0aed59&libraries=services&libraries=services"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};

				//지도를 미리 생성
				var map = new daum.maps.Map(mapContainer, mapOption);
				//주소-좌표 변환 객체를 생성
				var geocoder = new daum.maps.services.Geocoder();
				//마커를 미리 생성
				var marker = new daum.maps.Marker({
					position : new daum.maps.LatLng(37.537187, 127.005476),
					map : map
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				function sample5_execDaumPostcode() {
					// 상세 주소 값 비우기
					 $("#detail").val("");
					
					new daum.Postcode(
							{
								oncomplete : function(data) {
									var addr = data.address; // 최종 주소 변수

									// 주소 정보를 해당 필드에 넣는다.
									document.getElementById("sample5_address").value = addr;
									// 주소로 상세 정보를 검색
									geocoder
											.addressSearch(
													data.address,
													function(results, status) {
														// 정상적으로 검색이 완료됐으면
														if (status === daum.maps.services.Status.OK) {

															var result = results[0]; //첫번째 결과의 값을 활용

															// 해당 주소에 대한 좌표를 받아서
															var coords = new daum.maps.LatLng(
																	result.y,
																	result.x);
															// 위도 경도 input에 넣기
															var la = result.y;
															var lo = result.x;
															document
															.getElementById("la").value = la;
															document
															.getElementById("lo").value = lo;
															// 지도를 보여준다.
															mapContainer.style.display = "block";
															map.relayout();
															// 지도 중심을 변경한다.
															map
																	.setCenter(coords);
															// 마커를 결과값으로 받은 위치로 옮긴다.
															marker
																	.setPosition(coords)
														}
													});
								}
							}).open();
				}  
			</script>
		</div>

        <!-- 정보 -->
        <div class="house inform" style="padding-top: 7%;">
            <h2>정보</h2>
            <hr>
            <br>
            <b id="sub">
	                각 항목에 맞게 주소지와 가까운 편의시설 정보들을 입력해주세요. <br>
	                위치와 가게 명만 입력하셔도 좋지만 <br>
	                되도록 걸리는 시간을 입력해주세요. <br>
	                각각 최대 5개씩 입력 가능합니다!
            </b>
            <!-- 은행, 마트, 약국 -->
            <div>
                <span class="i bank">
                    <img src="https://cdn.iconscout.com/icon/free/png-64/atm-1780467-1517557.png" alt="bank" style="width: 30px;">
                    <b>은행</b>
                    <span class="squareBtn">
                        <button type="button" id="iBtn" onclick="bankAdd()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="iBtn" onclick="bankADel()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </span>
                    <div id="bankTa">
                    	<% for(int b = 0; b < bank.length; b++) { %>
                        	<input type="text" id="bankText<%= b%>" class="addedbank" name="hBank" placeholder="ex. KB국민은행ATM 서울역점" style="width: 100%;" value="<%= bank[b]%>"/>
                    	<% } %>
                    </div>
                </span>
                <span class="i mart">
                    <img src="https://cdn.iconscout.com/icon/free/png-64/store-1780480-1517570.png" alt="마트" style="width: 30px;">
                    <b>마트</b>
                    <span class="squareBtn">
                        <button type="button" id="iBtn" onclick="martAdd()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="iBtn" onclick="martDel()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </span>
                    <div id="martTa">
                    	<% for(int m = 0; m < mart.length; m++) { %>
                        	<input type="text" id="martText" name="hMart" class='addedmart' placeholder="ex. 롯데마트 도보 7분" style="width: 100%;" value="<%= mart[m]%>"/>
                    	<% } %>	
                    </div>
                </span>
                <span class="i pharmacy">
                    <img src="https://cdn.iconscout.com/icon/free/png-64/pharmacy-1780503-1517593.png" alt="약국" style="width: 30px;">
                    <b>약국</b>
                    <span class="squareBtn">
                        <button type="button" id="iBtn" onclick="pharmacyAdd()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="iBtn" onclick="pharmacyDel()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </span>
                    <div id="pharmacyTa">
                    <% for(int p = 0; p < par.length; p++) { %>
                        <input type="text" id="pharmacyText" name="hPha" class='addedpha' placeholder="ex. 온누리백합약국 5분" style="width: 100%;" value="<%= par[p]%>"/>
                    <% } %>
                    </div>
                </span>
            </div>
            <!-- 주유소, 카페, 편의점 -->
            <div>
                <span class="i subway">
                    <img src="https://cdn.iconscout.com/icon/free/png-64/subway-1780478-1517568.png" alt="subway" style="width: 30px;">
                    <b>지하철</b>
                    <span class="squareBtn">
                        <button type="button" id="iBtn" onclick="subwayAdd()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="iBtn" onclick="subwayDel()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </span>
                    <div id="subwayTa">
                    <% for(int s = 0; s < sub.length; s++) { %>
                        <input type="text" id="subwayText" name="hSubway" class='addedsubway' placeholder="ex. 서울역 1번출구 도보 5분" style="width: 100%;" value="<%= sub[s]%>"/>
                    <% } %>
                    </div>
                </span>
                <span class="i cafe">
                    <img src="https://cdn.iconscout.com/icon/free/png-64/local-cafe-1780519-1517609.png" alt="카페" style="width: 30px;">
                    <b>카페</b>
                    <span class="squareBtn">
                        <button type="button" id="iBtn" onclick="cafeAdd()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="iBtn" onclick="cafeDel()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </span>
                    <div id="cafeTa">
                    <% for(int c = 0; c < cafe.length; c++) { %>
                        <input type="text" id="cafeText" name="hCafe" class='addedcafe' placeholder="ex. 스타벅스" style="width: 100%;" value="<%= cafe[c]%>"/>
                    <% } %>
                    </div>
                </span>
                <span class="i convenienceStore">
                    <img src="https://cdn.iconscout.com/icon/free/png-64/convenience-store-1780517-1517607.png"
                            alt="convenienceStore" width="30px">
                    <b>편의점</b>
                    <span class="squareBtn">
                        <button type="button" id="iBtn" onclick="convenienceStoreAdd()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="iBtn" onclick="convenienceStoreDel()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </span>
                    <div id="convenienceStoreTa">
                    <% for(int c = 0; c < con.length; c++) { %>
                        <input type="text" id="convenienceStoreText" class='addedcon' name="hCon" placeholder="ex. GS25 도보 10분" style="width: 100%;" value="<%= con[c] %>"/>
                    <% } %>
                    </div>
                </span>
            </div>
        </div>
        </div>
        <div class="btnArea" style="padding: 0 0% 0% 30%">
			<button class="bUBtn" style="width:30%;" type="submit">수정하기</button>
            <button class="bUBtn" style="width:30%;" onclick="javascript:history.back();">돌아가기</button>
        </div>
    </form>

    <!-- 제이쿼리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script>
        // option 선택 시 검은색

		// [사진]
        // 사진 + 버튼 클릭 시 추가, - 버튼 클릭 시 삭제
        // 사진 + 버튼 클릭 시 추가, - 버튼 클릭 시 삭제
	    var sindex = 1;
	    // 공용공간
	    function addShareImgFile(){
	        if(sindex < 5){
	            $("<br class='brP'><input type='file' name='shareImg"+ sindex +"' class='addedP'>").appendTo("#sImgZip");
	            $("<img id='sharePhoto"+ sindex +"'>").appendTo("#shareImgArea");
	            sindex++;
	        }
	        
	        $("[type=file]").change(function(){
	               loadImg(this);
	               //console.log(this);
	        });
	       
			function loadImg(element) {
					if (element.files && element.files[0]) {
						var reader = new FileReader();
	
						reader.onload = function(e) {
	
							var selector;
							var size;
							switch (element.name) {
							case "shareImg0":
								selector = "#sharePhoto0";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
	
							case "shareImg1":
								selector = "#sharePhoto1";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
							case "shareImg2":
								selector = "#sharePhoto2";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
							case "shareImg3":
								selector = "#sharePhoto3";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
	
							}
							$(selector).attr("src", e.target.result).css(size);
						}
	
						reader.readAsDataURL(element.files[0]);
	
					}
				}
		}
		function delShareImgFile() {
			if (sindex > 0) {
				$("input[class=addedP]:last").remove();
				$("br[class=brP]:last").remove();
				$("img[class=addedPI]:last").remove();
				sindex--;
			}
		}

		// 방 사진
		var rindex = 0;
		function addRoomImgFile() {
			if (rindex < 4) {
				$("<br class='brR'><input type='file' name='roomImg"+ rindex +"' class='addedR'>").appendTo("#rImgZip");
				$("<img id='roomPhoto"+ rindex +"' class=addedRI>").appendTo("#roomImgArea");
				rindex++;
			}
			
			$("[type=file]").change(function(){
	               loadImg(this);
	        });
	       
			function loadImg(element) {
					if (element.files && element.files[0]) {
						var reader = new FileReader();
	
						reader.onload = function(e) {
	
							var selector;
							var size;
							switch (element.name) {
							case "roomImg0":
								selector = "#roomPhoto0";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
	
							case "roomImg1":
								selector = "#roomPhoto1";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
							case "roomImg2":
								selector = "#roomPhoto2";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
							case "roomImg3":
								selector = "#roomPhoto3";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
	
							}
							$(selector).attr("src", e.target.result).css(size);
						}
	
						reader.readAsDataURL(element.files[0]);
	
					}
				}
		}

		function delRoomImgFile() {
			if (rindex > 0) {
				$("input[class=addedR]:last").remove();
				$("br[class=brR]:last").remove();
				$("img[class=addedRI]:last").remove();
				rindex--;
			}
		}

		// 편의시설
		var aindex = 0;
		function addAmenImgFile() {
			if (aindex < 4) {
				$("<br class='brA'><input type='file' name='amenImg"+ aindex +"' class='addedA'>").appendTo("#aImgZip");
				$("<img id='amenPhoto"+ aindex +"' class=addedAI >").appendTo("#amenImgArea");
				aindex++;
			}
			
			$("[type=file]").change(function(){
	               loadImg(this);
	        });
	       
			function loadImg(element) {
					if (element.files && element.files[0]) {
						var reader = new FileReader();
	
						reader.onload = function(e) {
	
							var selector;
							var size;
							switch (element.name) {
							case "amenImg0":
								selector = "#amenPhoto0";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
	
							case "amenImg1":
								selector = "#amenPhoto1";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
							case "amenImg2":
								selector = "#amenPhoto2";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
							case "amenImg3":
								selector = "#amenPhoto3";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
	
							}
							$(selector).attr("src", e.target.result).css(size);
						}
	
						reader.readAsDataURL(element.files[0]);
	
					}
				}
			
		}

		function delAmenImgFile() {
			if (aindex > 0) {
				$("input[class=addedA]:last").remove();
				$("br[class=brA]:last").remove();
				$("img[class=addedAI]:last").remove();
				aindex--;
			}
		}

		// 기타
		var eindex = 0;
		function addEtcImgFile() {
			if (eindex < 4) {
				$("<br class='brE'><input type='file' name='etcImg"+ eindex +"' class='addedE'>").appendTo("#eImgZip");
				$("<img id='etcPhoto"+ eindex +"' class=addedEI>").appendTo("#etcImgArea");
				eindex++;
			}
			
			$("[type=file]").change(function(){
	               loadImg(this);
	        });
	       
			function loadImg(element) {
					if (element.files && element.files[0]) {
						var reader = new FileReader();
	
						reader.onload = function(e) {
	
							var selector;
							var size;
							switch (element.name) {
							case "etcImg0":
								selector = "#etcPhoto0";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
	
							case "etcImg1":
								selector = "#etcPhoto1";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
							case "etcImg2":
								selector = "#etcPhoto2";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
							case "etcImg3":
								selector = "#etcPhoto3";
								size = {
									width : "100px",
									height : "100px",
									border : "solid 1px #dadada"
								};
								break;
	
							}
							$(selector).attr("src", e.target.result).css(size);
						}
	
						reader.readAsDataURL(element.files[0]);
	
					}
				}
		}

		function delEtcImgFile() {
			if (eindex > 0) {
				$("input[class=addedE]:last").remove();
				$("br[class=brE]:last").remove();
				$("img[class=addedEI]:last").remove();
				eindex--;
			}
		}

		$(function() {
			// input type="file" 태그에 파일이 첨부 될 떄 동작하는 이벤트
			$("[type=file]").change(function() {
				loadImg(this);
				console.log(this);
			});
		})

		function loadImg(element) {
			// element를 판별해서 알맞은 위치에 preview 표현하기
			//console.log(element.name);

			// input type="file" 엘리먼트에 첨부 파일 속성, 첨부파일이 잘 존재하는지 확인
			if (element.files && element.files[0]) {
				// 파일은 읽어들일 FileReader 객체 생성
				var reader = new FileReader();

				// 파일 읽기가 다 완료 되었을 떄 실행 되는 메소드
				reader.onload = function(e) {

					var selector;
					var size;
					switch (element.name) {
					case "thumbnailImg":
						selector = "#thumbnail";
						size = {
							width : "550px",
							height : "300px",
							border : "solid 1px #dadada"
						};
						break;
					case "shareImg":
						selector = "#sharePhoto";
						size = {
							width : "100px",
							height : "100px",
							border : "solid 1px #dadada"
						};
						break;
					case "roomImg":
						selector = "#roomPhoto";
						size = {
							width : "100px",
							height : "100px",
							border : "solid 1px #dadada"
						};
						break;

					case "amenImg":
						selector = "#amenPhoto";
						size = {
							width : "100px",
							height : "100px",
							border : "solid 1px #dadada"
						};
						break;
					case "etcImg":
						selector = "#etcPhoto";
						size = {
							width : "100px",
							height : "100px",
							border : "solid 1px #dadada"
						};
						break;
					}
					$(selector).attr("src", e.target.result).css(size);
				}

				// 파일 읽기 하는 메소드
				reader.readAsDataURL(element.files[0]);

			}
		}
		
		// 방 정보
		// 방 사진
		$(function(){
            // input type="file" 태그에 파일이 첨부 될 떄 동작하는 이벤트
            $("[type=file]").change(function(){
               loadImgRoom(this);
               console.log(this);
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
                  case "shRImg0" :
                     selector = "#Img0";
                     size = {width : "500px", height : "300px", border: "solid 1px #dadada"};
                     break;
                  case "shRImg1" :
                      selector = "#Img1";
                      size = {width : "500px", height : "300px", border: "solid 1px #dadada"};
                      break;
                  case "shRImg2" :
                      selector = "#Img2";
                      size = {width : "500px", height : "300px", border: "solid 1px #dadada"};
                      break;
                  case "shRImg3" :
                      selector = "#Img3";
                      size = {width : "500px", height : "300px", border: "solid 1px #dadada"};
                      break;
 
                  }
                  $(selector).attr("src",e.target.result).css(size);
               }
               
               // 파일 읽기 하는 메소드
               reader.readAsDataURL(element.files[0]);
               
            }
         }
		
		
        
        // 시설 및 서비스

        // 개인 공간
        var perindex = <%= pers.length%>;
        function personalAdd(){
            if(perindex< 5){
                $("<br class='brP'><input type='text' class='addedPer' name='hPers' style='width: 100%;' placeholder='비치되어있는 가구를 입력하세요.(ex.침대)' >").appendTo("#serviceP");
                perindex++;
            }
        }

        function personalDel(){
            if(perindex > 0){
                $("input[class=addedPer]:last").remove();
                $("br[class=brP]:last").remove();
                perindex--;
            }
        }
        // 공용 공간
        var comindex = <%= coms.length%>;
        function commonAdd(){
            if(comindex < 5){
                $("<br class='brC'><input type='text' class='addedC'name='hCommon' style='width: 100%;' placeholder='가구와 공용공간을 입력하세요.(ex. 화장실)'>").appendTo("#serviceC");
                comindex++;
            }
        }

        function commonDel(){
            if(comindex > 0){
                $("input[class=addedC]:last").remove();
                $("br[class=brC]:last").remove();
                comindex--;
            }
        }

        // 서비스
        var serindex = <%= ss.length %>;
        function serviceAdd(){
            if(serindex < 5){
                $("<br class='brS'><input type='text' style='width: 100%;' class='addedS' name='hService' placeholder='서비스에 대해 입력하세요.(ex. 와이파이)''>").appendTo("#serviceS");
                serindex++;
            }
        }

        function serviceDel(){
            if(serindex > 0){
                $("input[class=addedS]:last").remove();
                $("br[class=brS]:last").remove();
                serindex--;
            }
        }

     	// 정보
        // 은행
		var bankIndex = <%= bank.length %>;
		        function bankAdd(){
		            if(bankIndex  < 5){
		                $("<br class='brbank'><input type='text' name='hBank' class='addedbank' placeholder='ex. KB국민은행ATM 서울역점'  style='width:100%'>").appendTo("#bankTa");
		                bankIndex ++;
		            }
		}

        function bankADel(){
            if(bankIndex > 0){
                $("input[class=addedbank]:last").remove();
                $("br[class=brbank]:last").remove();
                bankIndex--;
            }
        }

        // 마트
        var martIndex = <%= mart.length%>;
        function martAdd(){
            if(martIndex < 5){
                $("<br class='brmart'><input type='text' name='hMart' class='addedmart' placeholder='ex. 롯데마트 도보 7분'  style='width:100%'>").appendTo("#martTa");
                martIndex ++;
            }
        }

        function martDel(){
            if(martIndex > 0){
                $("input[class=addedmart]:last").remove();
                $("br[class=brmart]:last").remove();
                martIndex--;
            }
        }

        //약국
        var pharmacyIndex = <%= par.length%>;
        function pharmacyAdd(){
            if(pharmacyIndex < 5){
                $("<br class='brpha'><input type='text' name='hPha' class='addedpha' placeholder='ex. 온누리백합약국 5분' style='width:100%'>").appendTo("#pharmacyTa");
                pharmacyIndex ++;
            }
        }

        function pharmacyDel(){
            if(pharmacyIndex> 0){
                $("input[class=addedpha]:last").remove();
                $("br[class=brpha]:last").remove();
                pharmacyIndex--;
            }
        }


        // 지하철
        var subwayIndex = <%= sub.length%>;
        function subwayAdd(){
            if(subwayIndex < 5){
                $("<br class='brsubway'><input type='text' name='hSubway' class='addedsubway' placeholder='ex. 서울역 1번 출구 도보 5분' style='width:100%'>").appendTo("#subwayTa");
                subwayIndex ++;
            }
        }

        function subwayDel(){
            if(subwayIndex> 0){
                $("input[class=addedsubway]:last").remove();
                $("br[class=brsubway]:last").remove();
                subwayIndex--;
            }
        }

        //카페
        var cafeIndex = <%= cafe.length %>;
        function cafeAdd(){
            if(cafeIndex < 5){
                $("<br class='brcafe'><input type='text' name='hCafe' class='addedcafe' placeholder='ex. 스타벅스' style='width:100%'>").appendTo("#cafeTa");
                cafeIndex ++;
            }
        }

        function cafeDel(){
            if(cafeIndex> 0){
                $("input[class=addedcafe]:last").remove();
                $("br[class=brcafe]:last").remove();
                cafeIndex--;
            }
        }

        // 편의점
        var convenienceStoreIndex = <%= con.length %>;
        function convenienceStoreAdd(){
            if(convenienceStoreIndex < 5){
                $("<br class='brcon'><input type='text' name='hCon' class='addedcon' placeholder='ex. GS25 도보 10분' style='width:100%'>").appendTo("#convenienceStoreTa");
                convenienceStoreIndex ++;
            }
        }

        function convenienceStoreDel(){
            if(convenienceStoreIndex > 0){
                $("input[class=addedcon]:last").remove();
                $("br[class=brcon]:last").remove();
                convenienceStoreIndex--;
            }
        }
    </script>
    
    <!--  페이지를 이동해도 footer는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp" %>
</body>
</html>
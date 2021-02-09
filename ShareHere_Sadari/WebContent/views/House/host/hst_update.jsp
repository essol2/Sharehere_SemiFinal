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
<title>House 매물  수정</title>
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- css 경로 -->
<link href="./hst_info.css" rel="stylesheet" type="text/css">
 <!-- navi css 경로 -->
<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/navi.jsp" %>
   
       <form>
        <h2>하우스 소개</h2>
        <hr>
        <div class="info">
            <!-- 하우스 이름 -->
            <div class="house name">
            <p id="title">하우스이름</p>
            <input type="text" id="text" placeholder="하우스명으로 노출될 문구를 작성해세요.(ex. 일행쉐어하우스)"/>
            </div>
            
            <!-- option 형식 -->
            <div class="house hosing">
                <!-- 주택유형 -->
                <span class="span1">
                    <p id="title">주택유형</p>
                    <b id="sub">단독주택, 아파트, 빌라</b>
                    <div style="padding-top: 1%;">
                        <select name="housing type" id="housing type">
                            <option class="option" value="" selected disabled>주택유형 선택</option>
                            <option class="option" value="단독주택">단독주택</option>
                            <option class="option" value="아파트">아파트</option>
                            <option class="option" value="빌라">빌라</option>
                        </select>
                    </div>
                </span>

                <!-- 주택구조 -->
                <span class="span1">
                    <p id="title">주택구조(내부구조)</p>
                    <b id="sub">단층인지 복층인지 선택하세요</b>
                    <div style="padding-top: 1%;">
                        <select name="Housing structure" id="housing structure">
                            <option class="option" value="" selected disabled>주택구조 선택</option>
                            <option class="option" value="단층">단층</option>
                            <option class="option" value="복층">복층</option>
                        </select>
                    </div>
                </span>
            </div>

            <!-- 건물 면적 -->
            <div class="house area">
            <p id="title">건물 면적</p>
            <input type="text" id="text" placeholder="운영하는 하우스의 실면적을 입력하세요.(ex. 80.2)"/>
            </div>

            <!-- 운영 층수 -->
            <div class="house floor">
                <p id="title">운영 층수</p>
                <input type="text" id="text" placeholder="실제 운영하는 층수를 입력하세요.(ex. 전체 건물 5층 중 3층)"/>
            </div>
        </div>

        <!-- 이미지 등록 -->
        <div class="house img">
            <p id="title">이미지 등록</p>
            <b id="sub" style="font-size: 14px;">
                대표사진은 검색 시 나타나는 사진으로 한 장만 입력 가능합니다. <br>
                공용공간, 방 사진, 편의시설, 기타의 순서대로 각각 최대 5장씩 가능합니다. <br>
                공용공간 사진은 가급적 여러각도에서 촬영된 사진 넣어주세요. <br>
            </b>
            <!-- 대표사진 -->
            <div id="imgSection">
                <button id="imgBtn">대표사진</button>
                <div id="fileceo">
                    <input type="file" name="file" id="file">
                </div>
            </div>

            <!-- 공용공간 & 방사진 -->
            <div id="imgSection">
                <span class="rImg">
                    <button id="imgBtn">공용 공간</button>
                    <div id="sImgZip">
                        <input type="file" name="file" id="file">
                        <button type="button" id="img_btn" onclick="addShareFile()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="img_btn" onclick="delShareFile()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </div>
                </span>
    
                <span class="rImg">
                    <button id="imgBtn">방 사진</button>
                    <div id="rImgZip">
                        <input type="file" name="file" id="file">
                        <button type="button" id="img_btn" onclick="addRoomFile()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="img_btn" onclick="delRoomFile()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </div>
                </span>
            </div>

            <!-- 편의시설 & 기타 -->
            <div id="imgSection">
                <span class="rImg">
                    <button id="imgBtn">편의시설</button>
                    <div id="aImgZip">
                        <input type="file" name="file" id="file">
                        <button type="button" id="img_btn" onclick="addAmenFile()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="img_btn" onclick="delAmenFile()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </div>
                </span>
    
                <span class="rImg">
                    <button id="imgBtn">기타</button>
                    <div id="eImgZip">
                        <input type="file" name="file" id="file">
                        <button type="button" id="img_btn" onclick="addEtcFile()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="img_btn" onclick="delEtcFile()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </div>
                </span>
            </div>
        </div>

        <!-- 쉐어하우스 소개 -->
        <div class="house intro">
            <p id="title">쉐어하우스 소개</p>
            <textarea name="ta" id="ta" cols="30" rows="5" style="text-align: left;"
            placeholder="쉐어하우스에 대해 자세히 30자 내로 작성해주세요. &#13;&#10;입주신청자들이 투어 신청시 착오발생 하지 않도록 최대한 기재해주세요!'"></textarea>
        </div>

        <!-- 방 정보 -->
        <div class="house room">
            <h2>방 정보</h2>
            <hr>
            <b id="sub">방은 최대 4개 입력할 수 있습니다. <br>
                + 버튼을 누르시면 입력하실 수 있는 방 form이 나옵니다. <br>
                순서대로 입력해주세요!</b>
            <br><br>
            <div id="room1">
                <span id="rbox" style="width: 50%; border: 1px solid black; padding: 1%;"> 
                    <!-- +X 버튼 -->
                    <b id="sub">1</b>
                    <button type="button" id="r_btn" onclick="addroom()">
                        <img src="https://cdn.iconscout.com/icon/free/png-64/plus-114-453164.png" style="width: 40px;">
                    </button>
                    <div id="r1">
                        <!-- 방 이름 -->
                        <div id="rp" style="padding-top: 10%;">
                            <p id="title">방 이름</p>
                            <input type="text" id="text" placeholder="방 이름을 입력하세요.(ex. RoomA)"/>
                        </div>
                        <!-- 방 대표 사진 -->
                        <div id="rp">
                            <p id="title">방 대표 사진</p>
                            <input type="file" name="file" id="file">
                        </div>
                        <!-- 타입 -->
                        <div id="rp">
                            <p id="title">타입</p>
                            <b id="sub">1인실, 2인실, 3인실</b>
                            <div style="padding-top: 1%;">
                                <select name="Housing structure" id="housing structure">
                                    <option class="option" value="" selected disabled>방 타입 선택</option>
                                    <option class="option" value="1인실">1인실</option>
                                    <option class="option" value="2인실">2인실</option>
                                    <option class="option" value="3인실">3인실</option>
                                </select>
                            </div>
                        </div>
                        <!-- 성별 -->
                        <div id="rp" style="padding-top: 4%;" >
                            <p id="title">성별</p>
                            <input type="radio" id="M" name="gender" value="M">
                            <label for="M">남자</label> &nbsp;
                            <input type="radio" id="F" name="gender" value="F">
                            <label for="F">여자</label> &nbsp;
                            <input type="radio" id="MF" name="gender" value="MF">
                            <label for="MF">남녀공용</label> <br><br>
                        </div>
                        <!-- 면적(방 면적) -->
                        <div id="rp">
                            <p id="title">면적(방 면적)</p>
                            <input type="text" id="text" placeholder="방 면적을 입력하세요.(ex. 7.5)"/>
                        </div>
                        <!-- 보증금 -->
                        <div id="rp">
                            <p id="title">보증금</p>
                            <input type="text" id="text" placeholder="보증금을 입력하세요.(ex. 300만원)"/>
                        </div>
                        <!-- 관리비 -->
                        <div id="rp">
                            <p id="title">관리비</p>
                            <input type="text" id="text" placeholder="관리비를 입력하세요.(ex. 10만원)"/>
                        </div>
                        <!-- 월세 -->
                        <div id="rp">
                            <p id="title">월세</p>
                            <input type="text" id="text" placeholder="월세를 입력하세요.(ex. 40만원)"/>
                        </div>
                        <!-- 입주 가능일 -->
                        <div id="rp">
                            <p id="title">입주 가능일</p>
                            <input type="date" name="dateIn">
                        </div>
                    </div>
                    
            </span>
            <span id="rbox2"  style="width: 50%; border: 1px solid black; padding: 1%;">
                <!-- +X 버튼 -->
                <div class="rBtn">
                    <b id="sub">2</b>
                    <button type="button" id="rx_btn" onclick="cancelroom2()">
                        <img src="https://cdn.iconscout.com/icon/free/png-64/remove-324-453166.png" style="width: 40px;">
                    </button>
                    <button type="button" id="r_btn" onclick="addroom2()">
                        <img src="https://cdn.iconscout.com/icon/free/png-64/plus-114-453164.png" style="width: 40px;">
                    </button>
                </div>
                <div id="r2"></div>
            </span>
            </div>
            <div id="room2">
                <span id="rbox3"  style="width: 50%; border: 1px solid black; padding: 1%;">
                    <!-- +X 버튼 -->
                    <div class="rBtn">
                        <b id="sub">3</b>
                        <button type="button" id="rx_btn" onclick="cancelroom3()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/remove-324-453166.png" style="width: 40px;">
                        </button>
                        <button type="button" id="r_btn" onclick="addroom3()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-114-453164.png" style="width: 40px;">
                        </button>
                    </div>
                    <div id="r3"></div>
                </span>
                <span id="rbox4"  style="width: 50%; border: 1px solid black; padding: 1%;">
                    <!-- +X 버튼 -->
                    <div class="rBtn" style="margin-bottom: 5px;">
                        <b id="sub">4</b>
                        <button type="button" id="rx_btn" onclick="cancelroom4()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/remove-324-453166.png" style="width: 40px;">
                        </button>
                    </div>
                    <div id="r4"></div>
                </span>
            </div>
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
                    <input type="text" id="personS" placeholder="비치되어있는 가구를 입력하세요.(ex.침대)" style="width: 100%;"/>
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
                    <input type="text" id="commonS" placeholder="가구와 공용공간을 입력하세요.(ex. 화장실)" style="width: 100%;"/>
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
                    <input type="text" id="serText" placeholder="서비스에 대해 입력하세요.(ex. 와이파이)"/>
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
					<input type="text" id="sample5_address" class="postcodify address" name="address" readonly style="width:80%">
					<input type="button" id="postcodify_search_button" onclick="sample5_execDaumPostcode()" value="주소 검색">
				</div>
				<div class="add">
					<b class="join_title">상세주소</b> <br> 
					<input type="text" class="postcodify details" name="address" style="width:80%">
				</div>
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

				function sample5_execDaumPostcode() {
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
        <div class="house inform" style="padding-top: 27%;">
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
                        <button type="button" id="iBtn" onclick="bankDel()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </span>
                    <div id="bankTa">
                        <input type="text" id="bankText" placeholder="ex. KB국민은행ATM 서울역점" style="width: 100%;"/>
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
                        <input type="text" id="martText" placeholder="ex. 롯데마트 도보 7분" style="width: 100%;"/>
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
                        <input type="text" id="pharmacyText" placeholder="ex. 온누리백합약국 5분" style="width: 100%;"/>
                    </div>
                </span>
            </div>
            <!-- 주유소, 카페, 편의점 -->
            <div>
                <span class="i oil">
                    <img src="https://cdn.iconscout.com/icon/free/png-64/ev-station-1780529-1517619.png" alt="oil" style="width: 30px;">
                    <b>주유소</b>
                    <span class="squareBtn">
                        <button type="button" id="iBtn" onclick="oilAdd()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/plus-112-453066.png" style="width: 30px;">
                        </button>
                        <button type="button" id="iBtn" onclick="oilDel()">
                            <img src="https://cdn.iconscout.com/icon/free/png-64/minus-129-453071.png" style="width: 30px;">
                        </button>
                    </span>
                    <div id="oilTa">
                        <input type="text" id="oilText" placeholder="ex. soil" style="width: 100%;"/>
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
                        <input type="text" id="cafeText" placeholder="ex. 스타벅스" style="width: 100%;"/>
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
                        <input type="text" id="convenienceStoreText" placeholder="ex. GS25 도보 10분" style="width: 100%;"/>
                    </div>
                </span>
            </div>
        </div>
        </div>
        <div class="btnArea" style="padding: 0 0% 0% 30%">
			<button id="submitBtn" style="width:30%;">수정하기</button>
            <button id="submitBtn" style="width:30%;">돌아가기</button>
        </div>
    </form>

    <!-- 제이쿼리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script>
        // option 선택 시 검은색
        $("select").change(function() {
            $(this).css('color','black')
        })  


        // 사진 + 버튼 클릭 시 추가, - 버튼 클릭 시 삭제
        var sindex = 0;
        // 공용공간
        function addShareFile(){
            if(sindex < 4){
                $("<br class='brP'><input type='file' class='addedP'>").appendTo("#sImgZip");
                sindex++;
            }
        }
        function delShareFile(){
            if(sindex > 0){
                $("input[class=addedP]:last").remove();
                $("br[class=brP]:last").remove();
                sindex--;
            }
        }
        
        // 방 사진
        var rindex = 0;
        function addRoomFile(){
            if(rindex < 4){
                $("<br class='brR'><input type='file' class='addedR'>").appendTo("#rImgZip");
                rindex++;
                console.log("rindex : " + rindex);
            }
        }

        function delRoomFile(){
            if(rindex > 0){
                $("input[class=addedR]:last").remove();
                $("br[class=brR]:last").remove();
                rindex--;
            }
        }

        // 편의시설
        var aindex = 0;
        function addAmenFile(){
            if(aindex < 4){
                $("<br class='brA'><input type='file' class='addedA'>").appendTo("#aImgZip");
                aindex++;
            }
        }

        function delAmenFile(){
            if(aindex > 0){
                $("input[class=addedA]:last").remove();
                $("br[class=brA]:last").remove();
                aindex--;
            }
        }

        // 기타
        var eindex = 0;
        function addEtcFile(){
            if(eindex < 4){
                $("<br class='brE'><input type='file' class='addedE'>").appendTo("#eImgZip");
                eindex++;
            }
        }

        function delEtcFile(){
            if(eindex > 0){
                $("input[class=addedE]:last").remove();
                $("br[class=brE]:last").remove();
                eindex--;
            }
        }

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
            }
        }
        function addroom2(){
            if(r3 == true){
                $("#room2").show();
                $("#rbox3").show();
                $("#r3").append($("#r1").html());
                r3 = false;
            }
        }
        function cancelroom2(){
            if(r2 == false){
                $("#r2").empty();
                $("#rbox2").hide();
                r2 = true;
            }
        }
        function addroom3(){
            if(r4 == true){
                $("#rbox4").show();
                $("#r4").append($("#r1").html());
                r4 = false;
            }
        }
        function cancelroom3(){
            if(r3 == false){
                $("#r3").empty();
                $("#rbox3").hide();
                $("#room2").hide();
                r3 = true;
            }
        }
        function cancelroom4(){
            if(r4 == false){
                $("#r4").empty();
                $("#rbox4").hide();
                r4 = true;
            }
        }
        
        // 시설 및 서비스

        // 개인 공간
        var perindex = 0;
        function personalAdd(){
            if(perindex< 4){
                $("<br class='brS'><input type='text' class='addedS' placeholder='비치되어있는 가구를 입력하세요.(ex.침대)'>").appendTo("#serviceP");
                perindex++;
            }
        }

        function personalDel(){
            if(perindex > 0){
                $("input[class=addedS]:last").remove();
                $("br[class=brS]:last").remove();
                perindex--;
            }
        }

        // 공용 공간
        var comindex = 0;
        function commonAdd(){
            if(comindex < 4){
                $("<br class='brS'><input type='text' class='addedS' placeholder='가구와 공용공간을 입력하세요.(ex. 화장실)'>").appendTo("#serviceC");
                comindex++;
            }
        }

        function commonDel(){
            if(comindex > 0){
                $("input[class=addedS]:last").remove();
                $("br[class=brS]:last").remove();
                comindex--;
            }
        }

        // 편의시설
        var serindex = 0;
        function serviceAdd(){
            if(serindex < 4){
                $("<br class='brS'><input type='text' class='addedS' placeholder='서비스에 대해 입력하세요.(ex. 와이파이)''>").appendTo("#serviceS");
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
        var bankIndex = 0;
        function bankAdd(){
            if(bankIndex  < 4){
                $("<br class='brbank'><input type='text' class='addedbank' placeholder='ex. KB국민은행ATM 서울역점'  style='width:100%'>").appendTo("#bankTa");
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
        var martIndex = 0;
        function martAdd(){
            if(martIndex < 4){
                $("<br class='brmart'><input type='text' class='addedmart' placeholder='ex. 롯데마트 도보 7분'  style='width:100%'>").appendTo("#martTa");
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
        var pharmacyIndex = 0;
        function pharmacyAdd(){
            if(pharmacyIndex < 4){
                $("<br class='brpha'><input type='text' class='addedpha' placeholder='ex. 온누리백합약국 5분' style='width:100%'>").appendTo("#pharmacyTa");
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


        // 주유소
        var oilIndex = 0;
        function oilAdd(){
            if(oilIndex < 4){
                $("<br class='broil'><input type='text' class='addedoil' placeholder='ex. soil' style='width:100%'>").appendTo("#oilTa");
                oilIndex ++;
            }
        }

        function oilDel(){
            if(oilIndex> 0){
                $("input[class=addedoil]:last").remove();
                $("br[class=broil]:last").remove();
                oilIndex--;
            }
        }

        //카페
        var cafeIndex = 0;
        function cafeAdd(){
            if(cafeIndex < 4){
                $("<br class='brcafe'><input type='text' class='addedcafe' placeholder='ex. 스타벅스' style='width:100%'>").appendTo("#cafeTa");
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
        var convenienceStoreIndex = 0;
        function convenienceStoreAdd(){
            if(convenienceStoreIndex < 4){
                $("<br class='brcon'><input type='text' class='addedcon' placeholder='ex. GS25 도보 10분' style='width:100%'>").appendTo("#convenienceStoreTa");
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
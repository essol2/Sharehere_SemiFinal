<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, house.model.vo.Search"%>
<%
   ArrayList<Search> keywordlist = (ArrayList<Search>)request.getAttribute("keywordlist");
   String keyword = (String)request.getAttribute("search");
%>   
<!DOCTYPE html>
<html>
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
<meta charset="UTF-8">
<title>검색 결과 페이지</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
 
<!-- navi css 경로 -->
<link href="<%= request.getContextPath() %>/views/common/nav_foot.css"
   rel="stylesheet" type="text/css">  
<style>
  /* 검색바 영역 */
     
        
        .selectoption {
            width : 20%;
            height : 50px;
            border-radius: 3px;
            border : 1px solid lightgray;
            margin-top: 2%;
           
        }
        
        #option1 {
            margin-left: 5%;
        }

          
      
        #searchtext {
            width : 45%;
            height : 50px;
            margin-left: 1.5%;
            margin-top: 1%;
            border-radius: 3px;
            border : 1px solid lightgray;
            background-color: ghostwhite;
        }
        #searchbutton {
            width : 8%;
            height : 50px;
            background: black;
            color : white;
            border-radius: 7px;
            border : 1px solid black;
        }
        
        /* 리스트 영역 */
        
        #possible {
            background-color: rgb(14, 92, 18);
           color: white;
           border-radius: 5px 5px 5px 5px;
           border: 0px;
           float: right;
           font-size: 13px;
            padding: 5px 20px 5px 20px;
            
        }

        #impossible {
            background-color: rgb(119, 13, 13);
           color : white;
           padding: 5px 20px 5px 20px;
           border-radius: 5px 5px 5px 5px;
           border: 0px;
           float: right;
           font-size: 13px;
            padding: 5px 20px 5px 20px;
        }
      
      /* 전체 리스트 영역 (너비 조절은 인라인으로 함)*/
        .container {
            float: left;
        }
        
        .row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3{
           border : 1px silid blue;
           
        }
         #list:hover{
            cursor:pointer;
         }
      
      
        .card-text{
           font-weight: bold;
           font-size:small;
        }
      
      .container {
      margin-top : 2%;
      }
      
      .mapbtn{
      margin-top: -2%;
      }
     
  .container {
    width: 250px;
    height: 400px;
    overflow: auto;
    
  }
  .container::-webkit-scrollbar {
    width: 10px;
    display:none;
  }
  .container::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  .container::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }   
  .card-text{
  height : 133px;
  }  
</style>
</head>
<body>
<!--  페이지를 이동해도 navi는 계속 상단에 노출되게끔 -->
   <%@include file="/views/common/navi.jsp"%>
  
   <br>
<!-- 검색 폼 영역 -->
        <div id="searcharea">
            <div id="searchbar">
                <form action="<%= request.getContextPath() %>/house/search" method="get">
       
        <input type="search" id="searchtext" placeholder="지역, 지하철역 검색" size="100" name="search" value="">
        <button type="submit" id="searchbutton">search</button>
    </form>
            </div>
        </div>
    
    <br>
            
    <!-- 리스트 영역 -->
    

   <span>
   
   
      <!-- 전체 리스트 감싸고 있는 div -->
      <div class="container" style="width: 58%;">
      
         <!-- 리스트 한개의 크기를 잡아주는 div -->
         <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" height="100" >
         <% if(keywordlist != null && !keywordlist.isEmpty()) { %>
               <% for(Search s : keywordlist) { %>
               
            <!-- 리스트 사이의 간격 조절하는 div -->
            <div class="col" >
               <!-- 사진과 텍스트 감싸고 있는 div -->
               
               <div class="card shadow-sm" >
                  <img
                     src="<%= request.getContextPath() %><%= s.getShIpath() %><%= s.getShChName() %>"
                     alt="이미지영역" class="bd-placeholder-img card-img-top" width="100%"
                     height="180">
                     
                  <form action='<%= request.getContextPath()%>/search/detail' method="GET">
                  <!-- 사진 아래 텍스트 영역 -->   
                  <div class="card-body" height="80">
                     <p class="card-text">
                     <input type="hidden" name="shNo" value="<%= s.getShNo() %>">
                       <span>
                        <%= s.getShTitle() %>
                        <button type="submit" class="btn" id="possible" >입주가능</button>
                       </span>
                     
                        <br>
                        <br><%= s.getShType() %><br><br> <%= s.getShAddress() %>
                        <br>
                        
                        </form>
                     </p>
                  </div>
               </div>
            </div>
         <% } %>
      <% } %>
         </div>
         </div>
   
   </span>
 <!-- 카카오맵 API 영역 -->
   
   
 
   <span id="map" style="width: 42%; height: 480px; float : right; position:relative; z-index:1;"> 
   <button class="mapbtn" onclick="panTo()" style="padding-top: 2%; position:relative; z-index:3; background:rgba(0,0,0,0.01); border: 0px; float: right;">
   		<img src="<%= request.getContextPath() %>/views/House/host/hst_img/clickImg.png">
   </button>   </span>
   <!-- 카카오맵스크립트 -->
   
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a48a450831988c6babadada9c0aed59&libraries=services&libraries=services"></script>
   <script>
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
   mapOption = {
      center : new kakao.maps.LatLng(37.5666805, 126.9784147), // 지도의 중심좌표
      level : 7  // 지도의 확대 레벨
   };

   var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
   
   
   <%for (Search s : keywordlist) {%>
   function setCenter() {            
       // 이동할 위도 경도 위치를 생성합니다 
       var moveLatLon = new kakao.maps.LatLng(<%=s.getShLa()%>, <%=s.getShLo()%>);
       
       // 지도 중심을 이동 시킵니다
       map.setCenter(moveLatLon);
   }

   function panTo() {
       // 이동할 위도 경도 위치를 생성합니다 
       var moveLatLon = new kakao.maps.LatLng(<%=s.getShLa()%>, <%=s.getShLo()%>);
       
       // 지도 중심을 부드럽게 이동시킵니다
       // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
       map.panTo(moveLatLon);            
   }        
   <%}%>
   
   //마커를 표시할 위치와 title 객체 배열입니다     (여기에 검색리스트를 담아)
   <%for (Search s : keywordlist) {%>
   var positions = [ {
      title : "<%=s.getShTitle()%>",
      latlng : new kakao.maps.LatLng(<%=s.getShLa()%>,<%=s.getShLo()%>)
   } ];
      
   //마커 이미지의 이미지 주소입니다
   var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png";

   for (var i = 0; i < positions.length; i++) {

      // 마커 이미지의 이미지 크기 입니다
      var imageSize = new kakao.maps.Size(24, 35);

      // 마커 이미지를 생성합니다    
      var markerImage = new kakao.maps.MarkerImage(imageSrc,
            imageSize);

      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
         map : map,                      // 마커를 표시할 지도
         position : positions[i].latlng,    // 마커를 표시할 위치
         title : "<%=s.getShTitle()%>",       // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
         image : markerImage               // 마커 이미지 
               });
            }
            
         <% }%>
         </script>
   
   
   
   
   
   
    <br><br>
    
    
   
    
    
    
    
 
    
 
      
   
    
    <!--  페이지를 이동해도 footer는 계속 하단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp"%>
</body>

</html>
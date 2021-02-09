<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="house.model.vo.*, java.util.ArrayList"%>
  
<%
ArrayList<MainHouse> mainhouseList = (ArrayList<MainHouse>)request.getAttribute("mainhouseList");
String mainhouse = (String)request.getAttribute("house");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최신하우스</title>

<!-- navi css 경로 -->
<link href ="${pageContext.request.contextPath}/views/common/nav_foot.css" rel="stylesheet" type="text/css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
    <!-- font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<style>

        /* populare Share Houses */
        h1, p{
            font-family: 'Nanum Gothic', sans-serif;
        }

        #popular{
            margin-left: 5%;
            margin-top : 3%;
            margin-bottom: 3%;
        }
      
       #pointer{
       
       cursor : pointer;
       } 
     
</style>

</head>
<body>
<%@include file="/views/common/navi.jsp" %>

<section class="popular-sharehouse">
    <h1 style="font-size: 35px;" id="popular">최신 쉐어하우스</h1>
    <div class="container">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
<% if(mainhouseList != null && !mainhouseList.isEmpty()) { %>
<% for(int i = 0; i < mainhouseList.size(); i++ ) { %>
                

        <div class="col" id="pointer">
        <div class="card shadow-sm" id="houseimg<%= i %>" >
            <img src="<%= request.getContextPath() %><%= mainhouseList.get(i).getShIpath() %><%= mainhouseList.get(i).getShChName() %>" alt="우주84호점" class="bd-placeholder-img card-img-top" 
             width="100%" height="225">
            <div class="card-body">
                <p class="card-text">
                    잠실 <br><br>
                    <%= mainhouseList.get(i).getShIntro() %>
                </p>
                
                <input type="hidden"  name="shNo" value="<%= mainhouseList.get(i).getShNo() %>">
              
            </div>
        </div>
        </div>
        
<% }  %>
<% } %>
</div>
</div>
</section>
 
    <!--  페이지를 이동해도 footer는 계속 하단에 노출되게끔 -->
   <%@include file="/views/common/footer.jsp"%>
</body>

<script>
<% if(mainhouseList != null && !mainhouseList.isEmpty()) { %>
<% for(int i = 0; i < mainhouseList.size(); i++ ) { %>
$(function(){
   $('#houseimg<%=i%>').click(function(){
      var shNo = "<%= mainhouseList.get(i).getShNo() %>";
      
   location.href="<%= request.getContextPath()%>/search/detail?shNo="+ shNo;
   
   });
});
<% } %>
<% } %>
      


</script>

 
</html>
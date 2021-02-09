<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>This is a ShareHere footer</title> 
 
<!-- Bootstrap core CSS -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
   crossorigin="anonymous">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
   crossorigin="anonymous"></script>

<!-- Navi & footer CSS-->
<link href="./nav_foot.css" rel="stylesheet" type="text/css">
<style>
@font-face {
    font-family: 'MapoFlowerIsland';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
   font-family: 'MapoFlowerIsland';
}
</style>
</head>
<body>
   <footer>
      <div id='img' style="width: 100%;">
         <hr style="width: 100%;">
         <div id="logoWrap" style="align-items: center;">
            <img id='logo_footer'
               src="${pageContext.request.contextPath}/views/common/img/footerLogo.png"
               style="width: 5%;" alt="">
         </div>
         <div id='icons'>
            <img src="https://cdn.iconscout.com/icon/free/png-64/css3-2474814-2056053.png" style="width: 1%;" alt="css"> 
            <img src="https://cdn.iconscout.com/icon/free/png-64/javascript-14-436639.png" style="width: 1%;" alt="js"> 
            <img src="https://cdn.iconscout.com/icon/free/png-64/github-1521500-1288242.png" style="width: 1%; alt="github"> 
            <img src="https://cdn.iconscout.com/icon/free/png-64/visual-studio-2749379-2284769.png" style="width: 1%; alt="visual"> 
            <img src="https://cdn.iconscout.com/icon/free/png-64/eclipse-16-458275.png" style="width: 1%; alt="eclipse"> 
            <img src="https://cdn.iconscout.com/icon/free/png-64/map-918-434077.png" style="width: 1%; alt="map"> 
            <img src="https://cdn.iconscout.com/icon/free/png-64/chat-1438144-1213934.png" style="width: 1%; alt="chat">
         </div>
      </div>
      <div id='footer_text'>
         <p>
            <b> © Sadari Inc. 2020. </b> <br> We link you and your house <br>
            KH academy <br> sharehere

         </p>
      </div>
   </footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, administrator.model.vo.*"%>
    
<% int thisYear = (int)request.getAttribute("thisYear");
   int thisMonth = (int) request.getAttribute("thisMonth");
   int thisMonthRMTotal = (int)request.getAttribute("thisMonthRMTotal");
   int thisMonthSHTotal = (int)request.getAttribute("thisMonthSHTotal");
   int thisMonthTotal = (int)request.getAttribute("thisMonthTotal");
   ArrayList<Income> incomeRMList = (ArrayList<Income>)request.getAttribute("incomeRMList");
   ArrayList<Income> incomeSHList = (ArrayList<Income>)request.getAttribute("incomeSHList");
   System.out.println(incomeRMList);%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
	<!-- 차트 링크 --> 
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Income</title>
    <link href="${pageContext.request.contextPath}/views/admin/adm_leftmenu.css" rel="stylesheet" type="text/css">
    

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

		#toDay{
			margin-top : 3%;
			margin-left : 7%;
			padding-botton : 5%;
			font-size : 30px;
			display : inline-block;
		
		}
		
		#thisMonthTotal{
			margin-top : 3%;
			font-size : 50px;
			margin-left : 1%;
			padding-botton : 5%;
			display : inline-block;
			color : lightgray;
			
		}
		
		#pagingBtn{
		border : none;
		background-color : white;
		border-style:none;
	}
	
	.pagingArea{
		width : auto;
		margin-left: 63%; 
	}

    </style>         
           


</head>
<body>

    <div class="leftMenu">
        <img src='${pageContext.request.contextPath}/views/admin/adm_img/menuImg.jpg'id="menuImg">
       <a href="${pageContext.request.contextPath}/views/admin/adm_first.jsp"><img src = "${pageContext.request.contextPath}/views/admin/adm_img/adminLogo.png" id="adminLogo"></a>
        <a href="${pageContext.request.contextPath}/income/report" id="title_link"><h1 style="margin-top : 5%;">Income</h1></a>
        <div id="title_Btns">
            <ul id="btnList"> 
                <li><button class="menuBtn" id="rmBtn" type="button">룸메이트 결제내역</button></li>
                <li><button class="menuBtn" id="shBtn" type="button">하우스 결제내역</button></li>
            </ul>
             <script>
            	const rmBtn = document.getElementById('rmBtn');
            	rmBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/income/rm/list';
            	});
            	
            	const shBtn = document.getElementById('shBtn');
            	shBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/income/sh/list';
            	});

            </script>
        </div>
    </div>
    
      <div id="MonthlyTotal">
	    <div id="toDay"> <%=thisYear%>년 <%=thisMonth %>월 
	    				현재까지 매출 : </div>
	    <div id="thisMonthTotal"> <%=thisMonthTotal %>원</div>
    </div>
    <br><hr><hr>
    
   
    
    <div class="container" style="width:550px; height:350px; margin-left:42%; margin-right:5%"> 
    	<canvas id="myChart"></canvas> 
    </div> 
    <!-- 부트스트랩 --> 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<div id="chartArea">
    <script>
   
		const colors = ['lightpink','gray','#8977AD','#c3e6cb','#dc3545','#6c757d'];
		
		var ctx = document.getElementById('myChart');
		
		var chartData = { 
			labels: ["<%=incomeRMList.get(0).getThis_month()%>", "<%=incomeRMList.get(1).getThis_month()%>", "<%=incomeRMList.get(2).getThis_month()%>", "<%=incomeRMList.get(3).getThis_month()%>", "<%=incomeRMList.get(4).getThis_month()%>"],
			datasets: [{ data: [<%=incomeRMList.get(0).getHowmuch()%>, <%=incomeRMList.get(1).getHowmuch()%>, <%=incomeRMList.get(2).getHowmuch()%>, <%=incomeRMList.get(3).getHowmuch()%>, <%=incomeRMList.get(4).getHowmuch()%>],
					backgroundColor: 'transparent', 
					borderColor: colors[2], 
					borderWidth: 3, 
					pointBackgroundColor: colors[0] 
				}, 
				{
					data: [<%=incomeSHList.get(0).getHowmuch()%>, <%=incomeSHList.get(1).getHowmuch()%>, <%=incomeSHList.get(2).getHowmuch()%>, <%=incomeSHList.get(3).getHowmuch()%>, <%=incomeSHList.get(4).getHowmuch()%>], 
					backgroundColor: 'transparent', 
					borderColor: colors[0], 
					borderWidth: 3, 
					pointBackgroundColor: colors[0] 
				} 
			] };

		var myChart = new Chart(ctx, {
			type: 'line', 
			// 챠트를 그릴 데이타 
			data: chartData, 
			// 옵션 
			options: { 
				maintainAspectRatio: false,
				legend: { 
					display: false 
					} }
		});

	</script>
	</div>
</body>
</html>
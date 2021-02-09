<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, administrator.model.vo.*"%>
<% ArrayList<RmReport> list = (ArrayList<RmReport>)request.getAttribute("list");
 
 
	PageInfoForRR pi = (PageInfoForRR)request.getAttribute("pi");
	
	ADM_Search s = (ADM_Search)request.getAttribute("search");
	String search = "";
	String searchCondition = "";
	String[] selected = new String[3];
	if(s != null){
		search = s.getSearch();
		searchCondition = s.getSearchCondition();
		if(searchCondition.equals("writer")){
			selected[0] = "selected";
		}else if(searchCondition.equals("title")){
			selected[1] = "selected";
		}else{
			selected[2] = "selected";
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

<!-- JQUERY-UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 
<!-- bootstrap.min.css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- bootstrap-theme.min.css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<!-- bootstrap.min.js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<meta charset="UTF-8">
<title>Member</title>

<!-- LeftMenu.Css -->
<link href="${pageContext.request.contextPath}/views/admin/admin_leftmenu.css" rel="stylesheet" type="text/css">
 
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
		body{
		    margin: 0;
		    padding: 0;
		}
		
		#menuImg{
		    float : left;
		    width: 400px;
		    height: 690px;
		    position: relative;
		}
		
		.menuBtn{
		    background-color: black;
		    color:white;
		    width: 100px;
		    height : 50px;
		    margin:30px;
		    opacity: 60%;
		    font-size: medium;
		    border : none;
		    width : 250px;
		    height: 60px;
		    cursor:pointer;
		    outline:none;
		}
		
		.menuBtn:hover{
		    opacity: 100%;
		}
		
		#adminLogo{
		    /*border : 1px solid red;*/
		    width : 150px;
		    position : absolute;
		    top : 50px;
		    left : 130px;
		}
		
		#title_Btns{
		    /*border : 1px solid blue;*/
		    position: absolute;
		    top : 280px;
		    left : 3px;
		}
		
		#title_link{
		    color : black;
		    width : 400px;
		    text-align: center;
		    font-size: 90px;
		    position: absolute;
		    left : 1px;
		    top : 150px;
		    text-decoration : none;
		    /*border : 1px solid orange;*/
		}
		
		#btnList{
		    list-style: none;
		    text-align: left;
		    margin-top : 10px;
		    
		}
		#btnList li{
		    /*border : 1px solid white;*/
		    margin-right: 40px;
		    height : 80px;
		}
        #summTable, td, tr{
            border-collapse: collapse;
            height : 50px;
        }

    	 #summTable{
            text-align : center;
            width : 40%;
            display : inline-block;
            float : right;
            font-size : 20px;
            box-sizing: border-box; 
            margin-top:50px;
            margin-right : 20px;
        }

        #summTable td, tr{
            padding-left : 15px;
            /*padding-right : 5px;*/
            margin-left : 6px;
        }

        #tableTitle{
            font-size: 25px;
        }

        .summary{
            /*border: 1px solid blue;*/
            display : relative;
            margin-left : 400px;
            width : 700px;
        }

        #wrapTitle{
            /*border: 1px solid red;*/
            text-align: center;
            padding-top: 30px;
            font-size: 40px;
            margin-top:0;
        }

        .textShowBox{
            border : 1px solid gray;
            text-align: center;
            padding-right : 10px;
            padding-top : 20px;
            margin-left : 5px;
            width : 100px;
            height : 40px;
            font-size: 50px;
        }

		#listTable{
            display : block;
            margin-left : 400px;
            width : 700px;
            float:center;
        }

        #illMemberTable{
            text-align: center;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            border-collapse: collapse;
            width: 650px;
            margin-left : 25px;
        }

        #illMemberTable>th{
            padding-top : 7px;
            padding-bottom: 7px;
            /*border-top: 1px solid black;
            border-bottom: 1px solid black;*/
        }

        #illMemberTable td{
            padding-top : 3px;
            padding-bottom : 3px;
        }

        #fromSecond{
        border-bottom: 1px solid lightgray;
        height : 30px;
    }
    
    .pagingArea{
    	margin-left : 250px;
    }
    
    #forStyle{
    	display : absolute; 
    	left : 50px; 
    	/* border : 1px solid red; */ 
    	align-items : right;
    }
    
    .myChart1{
    	width : 350px;
    	height : 350px;
    	padding-left : 10%;
    }
    
    #fromSecondTd{
    	border-bottom: 1px solid gray;
    }
    
    #illTitle{
		text-align : center;
	}
	
	.pagingArea{
		width : auto;
		margin-left: 63%; 
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
        <img src='${pageContext.request.contextPath}/views/admin/adm_img/menuImg.jpg'id="menuImg" >
        <a href="${pageContext.request.contextPath}/views/admin/adm_first.jsp"><img src = "${pageContext.request.contextPath}/views/admin/adm_img/adminLogo.png" id="adminLogo"></a>
        <a href="<%=request.getContextPath()%>/rmreport/list" id="title_link">Member</a>
        <div id="title_Btns">
            <ul id="btnList"> 
                <li><button class="menuBtn" id="userBtn" type="button">일반회원</button></li>
                <li><button class="menuBtn" id="hostBtn" type="button">임대인</button></li>
                <li><button class="menuBtn" id="outMemBtn" type="button">탈퇴회원</button></li>
            </ul>
            <script>
            	const userBtn = document.getElementById('userBtn');
            	userBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/usermem/list';
            	});
            	
            	const hostBtn = document.getElementById('hostBtn');
            	hostBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/hostmem/list';
            	});
            	
            	const outBtn = document.getElementById('outMemBtn');
            	outMemBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/outmem/list';
            	});
            </script>
        </div>
    </div>

    <div class="summary">
        <h2 id="wrapTitle">이번달 신규 회원</h2>
        <hr>
        <div id="summBoxes">
            <table id="summTable">
                <tr>
                    <td id="fromSecondTd">일반회원&nbsp&nbsp</td>
                    <td id="fromSecondTd">임대인&nbsp&nbsp</td>
               		<td id="fromSecondTd">Total&nbsp&nbsp&nbsp</td>
                </tr>
                <tr>
                    <td>53</td>
                    <td>12</td>
               		<td>65</td>
                </tr>

            </table>
        </div>
    </div>

	<!--  차트 넣을 공간 -->

<div id="forStyle">
	
<canvas id="myChart1" width = "400px;" margin-left="5%;"></canvas>
<!-- <canvas id="myChart2" width = "350px;" margin-left="5%;"></canvas> -->
<script>
	
var ctx = document.getElementById("myChart1");
var myChart1 = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ['21.01', '20.12', '20.11', '20.10'],
    datasets: [{
      label: '# of Tomatoes',
      data: [133, 100, 98, 99],
      backgroundColor: [
        'rgba(255, 99, 132, 0.5)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)'
      ],
      borderColor: [
        'rgba(255,99,132,1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)'
      ],
      borderWidth: 1
    }]
  },
  options: {
   	//cutoutPercentage: 40,
    responsive: false,

  }
});

var ctx = document.getElementById("myChart2");
var myChart2 = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: ['21.01', '20.12', '20.11', '20.10'], 
    datasets: [{
      label: '# of Tomatoes',
      data: [12, 15, 13, 5],
      backgroundColor: [
        'rgba(255, 99, 132, 0.5)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)'
      ],
      borderColor: [
        'rgba(255,99,132,1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)'
      ],
      borderWidth: 1
    }]
  },
  options: {
   	//cutoutPercentage: 40,
    responsive: false,

  }
});
</script>
</div>
   
	<h2 style="text-align: center;" id="forLay">사용자 신고 내역</h2>
    <div id="listTable" style="overflow:scroll;">
        <table id="illMemberTable" style="width:670px;">
            <tr  id="illTitle" style="border-bottom : 1px solid gray;">
               <th style="text-align : center;">신고번호</th>
                <th style="text-align : center;">신고일</th>
                <th style="text-align : center;">신고당한 회원번호</th>
                <th style="text-align : center;">상세보기</th>
            </tr>
            <% if(list.isEmpty()){%>
            	<tr>
            		<td colspan="5">신고내역이 없습니다.</td>
            	</tr>
            	
            <% } else{
            	for(int i=0; i<list.size(); i++){%>
	            <tr id="fromSecond">
	                <td><%= list.get(i).getUs_report_num()%></td>
	                <td><%= list.get(i).getRm_report_date()%></td>
	                <td><%= list.get(i).getUs_no2()%></td>
	                <td><button type="button" class="btn btn-dark" data-toggle="modal" data-target="#<%=i%>reportBtn">상세보기</button></td>
	            </tr>
			<%	}
          }%>
        </table>
    </div>
    
    <!-- Modal -->
    <%for(int i=0; i<list.size(); i++) { %>
	<div class="modal fade" id="<%=i%>reportBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">회원 신고 상세내용</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	       <pre> 
	       신고번호 : <%= list.get(i).getUs_report_num()%>
	       일자 : <%= list.get(i).getRm_report_date() %>
	       신고인 :<%= list.get(i).getUs_no() %>
	       신고대상 : <%= list.get(i).getUs_no2() %>
	       신고사유 : <%= list.get(i).getRm_report() %>
	       신고내용 : <%= list.get(i).getRm_report_content() %>
	       </pre>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">뒤로가기</button>
	        <button type="button" class="btn btn-warning" id="sendWarning<%=i%>">경고메세지 전송</button>
	        <button type="button" class="btn btn-danger" id="getOutMem<%=i%>">탈퇴시키기</button>
	      </div>
	    </div>
	    
	  </div>
	</div>
	<%} %>
    
     <!-- 페이징 바 -->
		<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<% if(s == null){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/rmreport/list?currentPage=1'" id="pagingBtn" class="pageBtn"> &lt;&lt; </button>
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=1&searchCondition=<%= searchCondition %>&search=<%= search %>'" id="pagingBtn" class="pageBtn"> &lt;&lt; </button>
			<% } %>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled id="pagingBtn" > &lt; </button>
			<%}else if(s == null) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/rmreport/list?currentPage=<%= pi.getCurrentPage() - 1 %>'" id="pagingBtn" class="pageBtn"> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getCurrentPage() - 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'" id="pagingBtn" class="pageBtn"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button style="background:lightgray;" id="pagingBtn" class="pageBtn" disabled > <%= p %> </button>
				<%}else if(s == null){ %>
					<button onclick="location.href='<%= request.getContextPath() %>/rmreport/list?currentPage=<%= p %>'" id="pagingBtn" class="pageBtn"> <%= p %> </button>
				<%} else {%>
					<button onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= p %>&searchCondition=<%= searchCondition %>&search=<%= search %>'" id="pagingBtn" class="pageBtn"> <%= p %> </button>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled id="pagingBtn"> &gt; </button>
			<%} else if(s == null) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/rmreport/list?currentPage=<%= pi.getCurrentPage() + 1 %>'" id="pagingBtn" class="pageBtn">  &gt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getCurrentPage() + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'" id="pagingBtn" class="pageBtn"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<% if(s == null){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/rmreport/list?currentPage=<%= pi.getMaxPage() %>'" id="pagingBtn" class="pageBtn"> &gt;&gt; </button>
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getMaxPage() %>&searchCondition=<%= searchCondition %>&search=<%= search %>'" id="pagingBtn" class="pageBtn"> &gt;&gt; </button>
			<% } %>
		</div>   
    </div>
    <script>
    <%for(int i=0; i<list.size(); i++){%>
    	const sendWarning<%=i%> = document.getElementById("sendWarning<%=i%>");
    	sendWarning<%=i%>.addEventListener('click', function(){
    		<% int rmNo =list.get(i).getUs_report_num(); %>
			location.href='<%=request.getContextPath()%>/send/warning?rmNo='+<%= rmNo %>;
		});
    	
    	const getOutMem<%=i%> = document.getElementById("getOutMem<%=i%>");
    	getOutMem<%=i%>.addEventListener('click', function(){
    		<% String delRmNo =list.get(i).getUs_no2(); %> 
			location.href='<%=request.getContextPath()%>/remove/report?delRmNo='+'<%= delRmNo %>';
		});
    <%}%>
    	
    </script>
    
</body>
</html>
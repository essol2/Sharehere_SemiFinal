<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, administrator.model.vo.*"%>
<% ArrayList<ShReport> list = (ArrayList<ShReport>)request.getAttribute("list");
   ArrayList<Sharehouse> preNewSh = (ArrayList<Sharehouse>)request.getAttribute("preNewSh");
	
   int howManyToday = (int)request.getAttribute("howManyToday");
   int howManyThisMonth = (int)request.getAttribute("howManyThisMonth");
   int howManyLastMonth = (int)request.getAttribute("howManyLastMonth");
   
   PageInfoForSR pi = (PageInfoForSR)request.getAttribute("pi");
	
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
 
<%if(list == null){%>
<script>
	window.onload() = function(){
		location.href='<%=request.getContextPath()%>/shreport/list';
	}
</script>
<% } %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShareHouse</title>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

	<!-- JQUERY-UI -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	 
	<!-- bootstrap.min.css -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	 
	<!-- bootstrap-theme.min.css -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 
	<!-- bootstrap.min.js -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
    <link href="../admin/admin_leftMenuCss.css" rel="stylesheet" type="text/css">
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
        	/*border : 1px solid black;*/
            border-collapse: collapse;
        }

        #summTable{
        
            text-align : center;
            width : 100%;
        }

        #summTable td, tr{
            padding-left : 10px;
            padding-right : 5px;
        }

        #tableTitle{
            font-size: 25px;
        }

        .summary{
            /*border: 1px solid blue;*/
            display : block;
            margin-left : 400px;
            width : 700px;
            float:center;
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
            text-align: right;
            padding-right : 10px;
            padding-top : 20px;
            margin-left : 5px;
            width : 200px;
            height : 40px;
            font-size: 20px;
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
    
   #pagingBtn{
		border : none;
		background-color : white;
		border-style:none;
	}
	
	
</style>
</head>
<body>
    <div class="leftMenu">
        <img src='${pageContext.request.contextPath}/views/admin/adm_img/menuImg.jpg'id="menuImg">
       <a href="${pageContext.request.contextPath}/views/admin/adm_first.jsp"><img src = "${pageContext.request.contextPath}/views/admin/adm_img/adminLogo.png" id="adminLogo"></a>
        <a href="<%=request.getContextPath()%>/shreport/list" id="title_link">Share House</a>
        <div id="title_Btns">
            <ul id="btnList"> 
          <br><br><br>
                <li><button class="menuBtn" id="shBtn" type="button">쉐어하우스 리스트</button></li>
                <li><button class="menuBtn" id="delShBtn" type="button">삭제된 매물보기</button></li>
            </ul>
             <script>
            	const shBtn = document.getElementById('shBtn');
            	shBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/sharehouse/list';
            	});
            	
            	const delShBtn = document.getElementById('delShBtn');
            	delShBtn.addEventListener('click', function(){
            		location.href='<%=request.getContextPath()%>/delsharehouse/list';
            	});

            </script>
        </div>
    </div>

    <div class="summary">
        <div id="summBoxes">
            <table id="summTable">
            	<tr>
            		<td style="height:30px;"></td>
            	</tr>
                <tr id="tableTitle">
                    <td id="forWidth1">이번달</td>
                    <td rowspan="2" id="forWidth2"><div class="textShowBox" id="newUsers" > <%=howManyThisMonth %></div></td>
                </tr>
                <tr id="tableTitle">
                    <td>신규 쉐어하우스</td>
                </tr>
                <tr>
                	<td style="height : 10px;"></td>
                </tr>
                <tr>
                    <td colspan="3" style="height : 100px;"> 
                    	<div style = "padding : 1%;">
	                    	<canvas id="myChart" width="600px;" height="200"></canvas>
	                    	
							<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
							<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>
							<script>
							    var data =
							    {
							        labels: ["<%=preNewSh.get(0).getThis_month()%>", "<%=preNewSh.get(1).getThis_month()%>", "<%=preNewSh.get(2).getThis_month()%>", "<%=preNewSh.get(3).getThis_month()%>", "<%=preNewSh.get(4).getThis_month()%>"],
							        datasets:
							            [{
							                label: "My First dataset",
							                fillColor: "lightgray",
							                strokeColor: "lightpink",
							                highlightFill: "rgba(150,200,250,0.75)",
							                highlightStroke: "rgba(150,200,250,1)",
							                data: [<%=preNewSh.get(0).getHowmany()%>, <%=preNewSh.get(1).getHowmany()%>, <%=preNewSh.get(2).getHowmany()%>, <%=preNewSh.get(3).getHowmany()%>, <%=preNewSh.get(4).getHowmany()%>]
							            }]
							    };
							
							    var options = { animation: true };
							    var ctx = $('#myChart').get(0).getContext('2d');
							    var myBarChart = new Chart(ctx).Bar(data, options); 
							</script> 
						</div>
					</td>
                </tr>
           
            </table>
        </div>
    </div>
  
    <h2 style="text-align: center;" id="forLay">쉐어하우스 신고 내역</h2>
    <div id="listTable">
        <table id="illMemberTable">
            <tr>
                <th id="fromSecond">신고번호</th>
                <th>신고일</th>
                <th>신고당한 매물번호</th>
                <th>자세히보기</th>
            </tr>
            <%if(list.isEmpty()){ %>
            	<tr>
            		<td colspan="4">신고내역이 없습니다.</td>
            	</tr>
            <%} else{
            	for(int i=0; i<list.size(); i++ ){%>
	            <tr id="fromSecond">
	                <td><%=list.get(i).getSh_reportnum()%></td>
	                <td><%=list.get(i).getSh_report_date()%></td>
	                <td><%=list.get(i).getSh_no()%></td>
	                <td><button type="button" class="btn btn-dark" data-toggle="modal" data-target="#<%=i%>reportBtn">상세보기</button></td>

	            </tr>
           	 	<%} %>
           	 <%} %>
  
        </table>
       </div>
       
       <!-- Modal -->
	    <%for(int i=0; i<list.size(); i++) { %>
		<div class="modal fade" id="<%=i%>reportBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">쉐어하우스 신고 상세내용</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       <pre> 
		       신고번호 : <%= list.get(i).getSh_reportnum()%>
		       신고사유 : <%= list.get(i).getSh_reason() %>
		       신고내용 :<%= list.get(i).getSh_content() %>
		       신고일 : <%= list.get(i).getSh_report_date() %>
		       해당매물 : <%= list.get(i).getSh_no() %>
		       신고인 :   <%= list.get(i).getUs_no() %></pre>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">뒤로가기</button>
		        <button type="button" class="btn btn-warning" id="sendWarning<%=i%>">경고메세지 전송</button>
		        <button type="button" class="btn btn-danger" id="getOutMem<%=i%>">삭제시키기</button>
		      </div>
		    </div>
		    
		  </div>
		</div>
		<%} %>
        
        <!-- 페이징 바 -->
		<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<% if(s == null){ %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/shreport/list?currentPage=1'"> &lt;&lt; </button>
			<% } else { %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=1&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;&lt; </button>
			<% } %>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button id="pagingBtn" disabled> &lt; </button>
			<%}else if(s == null) { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/shreport/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<%} else { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getCurrentPage() - 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button id="pagingBtn" style="background:lightgray;" disabled> <%= p %> </button>
				<%}else if(s == null){ %>
					<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/shreport/list?currentPage=<%= p %>'"> <%= p %> </button>
				<%} else {%>
					<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= p %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> <%= p %> </button>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button id="pagingBtn" disabled> &gt; </button>
			<%} else if(s == null) { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/shreport/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<%} else { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getCurrentPage() + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<% if(s == null){ %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/shreport/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			<% } else { %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getMaxPage() %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;&gt; </button>
			<% } %>
		</div>   
    </div>

	<script>
    <%for(int i=0; i<list.size(); i++){%>
    	const sendWarning<%=i%> = document.getElementById("sendWarning<%=i%>");
    	sendWarning<%=i%>.addEventListener('click', function(){
    		<% String shNo =list.get(i).getSh_reportnum(); %>
			location.href='<%=request.getContextPath()%>/send/warning?rmNo=0&shNo='+'<%=shNo%>';
		});
    	
    	const getOutMem<%=i%> = document.getElementById("getOutMem<%=i%>");
    	getOutMem<%=i%>.addEventListener('click', function(){
    		<% String delShNo =list.get(i).getSh_no(); %>
			location.href='<%=request.getContextPath()%>/remove/report?delShNo='+'<%= delShNo %>';
		});
    <%}%>
    	
    </script>
</body>
</html>
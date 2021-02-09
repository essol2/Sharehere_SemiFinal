<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.lang.Object, administrator.model.vo.*"%>
<%	ArrayList<Sharehouse> hList = (ArrayList<Sharehouse>)request.getAttribute("hList");
	String admPwd = (String)request.getAttribute("admPwd");
	String twoHouseList2 = (String)request.getAttribute("twoHouseList2");
	/* System.out.println("twoHouseList2 값이 jsp로 잘 들어왔는가? : " + twoHouseList2); */
	String[] twoHouseList = new String[2];
	if(twoHouseList2 != null){
		twoHouseList = twoHouseList2.split(",");
	}
	/* System.out.println("twoHouseList[0] : " + twoHouseList[0]); */
	
	PageInfoForDS pi = (PageInfoForDS)request.getAttribute("pi");
	
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
<script>
   <% if(admPwd != null){%>
	   	<%-- console.log("if 안에 들어옴!");
		var checkPwd = prompt('관리자 비밀번호를 입력해주세요.');
		    				
		if(checkPwd == "<%=admPwd%>"){
			<% System.out.println(twoHouseList[0]); %>
			location.href="<%= request.getContextPath()%>/back/sharehouse?sh_no="+'<%=twoHouseList[0]%>';
		} else if(checkPwd != "<%=admPwd%>"){
		    alert("비밀번호가 틀렸습니다.");
		} else if(checkPwd == null){
		    alert("비밀번호를 입력해 주세요.");
		} else {
		    alert("취소되었습니다.");
		} --%>
		location.href="<%= request.getContextPath()%>/back/sharehouse?sh_no="+'<%=twoHouseList[0]%>';
		alert('복구가 완료되었습니다!');
   <%}%>
	</script>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete ShareHouse</title>
    <link href="./admin_leftMenuCss.css" rel="stylesheet" type="text/css">
    
     <!-- jQuery -->
     <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
     
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
     #wrapTitle{
            /*border: 1px solid red;*/
            text-align: center;
            padding-top: 30px;
            font-size: 40px;
            margin-top:0;
        }

    .summary{
        /*border: 1px solid blue;*/
        display : block;
        margin-left : 400px;
        width : 700px;
        float:center;
    }

    table{
        text-align: center;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        border-collapse: collapse;
        
    }


    #userMemTable th{
        padding-top : 7px;
        padding-bottom: 7px;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
    }

    td{
        padding-top : 3px;
        padding-bottom : 3px;
    }

    #fromSecond{
        border-bottom: 1px solid lightgray;
        height : 30px;
    }

    table{
        width:100%;
        margin-left : 25px;
    }

    #userMemTable{
        width: 650px;
    }

 #pagingBtn{
		border : none;
		background-color : white;
		border-style:none;
	}
    
    .delBtn{
        background-color: black;
        color:white;
        opacity: 30%;
        border-style: none;
        height : 25px;
        cursor: pointer;
    }

    .delBtn:hover{
        opacity: 100%;
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
        <h2 id="wrapTitle">삭제 쉐어하우스</h2>
        <table id="userMemTable">
            <tr style="padding : 7px;">
                <th>쉐하번호</th>
                <th>쉐하이름</th>
                <th>삭제유형</th>
                <th>등록날짜</th>
                <th>삭제날짜</th>
                <th>등록인 번호</th>
                <th>복구하기</th>
            </tr>
           
            
            <% if(hList.isEmpty()) { %>
            	<tr>
            		<td colspan="7">삭제된 쉐어하우스가 없습니다.</td>
            	</tr>
	        <%} else { 
	        	for(int i=0; i<hList.size(); i++){%>
		            <tr id="fromSecond">
		            <td><%= hList.get(i).getSh_no()%></td>
		            <td><%= hList.get(i).getSh_title()%></td>
		            <td><%= hList.get(i).getSh_status()%></td>
		            <td><%= hList.get(i).getSh_date()%></td>
		            <td><%= hList.get(i).getSh_deldate()%></td>
		            <td><%= hList.get(i).getHst_no()%></td>
		            <td><button class="delBtn" id="backBtn<%= i %>" type="button">복구하기</td>
		        </tr>
		        <input type="hidden" name="list" id="sendList" value="<%= hList %>">
        		<%}
            } %>
        </table>
    </div>
     <script>
  
     		<%for(int i=0; i<hList.size(); i++){%>
     			$(function(){ 			
	    			$('#backBtn<%=i%>').click(function(){
		    			
	    				var no = $(this).parents("tr").children().eq(0).text();
		    			var status = $(this).parents("tr").children().eq(2).text();
		    			
		    			var twoHouseList = new Array;
		    			twoHouseList[0] = no;
		    			twoHouseList[1] = status;
		    			
		    			var cb_check = confirm("매물 번호 : " + no + "\n 이 매물을 복구하시겠습니까?");
		    			
	    				if(cb_check == true){
		    				location.href="<%= request.getContextPath()%>/comeback/checkpwd?twoHouseList="+twoHouseList;
		    			} else if(cb_check == false){
		    	        	alert("취소되었습니다.");
		        		}
	    			});
	    		});
     		<%}%>	    		
	    </script>   
		<!-- 페이징 바 -->
		 <div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<% if(s == null){ %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/delsharehouse/list?currentPage=1'"> &lt;&lt; </button>
			<% } else { %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/outmem/search?currentPage=1&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;&lt; </button>
			<% } %>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button id="pagingBtn" disabled> &lt; </button>
			<%}else if(s == null) { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/delsharehouse/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<%} else { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/outmem/search?currentPage=<%= pi.getCurrentPage() - 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button id="pagingBtn" style="background:lightgray;" disabled> <%= p %> </button>
				<%}else if(s == null){ %>
					<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/delsharehouse/list?currentPage=<%= p %>'"> <%= p %> </button>
				<%} else {%>
					<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/outmem/search?currentPage=<%= p %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> <%= p %> </button>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button id="pagingBtn" disabled> &gt; </button>
			<%} else if(s == null) { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/delsharehouse/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<%} else { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/outmem/search?currentPage=<%= pi.getCurrentPage() + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<% if(s == null){ %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/delsharehouse/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			<% } else { %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/outmem/search?currentPage=<%= pi.getMaxPage() %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;&gt; </button>
			<% } %>
		</div>     
	    
	    
   

<!--  <div class="bottomSearch">
        <form>
            <select name="search">
                <option value="us_no" selected>회원번호</option>
                <option value="us_name">이름</option>
                <option value="us_id">아이디</option>
            </select>
            <input type="text" id="searchMember" name="searchMem" width="250px" placeholder="검색어를 입력하세요.">
            <button type="button" id="searchBtn"><img src="../views/admin/adm_img/search.png"></button>
        </form>
    </div> -->
</body>
</html>
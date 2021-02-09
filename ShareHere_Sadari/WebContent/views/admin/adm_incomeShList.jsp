<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, administrator.model.vo.*"%>
<%
	ArrayList<Income> list = (ArrayList<Income>)request.getAttribute("list");
	
	PageInfoForIS pi = (PageInfoForIS)request.getAttribute("pi");
	
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
<meta charset="UTF-8">
<title>Income</title>
<link href="${pageContext.request.contextPath}/views/admin/adm_leftmenu.css" rel="stylesheet" type="text/css">
    <!-- font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<style>

		
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

    th{
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
        margin-left : 10px;
    }

    #userMemTable{
        width: 650px;
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
	<div class="leftMenu">
        <img src='${pageContext.request.contextPath}/views/admin/adm_img/menuImg.jpg'id="menuImg">
       <a href="${pageContext.request.contextPath}/views/admin/adm_first.jsp"><img src = "${pageContext.request.contextPath}/views/admin/adm_img/adminLogo.png" id="adminLogo"></a>
         <a href="${pageContext.request.contextPath}/income/report" id="title_link"><h1>Income</h1></a>
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
    
    <div class="summary">
     <div id="forScoll" style="overflow:scroll; width : 650px; height : 550px; margin-left : 25px;">
        <h2 id="wrapTitle">쉐어하우스 결제내역</h2>
        <table id="userMemTable">
            <tr>
                <th>결제번호</th>
                <th>회원번호</th>
                <th>상품</th>
                <th>결제일</th>
            </tr>
		<% if(list.isEmpty()) { %>
			<tr>
				<td colspan="4">결제내역이 없습니다.</td>
			</tr>
			<%} else { 
				for(Income ic:list) {%>
	            <tr id="fromSecond">
	                <td><%=ic.getShp_no() %></td>
	                <td><%=ic.getHst_no() %></td>
	                <td><%=ic.getSh_item() %></td>
	                <td><%=ic.getSh_pdate() %></td>
		            </tr>
		    	<%} %>
            <%} %>

    	</table>
    </div>
    </div>
<!-- 페이징 바 -->
		<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<% if(s == null){ %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/income/sh/list?currentPage=1'"> &lt;&lt; </button>
			<% } else { %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=1&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;&lt; </button>
			<% } %>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button id="pagingBtn" disabled> &lt; </button>
			<%}else if(s == null) { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/income/sh/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<%} else { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getCurrentPage() - 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button id="pagingBtn" style="background:lightgray;" disabled> <%= p %> </button>
				<%}else if(s == null){ %>
					<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/income/sh/list?currentPage=<%= p %>'"> <%= p %> </button>
				<%} else {%>
					<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= p %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> <%= p %> </button>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button id="pagingBtn" disabled> &gt; </button>
			<%} else if(s == null) { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/income/sh/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<%} else { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getCurrentPage() + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<% if(s == null){ %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/income/sh/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			<% } else { %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getMaxPage() %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;&gt; </button>
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
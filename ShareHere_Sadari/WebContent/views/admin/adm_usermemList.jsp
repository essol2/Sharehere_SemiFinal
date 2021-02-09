<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, administrator.model.vo.*"%>
<%
	ArrayList<Usermember> list = (ArrayList<Usermember>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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
<title>UserMembers</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link href="./admin_leftmenu.css" rel="stylesheet" type="text/css">

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
        width : 650px;
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
        margin-left : 25px;
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
        <img src='../views/admin/adm_img/menuImg.jpg'id="menuImg">
        <a href="../views/admin/adm_first.jsp"><img src = "../views/admin/adm_img/adminLogo.png" id="adminLogo"></a>
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
        <h2 id="wrapTitle">일반회원</h2>
        <table id="userMemTable">
            <tr>
                <th>회원번호</th>
                <th>이름</th>
                <th>아이디</th>
                <th>이메일</th>
                <th>생년월일</th>
            </tr>

			<% if(list.isEmpty()) { %>
			<tr>
				<td colspan="5">가입한 회원이 없습니다.</td>
			</tr>
			<%} else { 
				for(Usermember us:list) {%>
		            <tr id="fromSecond">
		                
		                <td><%=us.getUs_no() %></td>
		                <td><%=us.getUs_name() %></td>
		                <td><%=us.getUs_id() %></td>
		                <td><%=us.getUs_email() %></td>
		                <td><%=us.getUs_birth() %></td>
		            </tr>
		    	<%} %>
            <%} %>

     	</table>
    </div>
    
    
 	<!-- 페이징 바 -->
		<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<% if(s == null){ %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/list?currentPage=1'"> &lt;&lt; </button>
			<% } else { %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=1&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;&lt; </button>
			<% } %>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button id="pagingBtn" disabled> &lt; </button>
			<%}else if(s == null) { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<%} else { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getCurrentPage() - 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button id="pagingBtn" style="background:lightgray;" disabled> <%= p %> </button>
				<%}else if(s == null){ %>
					<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/list?currentPage=<%= p %>'"> <%= p %> </button>
				<%} else {%>
					<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= p %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> <%= p %> </button>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button id="pagingBtn" disabled> &gt; </button>
			<%} else if(s == null) { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<%} else { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getCurrentPage() + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<% if(s == null){ %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
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
     <script>
		$(function(){
			$("#userMemTable td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer", "color" : "gray"});
			}).mouseout(function(){
				$(this).parent().css({"color" : "black"});
			}).click(function(){
				var uno = $(this).parent().children().eq(0).text();
				location.href='<%= request.getContextPath() %>/user/detail?uno=' + uno;
			});
		})
	</script>

</body>
</html>
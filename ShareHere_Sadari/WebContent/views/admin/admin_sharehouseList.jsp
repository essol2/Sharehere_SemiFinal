<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, administrator.model.vo.*"%>
<% 
ArrayList<Sharehouse> list = (ArrayList<Sharehouse>)request.getAttribute("list");

PageInfoForSH pi = (PageInfoForSH)request.getAttribute("pi");

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
<html lang="en">
<head>
<!-- 타이틀 이미지 -->
   <link
      href="${pageContext.request.contextPath}/views/common/img/rmLogo.png"
      rel="shortcut icon" type="image/x-icon">
 	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage ShareHouse</title>

 
    <link href="admin_leftMenuCss.css" rel="stylesheet" type="text/css">
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

        #sharehouseTable{
            text-align: center;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            border-collapse: collapse;
            width: 650px;
            margin-left : 25px;
        }

        #sharehouseTable th{
            padding-top : 7px;
            padding-bottom: 7px;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }

        #sharehouseTable td{
            padding-top : 3px;
            padding-bottom : 3px;
        }

        #fromSecond{
        border-bottom: 1px solid lightgray;
        height : 30px;
    }
    
    #newShareHouseBtn{
    	background-color: black;
            color:white;
            width: 90px;
            height : 70px;
            border-radius: 13px;
            font-size: large;
            border : none;
            cursor:pointer;
            outline:none;
            margin-left : 40px;
    }
    
    #pagingBtn{
		border : none;
		background-color : white;
		border-style:none;
	}
	
	.pagingArea{
		width : auto;
		margin-left: 59%; 
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
        <h2 id="wrapTitle">쉐어하우스</h2>
        <table id="sharehouseTable">
            <tr>
                <th id="fromSecond">쉐하번호</th>
                <th>쉐하이름</th>
                <th>등록날</th>
                <th>등록인 번호</th>
            </tr>
            
            <% if(list.isEmpty()) { %>
	            <tr>
	            	<td colspan="5">등록된 매물이 없습니다.</td>
	            </tr>
            <%} else {
            	for(Sharehouse sh:list){%>
		            <tr id="fromSecond">
		                <td><%= sh.getSh_no()%></td>
		                <td><%= sh.getSh_title()%></td>
		                <td><%= sh.getSh_date()%></td>
		                <td><%= sh.getHst_no()%></td>
		            </tr>
		            <%} %>
			 <%} %>
  
        </table>
    </div>
    
    <!-- 페이징 바 -->
		<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<% if(s == null){ %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/sharehouse/list?currentPage=1'"> &lt;&lt; </button>
			<% } else { %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=1&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;&lt; </button>
			<% } %>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button id="pagingBtn" disabled> &lt; </button>
			<%}else if(s == null) { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/sharehouse/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<%} else { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getCurrentPage() - 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button id="pagingBtn" style="background:lightgray;" disabled> <%= p %> </button>
				<%}else if(s == null){ %>
					<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/sharehouse/list?currentPage=<%= p %>'"> <%= p %> </button>
				<%} else {%>
					<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= p %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> <%= p %> </button>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button id="pagingBtn" disabled> &gt; </button>
			<%} else if(s == null) { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/sharehouse/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<%} else { %>
				<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/usermem/search?currentPage=<%= pi.getCurrentPage() + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<% if(s == null){ %>
			<button id="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/sharehouse/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
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
			$("#sharehouseTable td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer", "color" : "gray"});
			}).mouseout(function(){
				$(this).parent().css({"color" : "black"});
			}).click(function(){
				var shno = $(this).parent().children().eq(0).text();
				location.href='<%= request.getContextPath() %>/sharehouse/datail?shno=' + shno;
			});
		})
	</script>
</body>
</html>
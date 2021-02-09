<%@page import="member.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Host, house.model.vo.*"%>
<% User user = (User) request.getSession().getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Welcome to the ShareHere</title>
 	<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<style>
body{
            margin: 0;
            background-image: url("https://www.urdesignmag.com/wordpress/wp-content/uploads/2020/01/six-budget-friendly-ideas-for-a-cozy-bedroom-2.jpg");
          background-repeat: no-repeat;
          background-attachment: fixed;
        }

#searcharea {
	width: 100%;
	height: 700px;
	/*border : 1px solid black;*/
	<%-- background-image:
		url("<%=request.getContextPath()%>/views/common/img/searchImg.jpeg");
	background-repeat: no-repeat;
	background-size: 100% 100%; --%>
	position: relative;
}

#searchbar {
	width: 75%;
	height: 180px;
	border-radius: 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding-top: 2.5%;
	background-color: rgba(255, 255, 255, 0.8);
}

.selectoption {
	width: 20%;
	height: 40px;
	border-radius: 7px;
	border: 1px solid rgb(255, 255, 255);
	margin-top: 0%;
	margin-left: 2%;
}

#option1 {
	margin-left: 5%;
}

#searchtext {
	width: 80%;
	height: 50px;
	margin-left: 4%;
	border-radius: 7px;
	border: 1px solid rgb(255, 255, 255);
	padding: 3%;
	margin-top: 2%;
	
}

#searchbutton {
	width: 12%;
	height: 70px;
	background: black;
	color: white;
	border-radius: 7px;
	border: 1px solid black;
}

/* populare Share Houses */
#popular {
	margin-left: 5%;
	margin-top: 3%;
	margin-bottom: 3%;
}

/* roommate */
#roommate {
	background-color: rgba(255, 255, 255, 0.8);
	height: 600px;
	width: 100%;
	margin-top: 3%;
}

.logo {
	width: 20%;
	height: 20%;
}

#rm_logo {
	margin-left: 10%;
	align-items: left;
}

#to_rmpage_button {
	background-color: black;
	color: white;
	width: 25%;
	height: 60px;
	border-radius: 5%;
	margin-left: 10%;
}

#rm_text {
	float: left;
	width: 55%;
	margin-top: 3%;
	margin-left: 5%;
	margin-right: 0%;
}

#rm_title {
	margin-left: 5%;
}

#rm_intro {
	margin-left: 5%;
	font-size: 120%;
	text-align: left;
}

#rm_image {
	width: 35%;
	height: 600px;
	margin-top: 5%;
	margin-right: 5%;
	float: right;
	align-items: center;
}

#rm_image1 {
	width: 100%;
	padding-top: 4%;
	padding-bottom: 4%;
}

#roommate div {
	display: inline-block;
}

/* rooommate resposive */
@media screen and (max-width : 1650px) {
	/*#roommate{
            background-color: rgb(233, 228, 226);
            height: 600px;
            width : 100%;
            margin-top:3%;
        }*/
	#rm_intro {
		font-size: 120%;
		text-align: left;
	}
}

@media screen and (max-width : 1355px) {
	#roommate {
		background-color: rgb(233, 228, 226);
		height: 1200px;
		width: 100%;
		margin-top: 3%;
	}
	#rm_title {
		width: 80%;
		font-size: 200%;
		text-align: left;
	}
	#rm_text {
		width: 80%;
		font-size: 90%;
	}
	#rm_image {
		width: 70%;
		margin-top: 2%;
		margin-right: 15%;
		justify-content: center;
	}
	#rm_image1 {
		width: 100%;
		align-items: center;
	}
	#to_rmpage_button {
		margin-left: 10%;
	}
	#rm_logo {
		align-items: left;
	}

	/* 검색창 글씨 작게*/
	@media screen and (max-width : 1100px) {
		#searchbar {
			font-size: 8px;
			width: 80%;
		}
	}
	@media screen and (max-width : 950px) {
		#roommate {
			background-color: rgb(233, 228, 226);
			height: 1000px;
			width: 100%;
			margin-top: 3%;
		}
		#searcharea {
			width: 100%;
			height: 700px;
			background-image:
				url("<%=request.getContextPath()%>/views/common/img/searchImg.jpeg");
			background-repeat: no-repeat;
			background-size: 100%;
			position: absoulute;
		}
	}
	@media screen and (max-width : 730px) {
		#roommate {
			background-color: rgb(233, 228, 226);
			height: 500px;
			width: 100%;
			margin-top: 3%;
		}
		#rm_title {
			text-align: center;
			margin-right: 5%;
			margin-left: 10%
		}
		#rm_text {
			margin-left: 10%;
			margin-right: 5%;
			margin-top: 10%;
		}
		#rm_intro {
			font-size: 13px;
			text-align: center;
			margin-right: 5%;
			margin-left: 8%;
		}
		#to_rmpage_button {
			margin-left: 35%;
			margin-right: 32%;
		}
		#rm_image {
			display: none;
		}
		#rm_image1 {
			display: none;
		}
		#rm_logo {
			margin-left: 38%;
			margin-right: 35%;
		}
		.selectoption {
			width: 20%;
			height: 100px;
			border-radius: 7px;
			border: 1px solid rgb(255, 255, 255);
			margin-top: 0.1%;
			margin-left: 2%;
		}
		#searchtext {
			width: 75%;
			height: 40%;
			margin-left: 5%;
			margin-top: 1%;
			border-radius: 7px;
			border: 1px solid rgb(255, 255, 255);
		}
		#searchbutton {
			width: 12%;
			height: 40%;
			background: black;
			color: white;
			border-radius: 7px;
			border: 1px solid black;
		}

	}
}
</style>
</head>
<body>

    <script>
					const toggleBtn = document
							.querySelector('.navibar_toggleBtn');
					const menu = document.querySelector('.nav_menu');
					const buttons = document.querySelector('.nav_buttons');
					const logo = document.querySelector('.nav_logo')
					console.log(toggleBtn);
					console.log(menu);
					console.log(buttons);

					toggleBtn.addEventListener('click', function() {
						menu.classList.toggle('active');
						buttons.classList.toggle('active');
						logo.classList.toggle('change');
					});
				</script>
<div id="searcharea" style="margin-top:0; height : 600px;">
    <div id="searchbar" >
    <!-- 검색 폼 영역 -->
    
    <form action="<%=request.getContextPath()%>/house/search" method="get">
      
        <input type="search" id="searchtext" placeholder="지역, 지하철역 검색" size="100" name="search" >
        <button type="submit" id="searchbutton">search</button>
    </form>
    </div>
</div>
<!-- 검색폼  -->
<!-- 키워드로만 검색했을 때 넘어가는 필터VALUE값때문에 NULL이뜨는지?-->

<%
	if ((Host) session.getAttribute("loginHost") == null) {
%>
<section class="popular-sharehouse">
    <h1 style="font-size: 35px;" id="popular">인기 쉐어하우스</h1>
    <div class="container">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <div class="col">
        <div class="card shadow-sm">
            <img src=https://cdn.imweb.me/thumbnail/20181031/5bd901c5a3280.jpg width="100%" height="225">
            <div class="card-body">
                <p class="card-text">
                   [ 잠실 ] 두올아파트 <br><br>
                    여성전용  <br>
                    아파트  
                </p>
            </div>
        </div>
        </div>

        <div class="col">
            <div class="card shadow-sm">
                <img src=https://cdn.imweb.me/thumbnail/20181030/5bd821832d81c.png alt="우주84호점" class="bd-placeholder-img card-img-top" width="100%" height="225">
                <div class="card-body">
                    <p class="card-text">
                     [ 봉촌 ] 굿스테이 <br><br>
                        남여공용  <br>
                        빌라  
                    </p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card shadow-sm">
                <img src=https://cdn.imweb.me/thumbnail/20181012/5bc034a65066e.jpg alt="우주84호점" class="bd-placeholder-img card-img-top" width="100%" height="225">
                <div class="card-body">
                    <p class="card-text">
                       [ 종로 ] 은하빌라         <br><br>
                        남성전용  <br>
                        단독주택  
                    </p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card shadow-sm">
                <img src=http://www.job-post.co.kr/news/photo/202010/9570_7270_147.jpeg alt="우주84호점" class="bd-placeholder-img card-img-top" width="100%" height="225">
                <div class="card-body">
                    <p class="card-text">
                       [ 강남 ] 헤라펠리스 <br><br>
                        남녀공용  <br>
                        빌라  
                    </p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card shadow-sm">
                <img src="https://cdn.imweb.me/thumbnail/20181012/5bc0348842eea.jpg" width="100%" height="225">
                <div class="card-body">
                    <p class="card-text">
        [ 신촌 ] 굿스테이  <br><br>
                        여성전용  <br>
              단독주택  
                    </p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card shadow-sm">
                <img src=https://cdn.imweb.me/thumbnail/20181012/5bc034aecad85.jpg alt="우주84호점" class="bd-placeholder-img card-img-top" width="100%" height="225">
                <div class="card-body">
                    <p class="card-text">
                       [ 광진  ] 큰나무빌라             <br><br>
                        남여공용  <br>
                        단독주택 
                    </p>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>


<div id = "etc"></div>
<br><br><br><br><br><br><br><br>
<div id="roommate" class="roommate"> 
    <div id="rm_text" style="margin-left: 7%; width: 45%; ">
        <img src="${pageContext.request.contextPath}/views/common/img/rmLogo.png" style="margin: 0; width: 170px; height: 150px;">
        <br><br>
    <h2><b>나에게 맞는 룸메이트 찾기</b></h2><br>
   <span class="text">
   비싸지는 월세와 외로운 타지생활의 고민을 모두 해결할 수 있는 방법 <br>
   쉐어히어는 룸메이트 성향조사를 통해 각 사용자에게 알맞는 룸메이트를 매치시켜줍니다. <br>
   <b>만족도 98%</b>를 자랑하는 쉐어히어에서 룸메이트를 찾아보세요!   
    </span>  
    <br><br><br>
    
    <button id="to_rmpage_button" style="margin: 0;">
        <a style="color: white;" href="<%= request.getContextPath() %>/views/Roommate/rm_main.jsp">자세히 알아보기</a>
    </button>
    </div>
    
    <div id="rm_image">
        <img src="${pageContext.request.contextPath}/views/common/img/rm_new.png" id="rm_image1" style="height: 470px; width: 580px; margin-left :-10%;">
    </div>
    <!-- <%} %> -->
  </div>
  
  <br><br><br><br><br>
  </main>
	
	<script>
	const rm_image = document.getElementById("rm_image");
	rm_image.addEventListener("click", function() {
		location.href='<%= request.getContextPath() %>';
	});
	</script>

</body>
</html>
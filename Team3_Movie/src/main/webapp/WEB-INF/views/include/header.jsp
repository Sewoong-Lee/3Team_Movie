<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href ="${path}/resources/css/forHeader.css" rel = "stylesheet"/>
<script type="text/javascript">
	$(function(){
		$('#myCcv').children("a").click(function(e){
			if(${sessionScope.user_id == null}) {
				e.preventDefault();
				alert("로그인 후 이용 가능합니다.");
				location.href = "${path}/user/login";
			}
		});
	});
</script>
</head>
<body>
	<header class = "logo">
		<%-- <h2 onclick = "location.href ='${path}/CCV'" style = "cursor: pointer">CCV</h2> --%>
		<a href = "${path}/CCV"><img src = "${path}/resources/img/logo.png"></a><br>
		당신의 취향에 가장 완벽한 선택
	</header>
	<div id = "loginCheck">
		<c:if test="${sessionScope.user_id == null}">
			<a href = "${path}/user/login">로그인</a>
		</c:if>
		<c:if test="${sessionScope.user_id != null}">
			${sessionScope.user_id}
			<a href = "${path}/user/logout">로그아웃</a>
		</c:if>
	</div>
	<nav>
		<div class = "menu-bar">
			<div class="dropdown">
			<button class="dropbtn">극장</button>
				<div class="dropdown-content">
					<a href="${path}/cinema/location">전체 극장</a>
				</div>
			</div>
		  
			<div class="dropdown">
			<button class="dropbtn">영화</button>
				<div class="dropdown-content">
					<a href="#">박스 오피스</a>
				        <a href="#">맞춤 영화</a>
				</div>
			</div>
		  
			<div class="dropdown">
			<button class="dropbtn">이벤트</button>
				<div class="dropdown-content">
					<a href="${path}/board/">진행 중 이벤트</a>
				</div>
			</div>
		    
			<div class="dropdown">
			<button class="dropbtn">나의 CCV</button>
				<div class="dropdown-content" id = "myCcv">
					<a href="#">영화 예매 내역</a>
					<a href="#">이벤트 참여 내역</a>
					<a href="${path}/user/myInfo?user_id=${sessionScope.user_id}">나의 정보</a>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn" onclick ="location.href ='${path}/company/ccvInfo'">회사 소개</button>
			</div>
		</div>
	</nav>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/resources/css/table.css" rel="stylesheet" type="text/css"><!-- 리소스폴더의 css파일 -->
<style type="text/css">
	#title{
		color: white;
		text-align: center;
		
	}
	
	/* 하이퍼링크 밑줄 및 색 변경 */
	a {
		text-decoration-line: none;
		color: white;
	}
	
	/* 페이지 기본 */
	.alist {
		text-align: center;
	}
	.alist{
		 font-size: 19px;
    color: black;
    line-height: 2.9em;
	text-decoration: unset;
	background-color: #fffbfb;
    padding: 5px 7px;
    font-weight: bold;
    display: inline;
  	border: 1px outset;
  	margin: 3px;
  	text-align: center;
	
	}
	
	/* 페이지 선택 하면 */
	#acurpage{
		/* font-size: large;
		background-color: #000000;
		color: white; */
		background-color: #d3af71;
	color: white;
	font-size: 22px;
	font-weight: bold;
	}
	
	#center {  
		display :flex;
		align-items : center;
		justify-content : center;
		font-family: Arial, Helvetica, sans-serif;
		border-collapse: collapse;
		text-align: center;
	}
	#board_button {
	   background-color: #d3af71;
	   color: white;
	   width: 120px;
	   height: 40px;
	   text-align: center;
	   text-decoration: none;
	   display: inline-block;
	   font-size: 16px;
	   margin: 4px 2px;
	   transition-duration: 0.4s;
	   cursor: pointer;
	   border: 2px solid #d3af71;
		}
	
	#board_button:hover {
	   background-color: white;
	   color: black;
	   cursor: pointer;
	}
	#find_btn {
	   background-color: #d3af71;
	   color: white;
	   width: 90px;
	   height: 30px;
	   text-align: center;
	   text-decoration: none;
	   display: inline-block;
	   font-size: 16px;
	   margin: 4px 2px;
	   transition-duration: 0.4s;
	   cursor: pointer;
	   border: 2px solid #d3af71;
		}
	
	#find_btn:hover {
	   background-color: white;
	   color: black;
	   cursor: pointer;
	}
	
</style>
<script type="text/javascript">
	
	$(function() {
		//제목을 누르면 디테일로 이동
		$('.elist_sub').click(function(e) {
			e.preventDefault();
			
			var board_num = $(this).attr('href');
			location.href = '${path}/board/boarddetail?board_num='+board_num;
			
		});
		
		//페이지 번호를 누르면
		$('.alist').click(function(e) {
			e.preventDefault();  //버튼의 기본기능 제거
			var curpage = $(this).attr('href');
			var findkey = $('#findkey').val();
			var findvalue = $('#findvalue').val();
			
			//alert(curpage);
			location.href = '${path}/board/boardlist?curpage='+curpage+'&findkey='+findkey+'&findvalue='+findvalue;
		});
		
		
	});

</script>
</head>
<body id="back_color_body">
<%@ include file = "../include/header.jsp" %>
	<div id="back_div">
	<h2 id="title">EVENT</h2>
	<form action="${path}/board/boardadd">
	<!-- <input name="user_id" value="${sessionScope.user_id}"> --><!-- 가져갈 유저 아이디 -->
	
	<c:if test="${sessionScope.admin == 0}">
	<button id="board_button">공지 등록</button>
	</c:if>
	</form>
	<hr>
	<table id="board_table">
		<tr> 
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="elist" items="${boardlist}">
		<tr>
			<td width="100">${elist.RNUM}</td>
			<td width="100">${elist.USER_ID}</td>
			<td><a href="${elist.BOARD_NUM}" class="elist_sub">${elist.SUBJECT} &nbsp;&nbsp;  ${elist.READ_CNT}</a></td>
			<td width="200">${elist.REG_DATE}</td>
		</tr>
		</c:forEach>
	
	</table>
	<hr>
	<!-- 페이징처리 -->
	<c:if test="${mv_board_page.startpage != 1}">
		<a href="${mv_board_page.startpage-1}" class="alist">이전</a>
	</c:if>
	
	<c:forEach var="i" begin="${mv_board_page.startpage}" end="${mv_board_page.endpage}">
		<c:if test="${mv_board_page.curpage==i}">
			<a href="${i}" class="alist" id="acurpage">  ${i}  </a>
		</c:if>
		<c:if test="${mv_board_page.curpage!=i}">
			<a href="${i}" class="alist">  ${i}  </a>
		</c:if>
	</c:forEach>
	
	<c:if test="${mv_board_page.totpage > mv_board_page.endpage}">
		<a href="${mv_board_page.endpage+1}" class="alist">다음</a>
	</c:if>
	<div id="center">
	<form action="${path}/board/boardlist">
		<select name="findkey" id="findkey">
			<option value="subject" ${mv_board_page.findkey == 'subject' ? 'selected' : ''}>제목</option>
			<option value="content" ${mv_board_page.findkey == 'content' ? 'selected' : ''}>내용</option>
			<option value="subcon" ${mv_board_page.findkey == 'subcon' ? 'selected' : ''}>제목+내용</option>
			<option value="user_id" ${mv_board_page.findkey == 'user_id' ? 'selected' : ''}>작성자</option>
		</select>
		<input type="text" name="findvalue" maxlength="10" value="${mv_board_page.findvalue}" id="findvalue">
		<!-- 세션에 현재 페이지의 값이 저장되어 조회를 할 경우에 현재 페이지 초기화 -->
		<input type="hidden" name="curpage" value="1">
		<button id="find_btn">검색</button>
	</form>
	</div><!-- crnter -->
	</div><!-- back_div -->
<%@ include file = "../include/footer.jsp" %>
</body>
</html>
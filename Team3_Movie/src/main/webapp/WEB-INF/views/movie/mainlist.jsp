<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCV</title>
<style>
.paging a {
    font-size: 19px;
    color: black;
    text-align: center;
    line-height: 2.9em;
	text-decoration: unset;
	background-color: #fffbfb;
    padding: 5px 7px;
    font-weight: bold;
    display: inline;
  	border: 1px outset;
}
.paging{
	margin: 30px;
}

#aCurPage{
	background-color: #de9999;
	color: white;
	font-size: 22px;
	font-weight: bold;
}

</style>
<script type="text/javascript">
 $(function() {
	//페이지 클릭시
	$('.aList').click(function(e) {
		e.preventDefault();
		var curPage = $(this).attr('curPage');
		var findkey = $('#cfindKey').val();

		location.href="${path}/moviedata/list?curPage="+curPage+'&findkey='+findkey;
	});			
	
	//검색 조건
	$('#btnFind').click(function() {
		var findMovie = $('#findMovie').val();
		location.href="${path}/moviedata/list?findkey="+findMovie;
	});
});
</script>
</head>
<body>
<%@ include file = "../include/header.jsp" %>
	<!-- 검색조회 -->
<!-- 	<fieldset style=" width: 300;">
		<input type="text" style=" height:30; width: 250;" id="findMovie">
		<button id="btnFind" type="button">조회</button>
	</fieldset> -->
	
 	<h2 align="center" style="padding: 30px">상영 중인 영화</h2>
 		<div style="text-align: center;">
	 		<c:forEach var="list" items="${movieList}">
		 		<div style="display: inline-block; margin: 0 20px;">
		 			<div>
			 			<a href="${path}/moviedata/detail?movie_num=${list.movie_num}"> 
			 			<img alt="이미지링크" src=" ${list.movie_poster_link} " width="220px"></a>
			 		</div>
				 	<div style=" margin-top: 10px;
					 	 text-align: center;
						 color: #925e5e;
						 font-weight: bold;
						 font-size: 18px;">
		 			</div>
	 			</div>
	 		</c:forEach>
 		</div>
 	<br>
 	
<%--  	${mv_Page} --%>
 	<input type="hidden" id="cfindKey" value="${mv_Page.findkey}">
 	<div class="paging" align="center">
 	<c:if test="${mv_Page.startPage != 1}">
		<a href="#" curPage="${mv_Page.startPage-1}" class="aList" style="margin-right: 20px; background-color:gainsboro"> < </a>
	</c:if>
	<c:forEach  var="i"  begin="${mv_Page.startPage}" end="${mv_Page.endPage}">
		<c:if test="${mv_Page.curPage==i}">
			<a href="#" curPage="${i}" class="aList" id="aCurPage">${i}</a>
		</c:if>
		<c:if test="${mv_Page.curPage!=i}">
			<a href="#" curPage="${i}" class="aList" >${i}</a>
		</c:if>
	</c:forEach>
	<c:if test="${mv_Page.totPage > mv_Page.endPage}">
		<a href="#" curPage="${mv_Page.endPage+1}"  class="aList"  style="margin-left:20px; background-color:gainsboro" > > </a>
	</c:if>
 	</div>
<!--  	유튜브 실시간 링크갖고오기...?? -->
 	
</body>
</html>
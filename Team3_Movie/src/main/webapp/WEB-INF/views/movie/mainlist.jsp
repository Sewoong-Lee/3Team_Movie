<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/>      
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>  
 <%@ include file = "../include/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
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
	margin: 0px;
}

#aCurPage{
	background-color: #d3af71;
	color: white;
	font-size: 22px;
	font-weight: bold;
}
#imgListDiv{
    text-align: center;
    width: 1600;
    display: block;
    margin: auto;
}
#back_color_body{
   background-color: #1a1313;
}
#back_div{
   width: 100%;
   max-width: 80%;
   margin: auto;
}
#searchIn{
    float: right;
    margin: 30px;
    flex: auto;
    margin-right: 15%;
    padding-block-end: inherit;
}
#btnFind{
	font-size: 18px;
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
		alert(findMovie);
		location.href="${path}/moviedata/list?findkey="+findMovie;
	});
});
 
</script>

</head>
<body id="back_color_body">
<%--  ${sessionScope.user_id} : 세션아이디  --%>
	<!-- 검색조회 -->
	<fieldset id="searchIn" style=" width: 380; ">
		<input type="text" style=" height:40; width: 300; margin-bottom: 10;" id="findMovie" placeholder="장르 및 영화제목을 입력해주세요"; 
			onkeypress="javascript:if(event.keyCode==13) $('#btnFind').click()">
		<button id="btnFind" type="button" style="padding:8px; padding-right:15px; padding-left:15px" >조회</button>
	</fieldset>
 	<h2 align="center" style="padding: 30px;margin-top: 100;font-size: 30;">영화 리스트</h2>
 	<div id="mainDiv">
 		<div id="imgListDiv" style="text-align: center;">
	 		<c:forEach var="list" items="${movieList}">
		 		<div style="display: inline-block;  margin-bottom: 40; width: 270px">
		 			<div>
			 			<a href="${path}/moviedata/detail?movie_num=${list.movie_num}"> 
			 			<img alt="이미지링크" src="${list.movie_poster_link}" width="220px" style="border: 1px solid white; border-radius: 10px"></a>
			 		</div>
				 	<div style=" margin-top: 10px; margin-bottom: 30px;
					 	 text-align: center;  color: white;
						 font-weight: bold;	 font-size: 18px;">
				 		 ${list.movie_name}
		 			</div>
	 			</div>
	 		</c:forEach>
 		</div>
 	</div>
 		
 	<br>
 	
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

 	
 	
</body>
</html>
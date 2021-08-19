<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCV</title>
<link href="${path}/resources/css/table.css" rel="stylesheet" type="text/css"><!-- 리소스폴더의 css파일 -->
<style type="text/css">
	#saleslist_box{
		color: white;
	}
	#title{
		color: white;
		text-align: center;
	}
</style>
</head>
<body id="back_color_body">
<%@ include file = "../include/header.jsp" %>
<div id="back_div">
<h2 id="title">예매 확인</h2>
<hr>
<c:if test="${fn:length(saleslist) eq 0}">
	<p align="center" style="font-size: 50px">예매 내역이 없습니다.</p>
</c:if>
<div id="saleslist_box">
<c:forEach var="saleslist" items="${saleslist}">
	<table class="sales_table">
		<tr>
			<th>예매 번호 </th> <td>${saleslist.SAL_NUM}</td>
		</tr>
		<tr>
			<th>예매 영화 </th> <td>${saleslist.MOVIE_NAME}</td>
		</tr>
		<tr>
			<th>예매 아이디 </th> <td>${saleslist.USER_ID}</td>
		</tr>
		<tr>
			<th>상영관 </th> <td>${saleslist.CINEMA_NAME}</td>
		</tr>
		<tr>
			<th>상영관 문의 번호 </th> <td>${saleslist.TEL}</td>
		</tr>
		<tr>
			<th>상영일 </th> <td>${saleslist.TIME_DAY} ${saleslist.TIME_TIME}</td>
		</tr>
		<tr>
			<th>예매 매수 </th> <td>${saleslist.TICKETS}</td>
		</tr>	
	</table>
	<hr>
</c:forEach>
</div>
</div>
</body>
</html>
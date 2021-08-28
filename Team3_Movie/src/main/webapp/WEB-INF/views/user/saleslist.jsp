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
	
	.cancel_btn {
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
	
	.cancel_btn:hover {
	   background-color: white;
	   color: black;
	   cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('.cancel_btn').click(function(e) {
			e.preventDefault();
			var sal_num = $(this).val();
			
			if(confirm("예매를 취소 하시겠습니까?")){
				location.href = '${path}/user/salcancel?sal_num='+sal_num;
			}
		});
		
		
	});


</script>
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
		<c:if test="${now <= saleslist.TIME_DAY}">
		<tr>
			<td colspan="2"><button value="${saleslist.SAL_NUM}" class="cancel_btn">예매 취소</button></td>
		</tr>
		</c:if>
	</table>
	<hr>
</c:forEach>
</div>
</div>
</body>
</html>
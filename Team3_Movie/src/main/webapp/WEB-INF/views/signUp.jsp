<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include/forSignUp.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href = "${path}/resources/css/forSignUp.css" rel = "stylesheet"/>
</head>
<body onload = "emailOk()" id = "back_color_body">
<%@ include file = "./include/header.jsp" %>
<div id = "back_div">
<h2>| 회원가입 |</h2>
	<form name = "signUpF" action="${path}/user/insert" method = "post" enctype="multipart/form-data">
		<input type = "hidden" name = "email" value ="${email}">
		<table id = "signUpForm">
			<tr>
				<th>아이디(필수) |&nbsp;</th>
				<td><input type ="text" id = "user_id" name = "user_id" class = "withBtn">
				<input type = "hidden" id = "idCheckYn" value = "n">
				<button id = "idCheck" class = "checkBtn">중복 체크</button></td>
			</tr>
			<tr>
				<th>비밀번호(필수) |&nbsp;</th>
				<td colspan="2"><input type = "password" id = "passwd" name = "passwd" class = "inputSize"></td>
			</tr>
			<tr>
				<th>비밀번호 확인(필수) |&nbsp;</th>
				<td colspan="2"><input type = "password" id = "checkpw" name = "checkpw" class = "inputSize"></td>
			</tr>
			<tr>
				<th>이름(필수) |&nbsp;</th>
				<td><input type = "text" id = "user_name" name = "user_name" class = "inputSize"></td>
			</tr>
			<tr>
				<th>휴대전화(필수) |&nbsp;</th>
				<td><input type = "number" id = "tel" name = "tel" placeholder="'-'를 제외하고 숫자만 입력해주세요." class = "inputSize"></td>
			</tr>
			<tr>
				<th>프로필 사진 |&nbsp;</th>
				<td><input type = "file" name = "profile" class = "inputSize"></td>
			</tr>
			<tr>
				<th>취향 |&nbsp;<br>
					(3개) |&nbsp;
				</th>
				<td>
					<div id = "genre">
						<c:forEach var = "genre" items= "${genreList}" varStatus = "status">
							<input type = "checkbox" class = "tag" name = "tag" value = "${genre.GENRE_CODE}">
							<span class = "genreName">${genre.GENRE_NAME}</span>
							<c:if test="${status.count%3 == 0}">
							<br>
							</c:if>
						</c:forEach>
					</div>
				</td>
			</tr>
			<tr>
				<th>우편번호(필수) |&nbsp;</th>
				<td><input type = "text" id = "zip" name = "zip" readonly="readonly" class = "withBtn">
					<button type = "button" id = "findZip" class = "checkBtn">주소 찾기</button></td>
			</tr>
			<tr>
				<th>주소(필수) |&nbsp;</th>
				<td><input type = "text" name = "addr1" readonly="readonly" class = "inputSize"></td>
			</tr>
			<tr>
				<th>상세 주소(필수) |&nbsp;</th>
				<td><input type = "text" name = "addr2" class = "inputSize"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id = "signUp" class = "btn">가입하기</button>
					<button  class = "btn" type= "reset" >취소</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file = "./include/footer.jsp" %>
</body>
</html>
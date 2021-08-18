<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link href = "${path}/resources/css/forMyInfo.css" rel = "stylesheet">
<script type="text/javascript">
	$(function(){
		$('#withdraw').click(function(e){
			e.preventDefault();
			var user_id = "${member.user_id}";
			var ans = confirm("이용하셨던 모든 내역이 소멸됩니다.\n탈퇴를 진행하시겠습니까 ?");
			if (ans) {
				location.href = "${path}/user/withdraw?user_id="+user_id;
			}
		});
	});
</script>
</head>
<body id = "back_color_body">
<div id = "back_div">
<h2>| 회원가입 |</h2>
	<div align="right"><a href = "${path}/user/modifyInfo?user_id=${member.user_id}">회원 정보 수정</a></div>
	<fieldset>
	<table>
		<tr>
			<td rowspan="7" align="center">
				<div class = "imgBox">
					<c:if test="${member.file_name != null}">
						<img src = "${path}/uploadimg/${member.file_name}" id = "profile"><br>
					</c:if>
					<c:if test="${member.file_name == null}">
						<img src = "${path}/resources/img/person_icon.png"><br>
					</c:if>
				</div>
				${member.user_id}
			</td>
			<td align="right">이름 |&nbsp;</td>
			<td>${member.user_name}</td>
		</tr>
		<tr>
			<td align="right">등급 |&nbsp;</td>
			<td>${member.admin}</td>
		</tr>
		<tr>
			<td align="right">관심 태그 |&nbsp;</td>
			<td>
				<c:forEach var = "tag" items = "${tagList}">
					<li>${tag.GENRE_NAME}</li>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td align="right">비밀번호 |&nbsp;</td>
			<td>
				<button onclick="location.href = '${path}/user/changePw'">변경하기</button>
			</td>
		</tr>
		<tr>
			<td align="right">연락처 |&nbsp;</td>
			<td id = "phoneNumber">
				<script type="text/javascript">
					var s = "${member.tel}"
					var f = s.substr(0,3);
					var l = s.substr(7,4);
					var phoneNum = f+"-"+"****"+"-"+l;
					document.getElementById('phoneNumber').innerHTML = phoneNum;
				</script>
			</td>
		</tr>
		<tr>
			<td align="right">주소 |&nbsp;</td>
			<td>${member.addr1} ${member.addr2}</td>
		</tr>
		<tr>
			<td align="right">회원 탈퇴 |&nbsp;</td>
			<td><button id = "withdraw">탈퇴하기</button></td>
		</tr>
	</table>
	</fieldset>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>
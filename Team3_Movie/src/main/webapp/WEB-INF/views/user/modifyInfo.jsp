<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<%@ include file = "../include/forSignUp.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link href = "${path}/resources/css/forModifyInfo.css" rel = "stylesheet">
<script type="text/javascript">
function setThumbnail(e) {
	$('.imgBox').hide();
	var reader = new FileReader();
	$('#image_container').empty();
	
	reader.onload = function(e) {
		var img = document.createElement("img");
		img.setAttribute("src", e.target.result);
		document.querySelector("div#image_container").appendChild(img);
	};
	reader.readAsDataURL(e.target.files[0]);
}

	$(function(){
		$(':file').on('change', function (e) {
			setThumbnail(e);
		});
		
		$('#modify').click(function(e){
			e.preventDefault();
			var telLength = $('#tel').val().length;
			var zip = $('#zip').val();
			if (telLength == "" || telLength != 11){
				$('#tel').attr('type', 'text');
				$('#tel').css('color', 'red').val("연락처를 확인해주세요.");
				$('#tel').focus();
				$('#tel').click(function(){
					$('#tel').css('color', 'black').val("");	
					$('#tel').attr('type', 'number');
				});
			}
 			else if (zip == ""){
				$('#zip').css('color', 'red').val("우편번호를 입력해주세요.");
				$('#findZip').focus();
			}
			else {
				var fileCheck = $('#profile').val();
				console.log(fileCheck);
				document.signUpF.submit();
			}
		});
	});

</script>
</head>
<body id= "back_color_body">
<%@ include file = "../include/header.jsp" %>
<div id = "back_div">
	<form name = "signUpF" method="post" action="${path}/user/modifyInfo" enctype="multipart/form-data">
		<input type = "hidden" name = "user_id" value="${member.user_id}" >
		<fieldset class = "modifyInfo-form">
		<table style="width:80%">
			<tr>
				<td rowspan="5" align="center">
					<div class = "imgBox">
						<c:if test="${member.file_name != null}">
							<img src = "${path}/uploadimg/${member.file_name}">
						</c:if>
						<c:if test="${member.file_name == null}">
							<img src = "${path}/resources/img/person_icon.png" class = "preview-image"><br>
						</c:if>
					</div>
					<div id="image_container">
					</div>
					<input type="file" id="profile" class="inputSize" accept="img/*" name = "profile">
				</td>
			</tr>
			<tr>
				<th>취향 |</th>
				<td>
					<div id = "genre">
						<c:forEach var = "genre" items= "${genreList}" varStatus = "status">
							<c:set var="check" value="false"/>
								<c:forEach var = "tag" items = '${tagList}'>
									<c:if test="${genre.GENRE_CODE eq tag.GENRE_CODE}">
										<c:set var="check" value="true"/>
										<input type = "checkbox" class = "tag" name = "tag" value = "${genre.GENRE_CODE}" checked="checked">
										<span class = "genreName">${genre.GENRE_NAME}</span>
									</c:if>
								</c:forEach>
								<%-- ${!check } --%>
								<c:if test="${!check}">
									<input type = "checkbox" class = "tag" name = "tag" value = "${genre.GENRE_CODE}">
									<span class = "genreName">${genre.GENRE_NAME}</span>
								</c:if>
							<c:if test="${status.count%3 == 0}">
								<br>
							</c:if>								
						</c:forEach>
					</div>
				</td>
			</tr>
			<tr>
				<th>연락처 |</th>
				<td>
					<input type = "number" id = "tel" name = "tel" value = "${member.tel}" class = "inputSize">
				</td>
			</tr>
			<tr>
				<th>주소 |</th>
				<td>
					<div>
						<input type = "text" id = "zip" name = "zip" readonly="readonly" class = "inputSize" value = "${member.zip}">
						<button type = "button" id = "findZip" class = "modifyBtn">주소 찾기</button><br>
						<input type = "text" name = "addr1" readonly="readonly" class = "inputSize" value = "${member.addr1}"><br>
						<input type = "text" name = "addr2" class = "inputSize" placeholder="상세 주소를 입력하세요.">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button id = "modify" class = "modifyBtn">확인</button>
					<button type="reset" class = "modifyBtn">취소</button>
				</td>
			</tr>
		</table>
	</fieldset>
	</form>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>
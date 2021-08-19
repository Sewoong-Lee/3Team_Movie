<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCV</title>
<link href = "${path}/resources/css/forInfoInquiry.css" rel = "stylesheet"/>
<script type="text/javascript">
	function email_check(email) {
		var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return reg.test(email);
	}
	$(function(){
		//클릭하지 않아도 작성하면 자동 생성됨.
		$('.clickState').each(function(index){
			$('#forPw').hide();
			$(this).attr('menu-index', index);
		}).click(function(e) {
			e.preventDefault();
			var curState = $(this).attr('id');
			if(curState == 'findId'){
				$('#forPw').hide();
				$('#forId').show();
			}
			if(curState == 'findPw'){
				$('#forId').hide();
				$('#forPw').show();
			}
			/*클릭된 <div>의 menu-index 값을 index 변수에 할당한다.*/
			var index = $(this).attr('menu-index');
			/*클릭한 <div>에  clicked 클래스 추가*/
			$('.clickState[menu-index=' + index + ']').addClass('clicked'); 
			/*그 외 <div>는  clicked 클래스 삭제*/
			$('.clickState[menu-index!=' + index + ']').removeClass('clicked');
		});
		$('#sendMail').click(function(e){
			e.preventDefault();
			var email = $('#email').val();
			if (email == ""){
				$('#email').css('color', 'red').val('!이메일 입력은 필수입니다.');
				$('#email').click(function(){
					$('#email').css('color', 'black').val('');
				});
			}
			else if(!email_check(email)){
				$('#email').css('color', 'red').val('!이메일 형식에 맞게 입력해주세요.');
				$('#email').click(function(){
					$('#email').css('color', 'black').val('');
				});
			}
			else {
				var email = $('#email').val();
				$.ajax({
					url:'${path}/user/findMyId',
					type:'get',
				        data:{email}, 
				        dataType:'json',
				        success:function(data){
				        	alert(data.msg);
				        },
				        error:function(e){
				        	console.log(e);
						alert("실패");
				        }
				});
			}
		});
		$('#next').click(function(e){
			e.preventDefault();
			var user_id = $('#user_id').val();
			if (user_id == ""){
				$('#user_id').css('color', 'red').val('!이메일 입력은 필수입니다.');
				$('#user_id').click(function(){
					$('#user_id').css('color', 'black').val('');
				});
			}
			else {
				$.ajax({
					url:'${path}/user/findMyPw',
					type:'get',
				        data:{user_id}, 
				        dataType:'json',
				        success:function(data){
						if(data.code == 1){
							alert(data.msg);
							//location.href = "${path}/user/modifyPw";
						}
						else {
							alert(data.msg);
						}
				        },
				        error:function(e){
				        	console.log(e);
						alert("실패");
				        }
				});
			}
		});
	});
</script>
</head>
<body id = "back_color_body">
<%@ include file = "../include/header.jsp" %>
	<h5>내 정보 찾기</h5>
<ul>
	<li><a href="" class = "clickState clicked" id = "findId">아이디 찾기</a></li>
	<li><a href="" class = "clickState" id = "findPw">비밀번호 찾기</a></li>
</ul>
<fieldset class = "findMyInfo"  id = "forId">
	<form action="${path}/user">
		<div>
			회원 정보에 등록한 이메일로 인증<br>
			<span class = "subMsg">회원정보에 등록한 이메일과 입력한 이메일이 같아야만 인증 메일을 받을 수 있습니다.</span>
			<p>
				<label for = "email">이메일</label>
				<input type = "email" id = "email" name = "email">
				<button id = "sendMail">인증 메일 받기</button>
			</p>
		</div>
	</form>
</fieldset>
<fieldset class = "findMyInfo" id = "forPw">
	<div>
		가입된 아이디로 인증<br>
		<span class = "subMsg">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</span>
		<p>
			<label for = "user_id">아이디</label>
			<input type = "text" id = "user_id" name = "user_id">
			<button id = "next">확인</button>
		</p>
	</div>
</fieldset>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>
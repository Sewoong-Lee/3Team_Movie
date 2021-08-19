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
<title>영화 디테일</title> 
<script type="text/javascript">
$(function() {
	//youtube api 우선 youtube api 제재로 인해 주석처리
  	function youtube() {
  		var movieCode = $('#movieName').val().replace(/|(<([^>]+)>)|/ig,""); 
	 	var movieName = movieCode.replace('|','');
	 	var youtube_link = $('#youtube_link').val();
		if(youtube_link !=''){ 
			$("#movieFrame").attr("src","https://www.youtube.com/embed/"+youtube_link+'?allow="autoplay=1"');
			return; 
		}
	 	$.ajax({
	 		url:'https://www.googleapis.com/youtube/v3/search?part=id&key=AIzaSyApW5dfgmSQHb26-5tazfF0HYUucH5wGhs&q='+movieName+" 메인 예고편"+'&type=video&videoEmbeddable=true&videoType=videoTypeUnspecified&maxResults=1&videoDuration=short&order=date',
/* 			url:'https://www.googleapis.com/youtube/v3/search?part=id&key=AIzaSyApW5dfgmSQHb26-5tazfF0HYUucH5wGhs&q='+movieName+" 메인 예고편"+'&type=video&videoEmbeddable=true&videoType=videoTypeUnspecified&maxResults=1&order=date', */
			type:'get',
			success:function(data){
				console.log(data);
				youtubeData(data);
			},
			error:function(err){
				console.log(err);
			}
		});  
	}; 
	 youtube();
	//유튜뷰 result 
   	function youtubeData(data) {
		console.log(data);
		var object = data['items'];
		var items = object[0];
	 	var id = items['id'];
	 	var video = id['videoId'];
	 	youtubeInsert(video);
		/*  $("#movieFrame").prop("src", "https://www.youtube.com/embed/"+video)  */
 		/* $("#movieFrame").attr("src","https://www.youtube.com/embed/"+video+'?allow="autoplay=1"'); */
	} 

//영화 유튜브링크 등록 
function youtubeInsert(video) {
	var movie_num = $('#movieNum').val();
	alert(movie_num);
	alert(video);
	$.ajax({
		url:'${path}/moviedata/youtubeInset?youtube_link='+video+'&movie_num='+movie_num,
		type:'post',
		success: function(data) {
			$("#movieFrame").attr("src","https://www.youtube.com/embed/"+video+'?allow="autoplay=1"');
		},error: function(err) {
			console.log('실패');
		}
	});
}
	
	
	//댓글 추가 클릭시
	$('#btnRepSave').click(function(e) {
		e.preventDefault();
		var userid = $('#reUserid').val();
		var content = $('#reContent').val();
		var reStep =  $('#reStep').val();
		var relevel = $('#relevel').val();
		var movie_num = $('#movieNum').val();
		var star_rating = $('.starRev').find('.on').last().text();
		if(content==''){
			alert('글을 작성해주세요');
			$('#reContent').focus();
			return;
		}		
		if(star_rating ==''){	
			alert('평점을 선택해주세요');
			return;
		} 
 		$.ajax({
			url:'${path}/reply/',
			type:'post',
			contentType:'application/json',
			data: JSON.stringify({userid,content,reStep,relevel,movie_num,star_rating}),
			dataType:'text',
			success: function(data) {
				console.log(data);
				alert("댓글추가 완료되었습니다")
			    $('#repAdd').hide(); 
				location.replace("${path}/moviedata/detail?movie_num="+$('#movieNum').val());
			},
			error: function(err) {
				console.log(err);
			}
		}); 
	});
	
	//원본 내용 클릭시 
	$('.repContent').click(function(e) {
		e.preventDefault();
		$('#repAdd').hide();
		var mr_num = $(this).attr("mr_num");
		$.ajax({ 
			url:'${path}/reply/detail?mr_num='+mr_num,
			type:'get',
			dataType:'text',
			success: function(data) {
				console.log(data);
				rederReplyDetail(data);
			},error: function(error) {
				alert("실패");
				console.log("error");
			}
		});
	});

	
//내용선택시 ajax로 data받은값	
function rederReplyDetail(data) {
	$('#reDtable').show();
	var obj = JSON.parse(data);
	var mr_num = obj.mr_num; 
	var user_id = obj.user_id;
	var content = obj.content;
	var reg_date = obj.reg_date;
	var movie_num = obj.movie_num;
	$('#reDmr_num').val(mr_num);
	$('#reDUser_id').html(user_id);
	$('#reDContent').text(content);
	$('#reDdate').html(reg_date);
	$('#movie_num').val(movie_num);
}	
	//원본 댓글 클릭 햇을때 추가
	$('#btnRepAdd').click(function(e) {
		e.preventDefault();
		if(${sessionScope.user_id==null}){
			alert('로그인을 해주세요')
			return;
		}
		$('#reDtable').hide();
		$('#repAdd').show();
		$('#reContent').focus();
	});
	
 	//수정버튼 
	$('#btnUpdate').click(function() {
		var mr_num = $('#reDmr_num').val();
		var movie_num = $('#movie_num').val();
		var user_id = $('#reDUser_id').text();	
		var content = $('#reDContent').val();
		//권한체크 
		if(user_id !='${sessionScope.user_id}'){
			alert('수정권한이 없습니다');
			return;
		};
		$.ajax ({
			url:'${path}/reply/modify',
			type:'post',
			data:{mr_num,movie_num,user_id,content},
			success: function(data) {
				alert("수정하였습니다");
				$("tr[reDmr_num='" + $('#reDmr_num').val() + "']").find(".repContent").text(content);
				$('#reDtable').hide();
				location.reload()
			},
			error: function(err) {
				alert("실패");
			}
		});	
	});
	
	//삭제버튼 
	$('#btnDelete').click(function() {
		//권한체크 
		var user_id = $('#reDUser_id').text();	
		var mr_num = $('#reDmr_num').val();
		var movie_num = $('#movie_num').val();
		if(user_id !='${sessionScope.user_id}'){
			alert('수정권한이 없습니다');
			return;
		};
		var result = confirm('정말 삭제하시겠습니까?');
		if (result){
			location.href="${path}/reply/delete?mr_num="+mr_num+"&movie_num="+movie_num;
		}
	}); 
	
	//별 클릭시
 	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		});
	
	//예매클릭 햇을때 
	$('#Ticketing').click(function(e) {
		e.preventDefault()
		var MOVIE_NUM = ${movieDetail.MOVIE_NUM} 
		alert(MOVIE_NUM);
		alert("예매");
	});
	
	//페이지 번호 클릭시 
	$('.rList').click(function() {
		var curPage = $(this).attr('curPage');
		var movie_num = $('#movieNum').val();
		location.href="${path}/moviedata/detail?curPageReply="+curPage+"&movie_num="+movie_num;
	});
	if('${msg}'){
		alert('${msg}');
	};
	$('#repAdd').hide();
});


</script>
<style>

#repAdd{
	float: left;
    display: block;
    margin: auto;
    margin-top: 30;
    margin-left: 500;
}

#imgDiv{
    margin-left: 200;
    left: 30;
    right: 30;
    bottom: 30;
    padding-left :200;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: 50% 50%;
}
#movieInfoDiv{
	position: absolute; left: 800px; height: 420px; width: 480px; top: 140px; font-size: 19px;
	color: black;
	margin-top: 460;
}
#nameDiv{margin-top: 310px; font-size: 30px}
#directorDiv{margin-top: 25px;}
#actorDiv{margin-top: 14px}
#genreDiv{width: 450px;
    margin-top: -26;
    margin-left: 400;
}
#courtryDiv{margin-top: 14px}
#starDiv{margin-top:14px}
#Ticketing{
	margin-top:-50;
    margin-left: 600;
    position: relative;
    height: 45px;
    padding: 0 40px;
    border: 1px solid transparent;
    border-radius: 56px;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    line-height: 6px;
    font-weight: 700;
    font-size: 18px;
    white-space: nowrap;
    display: inline-block !important;
    min-width: 200px;
    background: #606ed0;
    color: white;
}
.storyVideo{margin-left: 500px}

/* 별 반쪽 포함 */
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

#movieFrame{
	margin-left: 520px;
	width: 650px;
	height: 363px;
}

#back_color_body{
   background-color: #1a1313;
}
#back_div{
   width: 100%;
   max-width: 80%;
   margin: auto;
}
#movieFrameDiv{
	 background-color: #1a1313;
	 height:480px;
	 padding-top: 100;
	 padding-left: 150;
}
#movieFrame{
	margin-left: 700px;
}

.repPaging a {
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
.repPaging{
	margin: 0px;
}
#repCurpage{
	background-color: #d3af71;
	color: white;
	font-size: 22px;
	font-weight: bold;
}


.logo{
    padding: 0;
    margin-top: 0;
    margin-bottom: 0;
    font-size: 16px;
    padding-top: 20;
    font-weight: lighter;
    background-color: #1a1313;
}
#loginCheck{
 background-color: #1a1313;
}
#reContent{
font-size: 20px;
}
#btnRepSave{
	padding-left: 16;
	padding-right: 16;
	font-size: 20;
	margin-top: 20px;
    margin-bottom: 30px;
}
#btnRepReset{
	padding-left: 16;
	font-size: 20;
	padding-right: 16;
	margin-top: 20px;
    margin-bottom: 30px;
}
#reUserid{
border: 0; 
outline: none; 
font-size: 22px;
padding-bottom: 20px;
}

</style>
</head>
<body >
<%--  ${sessionScope.user_id}
${movieDetail}<Br>
${movieDetail.YOUTUBE_LINK}  --%>

<%-- ${movieDetail} <br> --%>
<input type="hidden" id="movieName" value="${movieDetail.MOVIE_NAME}">
<input type="hidden" id="youtube_link" value="${movieDetail.YOUTUBE_LINK}">

	<div id="movieFrameDiv">
		<iframe id="movieFrame" width="600" height="450" src="https://www.youtube.com/embed/${movieDetail.YOUTUBE_LINK}?autoplay=1&mute=1";frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
		<div id="imgDiv">
			<img alt="이미지링크"  src="${movieDetail.MOVIE_POSTER_LINK}" width="300px" style="margin-top: -160;">
		</div>
			<div id="movieInfoDiv">
				<div id="nameDiv">제목: ${movieDetail.MOVIE_NAME}</div>
				<div id="directorDiv">감독: ${movieDetail.DIRECTOR}</div>
				<div id="genreDiv">대표장르: ${movieDetail.GENRE_NAME}</div>
				<div id="actorDiv">배우: ${movieDetail.ACTOR_NAME}</div>
				<!-- 영화소개는없다 api에 없음-->
				<div id="courtryDiv">제작국가명: ${movieDetail.COUNTRY_NAME}   </div>
				<div id="starDiv"> 
				<c:choose>
					<c:when test="${starResult>=5.0}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star10.png"></c:when>
					<c:when test="${starResult>=4.5}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star9.png"></c:when>
					<c:when test="${starResult>=4.0}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star8.png"></c:when>
					<c:when test="${starResult>=3.5}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star7.png"></c:when>
					<c:when test="${starResult>=3.0}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star6.png"></c:when>
					<c:when test="${starResult>=2.5}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star5.png"></c:when>
					<c:when test="${starResult>=2.0}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star4.png"></c:when>
					<c:when test="${starResult>=1.5}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star3.png"></c:when>
					<c:when test="${starResult>=1.0}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star2.png"></c:when>
					<c:when test="${starResult>=0.5}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star1.png"></c:when>
					<c:when test="${starResult==0.0}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star0.png"></c:when>
				</c:choose>	: ${starResult}</div>
					<button type="button" id="Ticketing">지금 예매</button>
		</div>
	
	<button type="button" id="btnRepAdd" style="margin-left: 30; padding-left: 15; padding-right: 15; font-size: 19;
			background-color: #d3af71; color: white">댓글</button>
	<hr id="reply0">
<%--   ${replyList}  --%>
 	<table border="1" style=" margin-left:400px;  margin-top: 50px" id="repTable">
 		<tr style="font-size: 17px">
 			<th width="50">No</th>
 			<th width="150px">작성자</th>
 			<th width="150px">평점</th>
 			<th width="700px">한줄평</th>
 			<th width="250px">등록일자</th>
 		</tr>
		<c:forEach var="reList" items="${replyList}">
		<tr style="text-align: center" reDmr_num="${reList.MR_NUM}"> 
			<td>${reList.MR_NUM}</td>
			<td>${reList.USER_ID}</td>
			<td class="cStar">	
				<c:choose>
					<c:when test="${reList.STAR_RATING>=5.0}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star10.png"></c:when>
					<c:when test="${reList.STAR_RATING>=4.5}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star9.png"></c:when>
					<c:when test="${reList.STAR_RATING>=4.0}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star8.png"></c:when>
					<c:when test="${reList.STAR_RATING>=3.5}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star7.png"></c:when>
					<c:when test="${reList.STAR_RATING>=3.0}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star6.png"></c:when>
					<c:when test="${reList.STAR_RATING>=2.5}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star5.png"></c:when>
					<c:when test="${reList.STAR_RATING==0.0}"><img alt="star" src="https://image.aladin.co.kr/img/shop/2012/icon_star0.png"></c:when>
				</c:choose> ${reList.STAR_RATING}
			</td>
			<td>
				<c:choose>
					<c:when test="${sessionScope.user_id eq reList.USER_ID}">
						<a href="#" class="repContent" mr_num="${reList.MR_NUM}">${reList.CONTENT}</a>
					</c:when>
					<c:otherwise>
						${reList.CONTENT}
					</c:otherwise>
				</c:choose> 
			</td>
			<td>${reList.REG_DATE}</td>
		</tr>
		</c:forEach>
	</table> 


	<!-- 댓글 추가  -->
	<div id="repAdd">
		<h2 style="padding-left: 200px">리뷰 작성하기</h2>
		<input type="hidden" id="reStep"  value="0">
		<input type="hidden" id="relevel" value="0">
		<input type="hidden" id="movieNum" value="${movieDetail.MOVIE_NUM}">
		<table style="padding-top: 20px;">
			<div class="starRev" style="padding-left: 100px">
			  <span class="starR1">0.5</span>
			  <span class="starR2">1.0</span>
			  <span class="starR1">1.5</span>
			  <span class="starR2">2.0</span>
			  <span class="starR1">2.5</span>
			  <span class="starR2">3.0</span>
			  <span class="starR1">3.5</span>
			  <span class="starR2">4.0</span>
			  <span class="starR1">4.5</span>
			  <span class="starR2">5.0</span>
			</div>
			<tr>
				<th>작성자</th>
				<td><input type="text" id="reUserid" value=" ${sessionScope.user_id}" size="60" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>댓글</th>
				<td><textarea rows="3" cols="100" id="reContent" maxlength="100"></textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="center"> 
					<button id ="btnRepSave">추가</button>
					<button id ="btnRepReset" type="button">취소</button>
				</td>
			</tr>
		</table>
	</div>
	
<%-- ${replyMap} --%>
	<!-- 댓글 페이징 -->
 	<div class="repPaging" style=" margin-top:10px; margin-left: 1000px; margin-top: 30px ">
 	<c:if test="${replyMap.replypage.startPage != 1}">
		<a href="#" curPage="${replyMap.replypage.startPage-1}" class="rList" >이전</a>
	</c:if>
	
	<c:forEach  var="i"  begin="${replyMap.replypage.startPage}" end="${replyMap.replypage.endPage}">
		<c:if test="${replyMap.replypage.curPageReply==i}">
			<a href="#" curPage="${i}" class="rList" id="repCurpage">${i}</a>
		</c:if>
		<c:if test="${replyMap.replypage.curPageReply!=i}">
			<a href="#" curPage="${i}" class="rList" >${i}</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${replyMap.replypage.totPage > replyMap.replypage.endPage}">
		<a href="#" curPage="${replyMap.replypage.endPage+1}"  class="rList" >다음</a>
	</c:if>
 	</div>
 	<h2> </h2><br>


	<!-- 댓글 수정삭제 -->
 	<form action="" name="frmReply" id="reDtable" hidden>
 	<input type="hidden" id="movie_num" value="${replyResult.movie_num}" >
	 	<table  border="1px" style=" margin: 50px; margin-left: 400px;">
	 		<tr hidden="">
	 			<th>No</th>
				<td><input type="text" id="reDmr_num" value="${replyResult.mr_num}"></td>
	 		</tr>
	 		<tr>
	 			<th>작성자</th>
				<td id="reDUser_id">${replyResult.user_id}</td>
	 		</tr>
	 		<tr>
	 			<th>한줄평</th>
	 			<td><textarea rows="3" cols="80" id="reDContent" maxlength="100"></textarea></td>
	 		</tr>
			<tr hidden=""> 
	 			<th>등록일자</th>
				<td id="reDdate">${replyResult.reg_date}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnUpdate">수정 </button>
					<button type="button" id="btnDelete">삭제 </button>
				</td>
			</tr>
		</table> 
 	</form>

	



</body>
</html>
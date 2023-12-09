<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MU:TE</title>
<style>
@font-face {
	font-family: 'KOTRAHOPE';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2')
		format('woff2');
	font-weight: 30;
	font-style: normal;
	font-color: #002EA5;
	text-align: 'center';
}
* {
	font-family: 'KOTRAHOPE';
}
.button{
	background-color: #FFE2F8;
	color: #002EA5;
	border: none;
	width: 331px;
	height: 110px;
	font-size:30px;
	border-radius:30px;
	box-shadow:0px 4px 4px 0px #CBCBCB;
}
#headline{
	font-size:46px;
}
#login{
	font-size:32px;
	color: #002EA5;
	text-decoration:none;
}
div{
	text-align:center;
}
#logo {
  position: absolute;
  top: 20px; /* Adjust as needed */
  left: 250px;
}
#bear {
  margin-top: 10px; /* Adjust as needed */
}
#mypage {
  position: absolute;
  top: 20px; /* Adjust as needed */
  right: 250px; /* Adjust as needed */
}
</style>
</head>
<body>
	<nav>
		<div>
			<img id="logo" alt="logo" src="resources/img/logo.png" height="144" width="189"><!--로고 -->
			<img id="bear" alt="bear" src="resources/img/main.png" height="360" width="360"><!-- 농담곰 사진 -->
			<img id="mypage" alt="mypage" onclick="location.href='mypage.jsp'" src="resources/img/mypage.png" height="103" width="115"><!-- 마이페이지 곰 -->
		</div>
	
		<div>
			<h1 id="headline">내가 듣는 노래가 아이스크림이라면?</h1>
			<button class="button" onclick="location.href='!!!!질문페이지 시작 !!!">눌러서 맛보기</button>
			<br><br>
			<a id="login" href="login">간편 로그인</a>
		</div>
		
		<!-- 댓글 기능 구현 !!!! -->
		<div>
		</div>
	</nav>
</body>
</html>
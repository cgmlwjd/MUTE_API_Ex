<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

div {
	text-align: center;
}

h1 {
	font-size: 64px;
	margin: 0;
}

.link {
	font-size: 50px;
	text-decoration: none;
	color: #000000;
}

#id_login {
	position: relative;
}

.kakao-link {
	position: absolute;
	top: 25px;
	right: 750px;
}

.naver-link {
	position: absolute;
	top: 190px;
	right: 750px;
}

#kakao {
	position: absolute;
	right: 470px; /* Adjust this value as needed */
}

#naver {
	position: absolute;
	right: 475px;
	top: 170px /* Adjust this value as needed */
}

#logo {
	margin: 0;
}
</style>
<script>
	function clickKakaoLogin() {
		var clientId = '572b64114f9b12ed34721377c274c862'; // 앱 키 중 JavaScript 키
		var redirectUri = 'http://localhost:9012/test/main'; // 등록한 Redirect URI
		window.location.href = 'https://kauth.kakao.com/oauth/authorize?response_type=code&client_id='
				+ clientId + '&redirect_uri=' + redirectUri;
	}
</script>
<nav>
	<div>
		<img id="logo" alt="logo" src="resources/img/logo.png" height="385"
			width="484">
		<!--로고 -->
		<h1>간편로그인</h1>
	</div>

	<div id="id_login">
		<p>
			<a href="javascript:void(0);" onclick="clickKakaoLogin()"
				class="link kakao-link">카카오로 시작하기</a><img id="kakao"
				alt="kakao-logo" onclick="clickKakaoLogin()"
				src="resources/img/btn_kakao.png" height="140" width="144">
		</p>

		<p>
			<a href="naverLogin.jsp" class="link naver-link">네이버로 시작하기</a><img
				id="naver" alt="naver-logo" onclick="location.href='naverLogin'"
				src="resources/img/btn_naver.png" height="120" width="124">
		</p>
	</div>

</nav>

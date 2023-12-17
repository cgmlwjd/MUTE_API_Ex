<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spotify API Result</title>
</head>
<body>

<h2>Spotify API Result</h2>

<%
    // Spotify API 호출을 위한 서비스 인스턴스 생성
    com.spotify.SpotifyApiService spotifyApiService = new com.spotify.SpotifyApiService(new org.springframework.web.client.RestTemplate());

    // 예제로 고정된 값 사용
    String userId = "your_user_id";
    String playlistName = "New Playlist";
    String playlistDescription = "Description for the new playlist";

    // Spotify API 호출
    spotifyApiService.createPlaylist(userId, playlistName, playlistDescription);
%>

<p>Spotify API 호출이 완료되었습니다.</p>

</body>
</html> --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spotify Auth Response</title>
</head>
<body>
    <h1>Spotify Auth Response</h1>
    <p>Access Token: ${spotifyAuthResponse.accessToken}</p>
    <p>Refresh Token: ${spotifyAuthResponse.refreshToken}</p>
    <p>Expires In: ${spotifyAuthResponse.expiresIn}</p>
    <p>Status: ${spotifyAuthResponse.status}</p>
</body>
</html>

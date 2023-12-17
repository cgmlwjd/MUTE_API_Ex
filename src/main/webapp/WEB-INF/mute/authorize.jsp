<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authorization Page</title>
</head>
<body>

    <h1>Authorization Page</h1>

    <!-- Spotify 로그인 페이지로 리다이렉트하는 링크 -->
    <a href="https://accounts.spotify.com/authorize?client_id=61731dfa4f5a4f81a934c76fe09958d8&redirect_uri=http://localhost:9089/mute_test/result&response_type=code&scope=user-read-playback-state%20user-modify-playback-state%20user-read-currently-playing%20streaming%20playlist-modify-public%20user-library-modify&state=UUID.randomUUID().toString();">
        Log in with Spotify
    </a>

</body>
</html>

package com.music.mute.spotify;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SpotifyOAuthController {

    private static final String CLIENT_ID = "61731dfa4f5a4f81a934c76fe09958d8";
    private static final String REDIRECT_URI = "http://localhost:9089/mute/main";
    private static final String SPOTIFY_API_AUTHORIZE_URL = "https://accounts.spotify.com/authorize";

    @RequestMapping("/authorize")
    public String authorizeSpotify() {
        return "redirect:" + SPOTIFY_API_AUTHORIZE_URL +
               "?client_id=" + CLIENT_ID +
               "&response_type=code" +
               "&redirect_uri=" + REDIRECT_URI +
               "&scope=streaming user-read-email user-read-private user-library-read user-library-modify " +
               "user-read-playback-state user-modify-playback-state playlist-read-collaborative " +
               "user-read-currently-playing playlist-read-private playlist-modify-public " +
               "playlist-modify-private";
    }

    @RequestMapping("/callback")
    public String handleCallback() {
        // 처리 로직 구현
        return "callback";
    }
}
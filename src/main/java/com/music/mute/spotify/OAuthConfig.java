package com.music.mute.spotify;

import java.util.UUID;

public class OAuthConfig {

    public static void main(String[] args) {
        // Spotify API 인증 정보
        String clientId = "61731dfa4f5a4f81a934c76fe09958d8"; // 실제 값으로 대체
        String clientSecret = "7b9fbc7d7cb14319b7af63f5c5f18176"; // 실제 값으로 대체

        // 리다이렉션 URI 및 상태 생성
        String redirectUri = "http://localhost:9089/mute_test/result"; // 실제 값으로 대체
        String state = UUID.randomUUID().toString();

        // 스코프 설정
        String scope = "user-read-playback-state user-modify-playback-state user-read-currently-playing streaming playlist-modify-public user-library-modify";

        // URL 파라미터 문자열 생성
        String params = String.format("client_id=%s&redirect_uri=%s&response_type=code&scope=%s&state=%s",
                clientId, redirectUri, scope, state);

        // 최종 결과 문자열 생성
        String result = String.format("https://accounts.spotify.com/authorize?%s", params);

        // 결과 출력
        System.out.println("Spotify OAuth 2.0 인증 요청 URL:");
        System.out.println(result);
    }
}

package com.music.mute.spotify;

public class SpotifyAuthResponse {
    private String accessToken;
    private String refreshToken;
    private int expiresIn;
    private int status;

    // 생성자, getter, setter 등 필요한 메서드 추가

    public SpotifyAuthResponse(String accessToken, String refreshToken, int expiresIn, int status) {
        this.accessToken = accessToken;
        this.refreshToken = refreshToken;
        this.expiresIn = expiresIn;
        this.status = status;
    }
}

package com.music.mute.spotify;

import java.io.IOException;
import java.net.URI;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CompletionException;

import org.apache.hc.core5.http.ParseException;
import org.springframework.stereotype.Controller;

import se.michaelthelin.spotify.SpotifyApi;
import se.michaelthelin.spotify.exceptions.SpotifyWebApiException;
import se.michaelthelin.spotify.model_objects.credentials.AuthorizationCodeCredentials;
import se.michaelthelin.spotify.requests.authorization.authorization_code.AuthorizationCodeRequest;
import se.michaelthelin.spotify.requests.authorization.authorization_code.AuthorizationCodeUriRequest;

@Controller
public class SpotifyAuthController {

/*    @PostMapping("/api")
    @ResponseBody
    public SpotifyAuthResponse exchangeCode(@RequestBody SpotifyAuthRequest requestBody) {
        // requestBody에서 code를 받는다.
        String code = requestBody.getCode();

        // 스포티파이 앱 api 생성자 함수를 사용하여 uri와 id, secret 값을 넣어준다.
		
		SpotifyWebApi spotifyApi = new SpotifyWebApi.Builder()
				.setRedirectUri("http://localhost:9089/mute_test/result")
				.setClientId("61731dfa4f5a4f81a934c76fe09958d8")
				.setClientSecret("7b9fbc7d7cb14319b7af63f5c5f18176") .build();
		 
        


        try {
            AuthorizationCodeCredentials credentials = spotifyApi.authorizationCodeGrant(code).build().execute();
            // 데이터에 있는 토큰, 만료시간을 응답으로 돌려준다.
            return new SpotifyAuthResponse(
                credentials.getAccessToken(),
                credentials.getRefreshToken(),
                credentials.getExpiresIn(),
                200
            );
        } catch (IOException | SpotifyWebApiException e) {
            // 에러 발생 시 400 응답
            return new SpotifyAuthResponse(null, null, 0, 400);
        }*/
	
	public static void main(String[] args) throws ParseException {
        // Spotify 개발자 대시보드에서 얻은 클라이언트 ID, 클라이언트 시크릿, 리디렉션 URI
        String clientId = "your-client-id";
        String clientSecret = "your-client-secret";
        String redirectUri = "http://localhost:9089/mute_test/result";

        // SpotifyApi 객체 생성
        SpotifyApi spotifyApi = new SpotifyApi.Builder()
                .setClientId(clientId)
                .setClientSecret(clientSecret)
                .build();

        // Spotify 인증 페이지로 리디렉션
        AuthorizationCodeUriRequest authorizationCodeUriRequest = spotifyApi.authorizationCodeUri()
                .state("state")
                .scope("user-read-private,user-read-email")  // 필요한 스코프 설정
                .show_dialog(true)  // 사용자에게 승인 대화 상자를 표시할지 여부
                .redirect_uri(URI.create(redirectUri))
                .build();

        URI uri = authorizationCodeUriRequest.execute();
        System.out.println("Please click the following link to authorize the application: " + uri);

        // 사용자로부터 받은 인증 코드
        String code = "your-received-code";  // 사용자로부터 받아야 하는 값

        // Spotify API에 인증 코드를 전달하여 액세스 토큰 얻기
        AuthorizationCodeRequest authorizationCodeRequest = spotifyApi.authorizationCode(code)
                .redirect_uri(URI.create(redirectUri))
                .build();

        try {
            AuthorizationCodeCredentials authorizationCodeCredentials = authorizationCodeRequest.execute();
            String accessToken = authorizationCodeCredentials.getAccessToken();
            System.out.println("Access Token: " + accessToken);
        } catch (IOException | SpotifyWebApiException | CancellationException | CompletionException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
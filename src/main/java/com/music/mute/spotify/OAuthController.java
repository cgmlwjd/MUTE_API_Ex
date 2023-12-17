package com.music.mute.spotify;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OAuthController {

    // GET 요청 처리
    @GetMapping("/authorize")
    public String authorize() {
        // authorize.jsp 페이지로 포워딩
        return "authorize";
    }

    // POST 요청 처리
    @PostMapping("/exchangeCode")
    public String exchangeCode(@RequestParam String code) {
        // 액세스 토큰을 교환하고 결과를 콘솔에 출력하는 로직
        System.out.println("Received authorization code: " + code);

        // 여기에서 액세스 토큰을 얻어올 수 있는 로직을 추가하면 됩니다.
        // 예를 들어, Spotify API와 통신하여 액세스 토큰을 얻어오는 코드를 추가할 수 있습니다.

        // 결과를 콘솔에 출력
        System.out.println("Exchanged authorization code for access token");

        // 결과 페이지로 리다이렉트
        return "redirect:/result";
    }
}

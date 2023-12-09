<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="org.apache.commons.codec.binary.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your JSP Page</title>
</head>
<body>

    <h1>Hello, Spring Legacy Project!</h1>

    <script>
        const getRefreshToken = async () => {
            console.log('getRefreshToken function started'); // 여기에 추가

            // refresh token that has been previously stored
            const refreshToken = localStorage.getItem('refresh_token');
            const url = "https://accounts.spotify.com/api/token";

            const payload = {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    grant_type: 'refresh_token',
                    refresh_token: refreshToken,
                    client_id: '<%= "61731dfa4f5a4f81a934c76fe09958d8" %>' // Replace with your actual clientId
                }),
            }

            const body = await fetch(url, payload);
            const response = await body.json();

            localStorage.setItem('access_token', response.accessToken);
            localStorage.setItem('refresh_token', response.refreshToken);

            console.log('getRefreshToken function completed', response); // 여기에 추가
        }

        // Java 코드 부분
        <% 
        String clientId = "61731dfa4f5a4f81a934c76fe09958d8"; // 실제 clientId로 대체
        String clientSecret = "7b9fbc7d7cb14319b7af63f5c5f18176"; // 실제 clientSecret로 대체
          
          String authUrl = "https://accounts.spotify.com/api/token";
          String encoding = Base64.encodeBase64String((clientId + ":" + clientSecret).getBytes(StandardCharsets.UTF_8));

          URL url = new URL(authUrl);
          HttpURLConnection connection = (HttpURLConnection) url.openConnection();
          connection.setRequestMethod("POST");
          connection.setRequestProperty("Authorization", "Basic " + encoding);
          connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
          connection.setDoOutput(true);

          String data = "grant_type=client_credentials";
          try (OutputStream os = connection.getOutputStream()) {
            byte[] input = data.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
          }

          int responseCode = connection.getResponseCode();

          if (responseCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
              String inputLine;
              StringBuilder content = new StringBuilder();
              while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
              }

              // Parse the JSON response
              String token = content.toString();
              // Use the token for further processing
            }
          } else {
            // Handle error response
          }

          connection.disconnect();
        %>

    </script>

</body>
</html>
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
            // Output the token to the JSP page
            out.println("var serverToken = '" + token + "';");

            // Output the token to the browser console
            out.println("console.log('서버 토큰:', '" + token + "');");
        }
    } else {
        // Handle error response
    }

    connection.disconnect();
    %>

    // 브라우저 콘솔에 토큰 출력
    console.log(serverToken);
</script>

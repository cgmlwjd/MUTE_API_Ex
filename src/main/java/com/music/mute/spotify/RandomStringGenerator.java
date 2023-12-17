package com.music.mute.spotify;

import java.security.SecureRandom;

public class RandomStringGenerator {

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    private static final int STRING_LENGTH = 16;

    public static String generateRandomString() {
        SecureRandom secureRandom = new SecureRandom();
        StringBuilder randomString = new StringBuilder();

        for (int i = 0; i < STRING_LENGTH; i++) {
            int randomIndex = secureRandom.nextInt(CHARACTERS.length());
            randomString.append(CHARACTERS.charAt(randomIndex));
        }

        return randomString.toString();
    }

    public static void main(String[] args) {
        String randomString = generateRandomString();
        System.out.println(randomString);
    }
}

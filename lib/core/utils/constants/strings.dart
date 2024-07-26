import 'dart:io';

// network
final String authServerBaseUrl = Platform.isAndroid
    ? "http://10.0.2.2:8000/api"
    : "http://localhost:8000/api";
const String ecommercerBaseUrl = "https://api.escuelajs.co/graphql";

// database
const String authBoxName = "authBox";
const String cacheBoxName = "cacheBox";
const String settingsBoxName = "settingsBox";

// keys
const String accessTokenKey = "accessToken";
const String refreshTokenKey = "refreshToken";
const String isFirstVisitKey = "isFirstVisitKey";

import 'dart:io';

// network
final String authServerBaseUrl = Platform.isAndroid
    ? "http://10.0.2.2:8000/api"
    : "http://localhost:8000/api";
const String ecommercerBaseUrl = "https://api.escuelajs.co/graphql";
const String socketConnectionuri = "ws://10.0.2.2:8000";

// database
const String cacheBoxName = 'cacheBox';
const String authBoxName = "authBox";
const String cartBoxName = "cartBox";
const String settingsBoxName = "settingsBox";
const String notificationBadgeBoxName = "notificationBadgeBox";

// keys
const String accessTokenKey = "accessToken";
const String refreshTokenKey = "refreshToken";
const String isFirstVisitKey = "isFirstVisitKey";
const String userIdKey = "userID";
const String biometricEnabledKey = "biometric_enabled";

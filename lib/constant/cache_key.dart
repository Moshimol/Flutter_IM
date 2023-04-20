import 'package:flutter/material.dart';

class CacheKey {
  static String appVersion = "app_version";

  static String accountId = "account_id";

  static String loginState = 'loginState';

  static String chatId = "chat_id";

  static String appUser = "app_user";

  static String requestHeader = "request_header";

  static String host = "host";

  // 单独用户的appid
  static String appUserInfo(String chatId) {
    return CacheKey.appUser + "-" + chatId;
  }
}

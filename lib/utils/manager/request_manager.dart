import 'dart:convert';

import '../../request/request/request.dart';

class RequestManager {
  // 初始化网络请求
  void init(){
    var header = RequestManager.getUserHeader();
    if (header != null) {
      Request().setHeader(header);
    }
  }

  // 设置header
  static setUserHeader(String token, String subKey, Map<String, dynamic> other) {
    Map<String, dynamic> header = {
      "Authorization": token,
      "SubOrgKey": subKey,
      "RequestStack": jsonEncode([
        {
          "appid": other["appid"],
          "appkey": other["appkey"],
          "channel": other["channel"],
        },
        {
          "appid": "yb1t50npewrab4gorlizfsxwjsvqyz6u",
          "channelAlias": "default",
        },
        {
          "appid": "i9wzpz8ntvlhrfcetw20lk4b7acnbuds",
          "channelAlias": "default",
        },
      ])
    };
    Request().setHeader(header);
  }

  static Map<String, dynamic> getUserHeader() {
    
    return {};
  }
}
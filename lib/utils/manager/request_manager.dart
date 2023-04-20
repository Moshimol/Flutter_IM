import 'dart:convert';

import 'package:flutter_im/constant/cache_key.dart';
import 'package:flutter_im/request/config.dart';

import '../../request/request/request.dart';
import '../storage/storage_shared.dart';

class RequestManager {
  // 初始化网络请求
  void init(){
    RequestManager.getUserHeader().then((value) {
      if (value != null) {
        Request().setHeader(value);
      }
    });
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
    StorageShared().setStorage(CacheKey.requestHeader, header);
    Request().setHeader(header);
  }

  static Future<Map<String, dynamic>> getUserHeader() async {
    var res =  await StorageShared().getStorage(CacheKey.requestHeader);
    return res;
  }
}
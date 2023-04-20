export 'storage/storage_shared.dart';
export 'module_model/login/search_login_data.dart';

import 'package:flutter/material.dart';

class Utils {
  static bool isEmptyString(String str) {
    if (str == null || str.isEmpty) {
      return true;
    }
    return false;
  }

  static bool isNotEmptyString(String str) {
    if (str != null && str.isNotEmpty) {
      return true;
    }
    return false;
  }

  /// 纯数字 ^[0-9]*$
  static bool pureDigitCharacters(String input) {
    final String regex = "^[0-9]*\$";
    return matches(regex, input);
  }

  static bool matches(String regex, String input) {
    if (input == null || input.isEmpty) return false;
    return new RegExp(regex).hasMatch(input);
  }

  // 判断当前的字符串
  static String getMsgType(Map<String, dynamic> msg) {
    late String typeStr;
    var type = msg["type"];

    switch(type) {
      case "img": {
        typeStr = "[图片]";
      }
      break;
      case "audio": {
        typeStr = "[语音]";
      }
      break;
      case "file": {
        typeStr = "[文件]";
      }
      break;
      case "merge": {
        typeStr = "[聊天记录]";
      }
      break;
      case "notice": {
        typeStr = "[通知]";
      }
      break;
      case "video": {
        typeStr = "[视频]";
      }
      break;
      case "txt": {
        typeStr = msg["msg"];
      }
      break;
    }

    return typeStr;
  }
}

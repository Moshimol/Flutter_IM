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

  static String getTimeDifference(String timeStr) {
    int time = (new DateTime.now().millisecondsSinceEpoch / 1000).round();
    int timeStamp = int.parse(timeStr);
    // 对比
    int _distance = time - timeStamp;
    if(_distance <= 60){
      return '刚刚';
    }else if(_distance <= 3600){
      return '${(_distance / 60).floor()}分钟前';
    }else if(_distance <= 43200){
      return '${(_distance / 60 / 60).floor()}小时前';
    }else if(DateTime.fromMillisecondsSinceEpoch(time*1000).year == DateTime.fromMillisecondsSinceEpoch(timeStamp*1000).year){
      return '${CustomStamp_str(timestamp: timeStamp, date: 'MM/DD hh:mm', toInt: false)}';
    }else{
      return '${CustomStamp_str(timestamp: timeStamp, date: 'YY/MM/DD hh:mm', toInt: false)}';
    }
  }

  // 时间戳转时间
  static String CustomStamp_str({
    int? timestamp,             // 为空则显示当前时间
    String? date,               // 显示格式，比如：'YY年MM月DD日 hh:mm:ss'
    bool toInt = true,         // 去除0开头
  }){
    if(timestamp == null){
      timestamp = (new DateTime.now().millisecondsSinceEpoch / 1000).round();
    }
    String Time_str = (DateTime.fromMillisecondsSinceEpoch(timestamp * 1000)).toString();

    dynamic Date_arr = Time_str.split(' ')[0];
    dynamic Time_arr = Time_str.split(' ')[1];

    String YY = Date_arr.split('-')[0];
    String MM = Date_arr.split('-')[1];
    String DD = Date_arr.split('-')[2];

    String hh = Time_arr.split(':')[0];
    String mm = Time_arr.split(':')[1];
    String ss = Time_arr.split(':')[2];

    ss = ss.split('.')[0];

    // 去除0开头
    if(toInt){
      MM = (int.parse(MM)).toString();
      DD = (int.parse(DD)).toString();
      hh = (int.parse(hh)).toString();
      mm = (int.parse(mm)).toString();
    }

    if(date == null){
      return Time_str;
    }

    date = date.replaceAll('YY', YY)
        .replaceAll('MM', MM)
        .replaceAll('DD', DD)
        .replaceAll('hh', hh)
        .replaceAll('mm', mm)
        .replaceAll('ss', ss);

    return date;
  }


}
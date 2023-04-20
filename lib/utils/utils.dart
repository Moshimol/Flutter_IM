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
}

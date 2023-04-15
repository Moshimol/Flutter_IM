
import 'package:flutter_easyloading/flutter_easyloading.dart';

final Duration durationTime =  Duration(milliseconds: 350);

// 在本项目中 默认的背景是黑色的 不可以点击
class LBLoading {
  static showSuccess(String statue) {
    EasyLoading.showSuccess(statue,maskType: EasyLoadingMaskType.black,duration: durationTime);
  }

  static showError(String statue) {
    EasyLoading.showError(statue,maskType: EasyLoadingMaskType.black,duration: durationTime);
  }
}
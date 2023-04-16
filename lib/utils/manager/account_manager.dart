import 'package:flutter/material.dart';
import 'package:flutter_im/request/request/request.dart';
import 'package:flutter_im/utils/utils.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';


import '../../pages/login/login_page.dart';
import '../../request/config.dart';

// 账号管理类  用户管理账号登录和退出相关
class AccountManager {
  static loginAction() {

  }

  static logOutAction(BuildContext context) {
    // 清除相关账号信息
    showOkCancelAlertDialog(
      context: context,
      title: '是否确认退出？',
      cancelLabel:"取消",
      okLabel: "退出",
      barrierDismissible: false,
    ).then((value) {
      if (value == OkCancelResult.ok) {
        // 网路请求变为原来的网络请求
        cleanAccount();
        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=>new LoginPage()), (Route<dynamic> rout)=>false);
      }
    });
  }

  // 退出所有的处理方式
  static cleanAccount(){
    API().requestHost = "";
    Request().reloadNetBaseUrl();
    StorageShared().removeStorage("LoginState");
  }
}

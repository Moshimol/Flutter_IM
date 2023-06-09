import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/constant/cache_key.dart';
import 'package:flutter_im/request/request/request.dart';
import 'package:flutter_im/utils/utils.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

import '../../pages/login/login_page.dart';
import '../../request/config.dart';

const String AppType = "carrot_im";

// 账号管理类  用户管理账号登录和退出相关
class AccountManager {
  static loginAction() {}

  static logOutAction(BuildContext context) {
    // 清除相关账号信息
    showOkCancelAlertDialog(
      context: context,
      title: '是否确认退出？',
      cancelLabel: "取消",
      okLabel: "退出",
      barrierDismissible: false,
    ).then((value) {
      if (value == OkCancelResult.ok) {
        // 网路请求变为原来的网络请求
        cleanAccount();
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => new LoginPage()),
            (Route<dynamic> rout) => false);
      }
    });
  }

  // 退出所有的处理方式
  static cleanAccount() {
    API.requestHost = "";
    Request().reloadNetBaseUrl();
    Request().removeAllHeader();
    StorageShared().removeStorage(CacheKey.loginState);
  }

  // 根据account_id 去登陆
  static loginByAccountId(String accountId, String token, String subKey,
      Map<String, dynamic> other) async {

    var res = await Request().post(Login.LoginByAccount,
        data: {"app_type": AppType, "account_id": accountId, "flag": 1},);

    return res;
  }

  // 清除图标
  static clearBadge() async {
    var res = Request().post(Login.CleanBadge);
    return res;
  }

  // 清除


  // 获取用户信息

  static getUserInfoByChatId(String chatId) async {
    var res = await Request().post(UserInfo.GetUserInfo,data: {"chat_id":chatId});
    return res;
  }
}
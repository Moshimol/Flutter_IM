import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_im/pages/other/root_page.dart';
import 'package:flutter_im/utils/manager/account_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../request/config.dart';
import '../../request/request/request.dart';
import '../../utils/global/global_params.dart';
import '../../utils/manager/request_manager.dart';
import '../../utils/module_model/user/user_data.dart';
import '../../utils/storage/storage_shared.dart';
import '../../constant/cache_key.dart';

// 模型
import 'package:flutter_im/utils/module_model/login/search_login_data.dart';
import 'package:flutter_im/widgets/loading/lb_loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  List<search_login_data> orgList = [];
  TextStyle labelStyle = TextStyle(color: Color(0xff333333), fontSize: 17);

  late search_login_data currentInfo;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController orgController = TextEditingController();

  bool showSearchOrg = false;
  bool isCanLogin = true;

  @override
  Widget build(BuildContext context) {
    void getOrgList(String orgName) async {
      List<search_login_data> requestOrgList = [];

      var response = await Request().post(Login.SEARCH_ORG,
          data: {"name": orgName, "page": 1, "page_size": 10000},
          options: Options(headers: {
            "RequestStack": json.encode(API.REQUEST_STACK),
            "content-type": Headers.formUrlEncodedContentType
          }));

      if (response["state"] != 1) {
        return;
      }

      List<dynamic> orgInfoList = response["data"]["items"];
      for (var orgItem in orgInfoList) {
        requestOrgList.add(search_login_data.fromJson(orgItem));
      }

      setState(() {
        this.showSearchOrg = requestOrgList.length > 0;
        this.orgList = requestOrgList;
      });
    }

    // 进行登录
    Future<void> login() async {
      if (phoneController.text.length == 0) {
        Fluttertoast.showToast(msg: "手机号输入为空", gravity: ToastGravity.CENTER);
      } else if (passwordController.text.length == 0) {
        Fluttertoast.showToast(msg: "密码输入为空", gravity: ToastGravity.CENTER);
      } else if (orgController.text.length == 0) {
        Fluttertoast.showToast(msg: "请选择机构", gravity: ToastGravity.CENTER);
      } else {
        // 1、判断当前所选机构是不是对应的机构 且结构信息完整
        // 1、执行登录操作 跳转到首页
        // 2、存储数据
        if (currentInfo.deployInfo != null) {
          LBLoading.show();

          Dio dio = new Dio();
          FormData formData = FormData.fromMap({
            "username": phoneController.text,
            "password": passwordController.text,
            "platform": "ios",
          });

          // 先设置HOST
          var deployInfoDic = json.decode(currentInfo.deployInfo!);

          String hostApi = "https://" + deployInfoDic["backend_host"];

          StorageShared().setStorage(CacheKey.host, hostApi);

          Map<String, dynamic> appInfoMap = {
            "appid": deployInfoDic["deploy_appid"],
            "appkey": deployInfoDic["deploy_appkey"],
            "channel": deployInfoDic["deploy_channel"],
          };

          String reStack = json.encode([appInfoMap]);

          Response response = await dio.post(hostApi + Login.LoginApi,
              data: formData,
              options: Options(headers: {"RequestStack": reStack}));

          LBLoading.dissMiss();

          var res = response.data["data"];

          if (response.data["state"] != 1) {
            Fluttertoast.showToast(
                msg: response.data["msg"], gravity: ToastGravity.CENTER);
          } else {
            API.requestHost = hostApi;
            // 设置请求的Host
            Request().reloadNetBaseUrl();
            // 设置Header
            RequestManager.setUserHeader(
                res["token"], res["sub_org_key"], appInfoMap);

            var accountRes = await AccountManager.loginByAccountId(
                res["accountId"], res["token"], res["sub_org_key"], appInfoMap);

            if (accountRes["state"] != 1) {
              Fluttertoast.showToast(
                  msg: accountRes["msg"], gravity: ToastGravity.CENTER);
            } else {
              // 存储用户信息
              print("记录信息");
              print(accountRes);
              StorageShared().setStorage(CacheKey.loginState, "LoginState");
              StorageShared()
                  .setStorage(CacheKey.accountId, accountRes["data"]["account_id"]);
              StorageShared()
                  .setStorage(CacheKey.chatId, accountRes["data"]["chat_id"]);
              StorageShared().setStorage(
                  CacheKey.appUserInfo(accountRes["data"]["account_id"]),
                  accountRes["data"]);

              GlobalParams().accountId = accountRes["data"]["account_id"];
              GlobalParams().currentUser = UserData.fromJson(accountRes["data"]);

              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (context) {
                return RootPage();
              }), (router) => false);
            }
          }
        } else {
          Fluttertoast.showToast(msg: "选择机构错误", gravity: ToastGravity.CENTER);
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(height: 138),
            Container(
              child: Text(
                "手机号登录",
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 27,
                    fontWeight: FontWeight.w200),
              ),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              color: Color(0xffD8D8D8),
              height: 0.5,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("手机号", style: labelStyle),
                SizedBox(width: 20),
                Expanded(
                    child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                  cursorColor: Color(0xff108EE9),
                  cursorWidth: 2,
                  decoration: InputDecoration(
                      hintText: "请输入手机号",
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xffD8D8D8))),
                ))
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              color: Color(0xffD8D8D8),
              height: 0.5,
            ),
            Row(
              children: [
                Text("密码", style: labelStyle),
                SizedBox(width: 36),
                Expanded(
                    child: TextField(
                  obscureText: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                        RegExp('[a-zA-Z0-9!@#\$%^&*(),.?":{}|<>]'))
                  ],
                  controller: passwordController,
                  onChanged: (value) {},
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Color(0xff108EE9),
                  cursorWidth: 2,
                  decoration: InputDecoration(
                      hintText: "请输入密码",
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xffD8D8D8))),
                ))
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              color: Color(0xffD8D8D8),
              height: 0.5,
            ),
            SizedBox(height: 10),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("选择机构", style: labelStyle),
                      SizedBox(width: 36),
                      Expanded(
                          child: TextField(
                        controller: orgController,
                        onChanged: (value) {
                          if (value.length >= 1) {
                            getOrgList(value);
                          } else {
                            setState(() {
                              this.showSearchOrg = false;
                              this.orgList = [];
                            });
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Color(0xff108EE9),
                        cursorWidth: 2,
                        decoration: InputDecoration(
                            hintText: "请输入机构名",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 16, color: Color(0xffD8D8D8))),
                      ))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    color: Color(0xffD8D8D8),
                    height: 0.5,
                  ),
                  Visibility(
                    child: Container(
                      constraints: BoxConstraints(maxHeight: 120),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // 点击之后然后进行赋值
                                  this.orgController.text =
                                      this.orgList[index].name!;
                                  this.currentInfo = this.orgList[index];
                                  this.showSearchOrg = false;
                                  this.orgList = [];
                                  orgController.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: orgController.text.length));
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 100),
                                alignment: Alignment.centerLeft,
                                height: 40,
                                child: Text(
                                  orgList[index].name!,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            );
                          },
                          itemCount: orgList.length,
                          shrinkWrap: true),
                    ),
                    visible: showSearchOrg,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                login();
              },
              child: Container(
                height: 47,
                decoration: BoxDecoration(
                    color: isCanLogin
                        ? Color(0xff108EE9)
                        : Color(0xff108EE9).withAlpha(100),
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                alignment: Alignment.center,
                child: Text("登录",
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_im/pages/other/root_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../request/config.dart';
import '../../request/request/request.dart';
import '../../utils/storage/storage_shared.dart';

// 模型
import 'package:flutter_im/utils/module_model/login/search_login_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  List<search_login_data> orgList = [];
  TextStyle labelStyle = TextStyle(color: Color(0xff333333), fontSize: 17);

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController orgController = TextEditingController();

  bool showSearchOrg = false;

  Widget build(BuildContext context) {
    String _orgName = "";
    bool isCanLogin = true;

    @override
    void initState() {
      super.initState();
    }

    void getOrgList(String orgName) async {
      List<search_login_data> requestOrgList = [];

      var response = await Request().post(Login.SEARCH_ORG, data: FormData.fromMap({"name": orgName}));
      Request().setHeader({"RequestStack": json.encode(API.REQUEST_STACK)});


      List<dynamic> orgInfoList = response["data"]["items"];


      print(orgInfoList.runtimeType);

      if (response["state"] != 1) {
        return;
      }
      
      print("11111111");
      print(orgInfoList.length);
      
      for (var orgItem in orgInfoList) {
        requestOrgList.add(search_login_data.fromJson(orgItem));
      }

      print("22222222");
      print(requestOrgList.length);

      setState(() {
        this.showSearchOrg = requestOrgList.length > 0;
        this.orgList = requestOrgList;
      });
    }

    // 进行登录
    void login() {
      if (phoneController.text.length == 0) {
        Fluttertoast.showToast(msg: "手机号输入为空", gravity: ToastGravity.CENTER);
      } else if (passwordController.text.length == 0) {
        Fluttertoast.showToast(msg: "密码输入为空", gravity: ToastGravity.CENTER);
      } else if (orgController.text.length == 0) {
        Fluttertoast.showToast(msg: "请选择机构", gravity: ToastGravity.CENTER);
      } else {
        // 执行登录操作 跳转到首页
        // 存储数据
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) {
              return RootPage();
            }), (router) => false);
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
                  Visibility(child: Container(
                    constraints: BoxConstraints(maxHeight: 120),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                // 点击之后然后进行赋值
                                this.orgController.text = this.orgList[index].name!;
                                this.showSearchOrg = false;
                                this.orgList = [];
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 100),
                              alignment: Alignment.centerLeft,
                              height: 40,
                              child: Text(orgList[index].name!,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),),
                            ),
                          );
                        },
                        itemCount: orgList.length,
                        shrinkWrap: true),
                  ), visible: showSearchOrg,),

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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_im/pages/other/root_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/storage/storage_shared.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState()=> new _LoginPage();
}

class _LoginPage extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {

    TextStyle labelStyle = TextStyle(color: Color(0xff333333),fontSize: 17);
    bool isCanLogin = true;

    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    @override
    void initState() {
      super.initState();
    }

    // 进行登录
    void login(){
      if (phoneController.text.length == 0) {
        Fluttertoast.showToast(msg:"手机号输入为空",gravity: ToastGravity.CENTER);
      } else if (passwordController.text.length == 0) {
        Fluttertoast.showToast(msg:"密码输入为空",gravity: ToastGravity.CENTER);
      } else {
        // 执行登录操作 跳转到首页
        // 存储数据
        StorageShared.setString("login");
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context){
              return RootPage();
            }),(router)=>false
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
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
                    fontWeight: FontWeight.w200
                ),),
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
                Text("手机号",style: labelStyle),
                SizedBox(width: 20),
                Expanded(child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  onChanged: (value){

                  },
                  cursorColor: Color(0xff108EE9),
                  cursorWidth: 2,
                  decoration: InputDecoration(
                      hintText: "请输入手机号",
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 16,color: Color(0xffD8D8D8))
                  ),
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
                Text("密码",style: labelStyle),
                SizedBox(width: 36),
                Expanded(child: TextField(
                  controller: passwordController,
                  onChanged: (value){

                  },
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Color(0xff108EE9),
                  cursorWidth: 2,
                  decoration: InputDecoration(
                      hintText: "请输入密码",
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 16,color: Color(0xffD8D8D8))
                  ),
                ))
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              color: Color(0xffD8D8D8),
              height: 0.5,
            ),
            SizedBox(height: 60),
            GestureDetector(
              onTap: (){
                login();
              },
              child: Container(
                height: 47,
                decoration: BoxDecoration(
                    color: isCanLogin ? Color(0xff108EE9) : Color(0xff108EE9).withAlpha(100),
                    borderRadius: BorderRadius.all(Radius.circular(2))
                ),
                alignment: Alignment.center,
                child: Text("登录",style: TextStyle(fontSize: 18.0,color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );

  }
}

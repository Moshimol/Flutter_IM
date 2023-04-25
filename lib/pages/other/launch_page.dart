import 'package:flutter/material.dart';
import 'package:flutter_im/pages/login/login_page.dart';
import 'package:flutter_im/pages/other/root_page.dart';
import 'package:flutter_im/request/request/request.dart';
import 'dart:async';
import 'package:flutter_im/utils/storage/storage_shared.dart';

import '../../constant/cache_key.dart';
import '../../request/config.dart';
import '../../utils/global/global_params.dart';

// 一个容器的组件
class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  _LaunchPage createState() => new _LaunchPage();
}

class _LaunchPage extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
    //开启倒计时
    countDown();
  }

  // 倒计时
  void countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration, newHomePage);
  }

  void newHomePage() {
    // 判断是不是已经登陆
    StorageShared()
        .getStorage(CacheKey.loginState)
        .then((value) => {jumpRouter(value == null)});
  }

  void jumpRouter(bool isNotLogin) {
    if (isNotLogin) {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new LoginPage()),
          (Route<dynamic> rout) => false);
    } else {
      GlobalParams();
      // 如果已经登录的话 再设置Host
      StorageShared().getStorage(CacheKey.host).then((value) {
        API.requestHost = value;
        Request().reloadNetBaseUrl();
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => new RootPage()),
                (Route<dynamic> rout) => false);
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/applanuch.png"),
                  fit: BoxFit.fitWidth),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.fromLTRB(0.0, 45.0, 10, 0.0),
            child: Container(
              width: 60,
              height: 30,
              child: OutlinedButton(
                child: Text("跳过",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 12)),
                onPressed: () {
                  newHomePage();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

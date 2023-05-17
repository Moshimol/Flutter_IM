import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_im/pages/other/launch_page.dart';
import 'package:flutter_im/request/config.dart';
import 'package:flutter_im/request/request/request.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_im/utils/routers/router.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Request().init();
  API().init();
  // 初始化
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: AppRouter.showDebug,
      initialRoute: AppRouter.appInitialRoute,
      getPages: AppRouter.appRouter,
      unknownRoute: AppRouter.unKnowRoute,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: LaunchPage(),
      navigatorKey: navigatorKey,
      builder: EasyLoading.init(),
    );
  }
}

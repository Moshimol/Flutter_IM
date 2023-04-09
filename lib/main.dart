import 'package:flutter/material.dart';
import 'package:flutter_im/pages/other/launch_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //final double ScreenWidth =  (MediaQuery.of(context).size.width);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: LaunchPage(),
      navigatorKey: navigatorKey,
    );
  }
}

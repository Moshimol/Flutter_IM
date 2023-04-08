import 'package:flutter/material.dart';
import 'package:flutter_im/pages/other/launch_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LaunchPage(),
    );
  }
}

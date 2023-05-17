import 'package:flutter/material.dart';

import '../../widgets/appbar/back_appbar.dart';

class WidgetNotFound extends StatefulWidget {
  const WidgetNotFound({Key? key}) : super(key: key);

  @override
  State<WidgetNotFound> createState() => _WidgetNotFoundState();
}

class _WidgetNotFoundState extends State<WidgetNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "页面不存在",
      ),
      body: Center(
        child: Text("页面不存在"),
      ),
    );
  }
}
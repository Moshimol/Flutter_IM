import 'package:flutter/material.dart';
import '../../widgets/appbar/main_appbar.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
            titleName: "我",
            onClickTap: () {
              print("我");
            })
    );
  }
}

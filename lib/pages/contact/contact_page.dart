import 'package:flutter/material.dart';
import 'package:flutter_im/widgets/appbar/main_appbar.dart';

class ContaCtPage extends StatefulWidget {
  const ContaCtPage({Key? key}) : super(key: key);

  @override
  State<ContaCtPage> createState() => _ContaCtPageState();
}

class _ContaCtPageState extends State<ContaCtPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
            rightIconName: "assets/images/message_add.png",
            titleName: "通讯录",
            onClickTap: () {
              print("通讯录");
            })
    );
  }
}

import 'package:flutter/material.dart';
import '../../widgets/appbar/back_appbar.dart';

class AboutImPage extends StatefulWidget {
  const AboutImPage({Key? key}) : super(key: key);

  @override
  State<AboutImPage> createState() => _AboutImPageState();
}

class _AboutImPageState extends State<AboutImPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BackBar(
        titleName: "关于IM",
    ));
  }
}

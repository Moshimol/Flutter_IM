import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar/back_appbar.dart';

class MeInfoPage extends StatefulWidget {
  const MeInfoPage({Key? key}) : super(key: key);

  @override
  State<MeInfoPage> createState() => _MeInfoPageState();
}

class _MeInfoPageState extends State<MeInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "个人信息",
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}

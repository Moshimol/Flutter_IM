import 'package:flutter/material.dart';

import '../../../widgets/appbar/back_appbar.dart';

class MomentPage extends StatefulWidget {
  const MomentPage({Key? key}) : super(key: key);

  @override
  State<MomentPage> createState() => _MomentPageState();
}

class _MomentPageState extends State<MomentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "工作圈",
      ),
      body: Column(
        children: [Text("朋友圈")],
      ),
    );
  }
}

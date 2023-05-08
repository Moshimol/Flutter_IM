import 'package:flutter/material.dart';

import '../../../widgets/appbar/back_appbar.dart';
import 'create_moment_page.dart';

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
        children: [
          Container(
            color: Colors.amber,
            width: 200,
            height: 80,
            child: InkWell(
              onTap: () {
                // 发布朋友圈
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateMomentPage()),
                );
              },
              child: Text("选取相册"),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_im/main.dart';
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
      appBar: AppBar(
        title: Text(
          "朋友圈",
          style: TextStyle(
              color: Color(0xff333333),
              fontSize: 18,
              fontWeight: FontWeight.w300),
        ),
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.of(navigatorKey.currentState!.context).pop();
            },
            child: UnconstrainedBox(
              child: Image.asset(
                "assets/images/left_arrow_back.png",
                width: 11,
                height: 18,
              ),
            ),
          ),
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Image.asset(
                  "assets/images/moment_photo.png",
                  width: 21,
                  height: 21,
                ),
              ),
              // 点击和长按的处理方式不一样
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateMomentPage(type: PostMomentType.momentImage),fullscreenDialog: true),
                );
              },
              onLongPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateMomentPage(type: PostMomentType.momentText),fullscreenDialog: true),
                );
              },
            );
          })
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            width: 200,
            height: 80,
          )
        ],
      ),
    );
  }
}

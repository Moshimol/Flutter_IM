import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Image.asset(
                'assets/images/message_add.png',
                width: 21,
                height: 21,
              ),
            ),
            onTap: () {
              print("add org");
            },
          ),
        ],
        backgroundColor: Color(0xFFF5F5F5),
        title: Text(
          "消息",
          style: TextStyle(
              color: Color(0xff333333),
              fontSize: 18,
              fontWeight: FontWeight.w200),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFF5F5F5),
            width: double.infinity,
            height: 46,
            padding: EdgeInsets.only(left: 8,right: 8,bottom: 12),
            child: Container(
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Image.asset(
                    "assets/images/search_black.webp",
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(width: 10),
                  Text("搜索",style: TextStyle(fontSize: 12,color: Color(0xFF999999))),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
          )
        ],
      ),
    );
  }
}

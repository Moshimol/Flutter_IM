import 'package:flutter/material.dart';
import 'package:flutter_im/widgets/appbar/main_appbar.dart';

class ContaCtPage extends StatefulWidget {
  const ContaCtPage({Key? key}) : super(key: key);

  @override
  State<ContaCtPage> createState() => _ContaCtPageState();
}

class _ContaCtPageState extends State<ContaCtPage> {
  final double height = 36;

  List<List<String>> topItems = [
    ["新的朋友", "new"],
    ["群聊", "group"],
    ["标签", "tag"],
    ["公众号", "message"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
          titleName: "通讯录",
          onClickTap: (context) {
            print("通讯录");
          }),
      body: Column(
        children: [
          Container(
            color: Color(0xFFF5F5F5),
            width: double.infinity,
            height: 46,
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 12),
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
                  Text("搜索",
                      style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Column(
                children: topItems.map((e) {
                  bool needBorder = e != topItems.last;
                  return Row(
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            "assets/images/contact_${e[1]}.png",
                            width: height,
                            height: height,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Container(
                        height: 54,
                        child: Text(e[0],
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF333333))),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: needBorder
                                    ? Color(0xffEEEEEE)
                                    : Colors.transparent),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ))
                    ],
                  );
                }).toList(),
              )
            ],
          ))
        ],
      ),
    );
  }
}

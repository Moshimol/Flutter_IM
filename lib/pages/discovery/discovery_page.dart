import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar/main_appbar.dart';

class DisPage extends StatefulWidget {
  const DisPage({Key? key}) : super(key: key);

  @override
  State<DisPage> createState() => _DisPageState();
}

class _DisPageState extends State<DisPage> {
  List<Map<String, String>> disList = [
    {"icon": "moment", "name": "工作圈"},
    {"icon": "sao", "name": "扫一扫"},
    {"icon": "metting", "name": "会议"},
    {"icon": "mark", "name": "市场"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          titleName: "办公",
          onClickTap: (context) {
            print("办公");
          }),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return SingleColumn(
                    singleMap: disList[index],
                    shouBottom: index > 0,
                  );
                },
                itemCount: disList.length),
          )
        ],
      ),
    );
  }
}

class SingleColumn extends StatelessWidget {
  final Map<String, String> singleMap;
  final bool shouBottom;

  const SingleColumn(
      {required this.singleMap, required this.shouBottom, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: shouBottom ? 56 : 46,
      child: Column(
        children: [
          Visibility(
              child: Container(
                color: Color(0xFFF5F5F5),
                height: 10,
              ),
              visible: shouBottom),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, top: 8, bottom: 6, right: 16),
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/images/dis_${singleMap["icon"]!}.png",
                  width: 22,
                  height: 22,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 46,
                child: Text(
                  singleMap["name"]!,
                  style: TextStyle(fontSize: 17, color: Color(0xFF333333)),
                ),
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 16),
                child: Image.asset(
                  "assets/images/dis_arrow.png",
                  width: 8,
                  height: 12.5,
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}

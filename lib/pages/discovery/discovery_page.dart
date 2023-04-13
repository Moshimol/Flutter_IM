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
    {"icon": "", "name": "工作圈"},
    {"icon": "", "name": "扫一扫"},
    {"icon": "", "name": "会议"},
    {"icon": "", "name": "市场"},
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
        children: disList.map((e) {
          return SingleColumn(
            singleMap: e,
          );
        }).toList(),
      ),
    );
  }
}

class SingleColumn extends StatelessWidget {
  final Map<String, String> singleMap;

  const SingleColumn({required this.singleMap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 56,
      child: Column(
        children: [
          Container(
            color: Color(0xFFF5F5F5),
            height: 10,
          ),
          Row(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 16, top: 12, bottom: 6, right: 16),
                alignment: Alignment.centerLeft,
                child: CachedNetworkImage(
                  imageUrl: "http://via.placeholder.com/440x440",
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
            ],
          )
        ],
      ),
    );
  }
}

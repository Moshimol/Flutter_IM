import 'package:flutter/material.dart';
import 'package:flutter_im/widgets/appbar/main_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../request/request/request.dart';
import '../../utils/storage/storage_shared.dart';
import '../../widgets/doalog/more_doalog.dart';
import 'package:flutter_im/request/config.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> mockData = ["小五", "买买买", "中台设计群", "办公团队"];
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
          rightIconName: "assets/images/message_add.png",
          titleName: "消息",
          onClickTap: (clickContext) {
            moreDialog(clickContext);
            String loginString = StorageShared.getString("login") ?? "";
            if (loginString.length > 0) {
              print("The string is not empty.");
            } else {
              print("The string is empty.");
            }

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
              child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  // 点击跳转到新的页面
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 16, top: 16, bottom: 16, right: 18),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: CachedNetworkImage(
                          imageUrl: "http://via.placeholder.com/440x440",
                          width: 44,
                          height: 44,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 71,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(mockData[index],
                                          style: TextStyle(
                                            color: Color(0xFF333333),
                                            fontSize: 17,
                                          ))),
                                  Container(
                                    padding: EdgeInsets.only(right: 16),
                                    child: Text("昨天15:20",
                                        style: TextStyle(
                                          color: Color(0xFFCCCCCC),
                                          fontSize: 12,
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7.5,
                              ),
                              Text("聊天记录",
                                  style: TextStyle(
                                      color: Color(0xFF999999), fontSize: 14))
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFEEEEEE),
                                  ))),
                        ))
                  ],
                ),
              );
            },
            itemCount: mockData.length,
          ))
        ],
      ),
    );
  }
}

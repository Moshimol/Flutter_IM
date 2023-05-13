import 'dart:convert';

import 'package:flutter_im/utils/manager/account_manager.dart';
import 'package:flutter_im/utils/module_model/message/message_single.dart';
import 'package:flutter_im/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/manager/message_manager.dart';
import 'message_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_im/widgets/appbar/main_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../widgets/doalog/more_doalog.dart';

// 默认的显示方式
Widget defaultWidget = Container();

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<MessageSingle>>? _messageList;

  @override
  void initState() {
    super.initState();
    AccountManager.clearBadge();
    // 获取当前的列表
    _messageList = _getMessageListFuture();
  }

  Future<List<MessageSingle>> _getMessageListFuture() async {
    final value = await MessageManager.getMessageList();
    if (value["state"] != 1) {
      // Data fetching failed.
      throw Exception('Failed to load message list.');
    }

    List responseJson = value["data"];
    List<MessageSingle> msgList = responseJson.map((m) => new MessageSingle.fromJson(m)).toList();
    return msgList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
          rightIconName: "assets/images/message_add.png",
          titleName: "消息",
          onClickTap: (clickContext) {
            moreDialog(clickContext);
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
              child: FutureBuilder<List<MessageSingle>>(
                  future: _messageList,
                  builder: (BuildContext context, AsyncSnapshot<List<MessageSingle>> snapshot) {
                    print(context);
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text("none");
                      case ConnectionState.waiting:
                        return defaultWidget;
                      default:
                        List<MessageSingle> data = snapshot.data ?? [];
                        defaultWidget = ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            MessageSingle msg = data[index];
                            var singleData = jsonDecode(msg.msg!);
                            return GestureDetector(
                              onTap: () {
                                // 点击跳转到新的页面 MessageDetails()
                                Get.to(MessageDetails(singleData: msg,title: HomePageUtils.getName(singleData!, msg),));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 16, top: 16, bottom: 16, right: 18),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(2),
                                      child: msg.chatType == 2
                                          ? Image.asset(
                                        "assets/images/group_avatar.png",
                                        width: 44,
                                        height: 44,
                                      )
                                          : CachedNetworkImage(
                                        imageUrl: HomePageUtils.getAvatar(msg),
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
                                                    child: Text(
                                                        HomePageUtils.getName(singleData!, msg),
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            color: Color(0xFF333333),
                                                            fontSize: 17,
                                                            overflow: TextOverflow.ellipsis))),
                                                Container(
                                                  padding: EdgeInsets.only(right: 16),
                                                  child:
                                                  Text(Utils.getTimeDifference(msg.created!),
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
                                            Text(Utils.getMsgType(singleData),
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
                          itemCount: data.length,
                        );
                        return defaultWidget;
                    }
                  }
              ),
                // future and builder properties
          )
        ],
      ),
    );
  }
}

class HomePageUtils {
  static String getName(Map<String, dynamic> msg, MessageSingle data) {
    String msgName = "1";
    if (data.chatType == 1) {
      msgName = data.userInfo!.nickname!;
    } else {
      msgName = data.groupInfo!.name!;
    }
    return msgName;
  }

  static String getAvatar(MessageSingle data) {
    String iconUlr = "";
    if (data.chatType == 1) {
      iconUlr = data.userInfo!.avatar!;
    }
    return iconUlr;
  }
}
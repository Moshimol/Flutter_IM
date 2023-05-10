import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/module_model/message/message_single.dart';
import '../../widgets/appbar/back_appbar.dart';
import '../../widgets/custom/category.dart';
import '../../widgets/custom/space.dart';

enum MessageInfoType { user, group }

class MessageInfo extends StatefulWidget {
  const MessageInfo(
      {Key? key,
      required this.titleString,
      required this.messageType,
      this.singleData})
      : super(key: key);

  final String titleString;

  final MessageInfoType messageType;

  final MessageSingle? singleData;

  @override
  State<MessageInfo> createState() => _MessageInfoState();
}

class _MessageInfoState extends State<MessageInfo> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: BackBar(titleName: widget.titleString),
      body: widget.messageType == MessageInfoType.user
          ? _mainUserView()
          : _mainGroupView(),
    );
  }

  // request
  // view
  Widget _mainGroupView() {
    return Container(
      color: Colors.red,
      height: 10,
    );
  }

  Widget _mainUserView() {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: CachedNetworkImage(
                            imageUrl: widget.singleData!.userInfo!.avatar!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SpaceVerticalWidget(
                          space: 5,
                        ),
                        Text(
                          "${widget.singleData!.userInfo!.nickname}",
                          style:
                          TextStyle(color: Color(0xff333333), fontSize: 12),
                        )
                      ],
                    ),
                    SpaceHorizontalWidget(
                      space: 16,
                    ),
                    InkWell(
                      onTap: () {
                        print("object");
                      },
                      child: LocalIconWidget(
                        iconName: "message_add_user",
                        iconSize: 50,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 8,
              color: Color(0xFFF5F5F5),
            ),
          ],
        ),
        _singleItemView(
            children: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeTrackColor: Colors.blueAccent,
              activeColor: Colors.white,
            ),
            leftText: "置顶聊天",
            showBottomLine: true),
        _singleItemView(
            children: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeTrackColor: Colors.blueAccent,
              activeColor: Colors.white,
            ),
            leftText: "消息免打扰",
            showBottomLine: false),
        Container(
          height: 8,
          color: Color(0xFFF5F5F5),
        ),
        _singleItemView(
            children: Icon(Icons.arrow_forward_ios,size: 15,color: Color(0xffCCCCCC),),
            leftText: "查找聊天记录",
            showBottomLine: true),
        _singleItemView(
          children: Container(),
            leftText: "清空聊天记录",
            showBottomLine: false)
      ],
    );
  }

  Widget _singleItemView(
      {Widget? children,
      required String leftText,
      required bool showBottomLine}) {
    return Container(
      color: Colors.white,
      height: 50,
      child: Column(
        children: [
          Container(
            height: 49.5,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      leftText,
                      style: TextStyle(fontSize: 17, color: Color(0xFF333333)),
                    ),
                    Spacer(),
                    children!,
                  ],
                )),
          ),
          Visibility(
            child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Divider(
                  height: 0.5,
                )),
            visible: showBottomLine,
          )
        ],
      ),
    );
  }
}

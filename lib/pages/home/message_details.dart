import 'package:flutter/material.dart';

import '../../widgets/appbar/back_appbar.dart';
import '../../widgets/custom/category.dart';

class MessageDetails extends StatefulWidget {
  const MessageDetails({Key? key}) : super(key: key);

  @override
  State<MessageDetails> createState() => _MessageDetailsState();
}

class _MessageDetailsState extends State<MessageDetails> {
  TextEditingController sendTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "聊天框",
      ),
      body: _mainView(),
    );
  }

  // request

  // Widget
  Widget _mainView() {
    return Column(
      children: [
        // 顶部聊天界面
        _mainChatView(),
        // 下面按钮 更多详情等
        _bottomSendVie()
      ],
    );
  }

  Widget _mainChatView() {
    return Expanded(child: Container());
  }

  Widget _bottomSendVie() {
    return Container(
      color: Color(0xffF5F5F5),
      height: 50,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            LocalIconWidget(
              iconName: "chat_voice",
              iconSize: 26,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.white),
                child: TextField(
                  textAlignVertical: TextAlignVertical.top,
                  controller: sendTextController,
                  onChanged: (value) {
                    print(value);
                  },
                  cursorColor: Colors.black26,
                  decoration: InputDecoration(
                      hintText: "说点什么吧...",
                      border: InputBorder.none,
                      hintStyle:
                          TextStyle(fontSize: 15, color: Color(0xffD8D8D8))),
                ),
              ),
            )),
            SizedBox(
              width: 10,
            ),
            LocalIconWidget(
              iconName: "chat_smile",
              iconSize: 26,
            ),
            SizedBox(
              width: 10,
            ),
            LocalIconWidget(
              iconName: "chat_add",
              iconSize: 26,
            ),
          ],
        ),
      ),
    );
  }
}

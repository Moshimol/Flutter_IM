import 'package:flutter/material.dart';

import '../../utils/module_model/message/message_single.dart';
import '../../widgets/appbar/back_appbar.dart';
import '../../widgets/custom/category.dart';
import 'message_info.dart';

class MessageDetails extends StatefulWidget {
  const MessageDetails({Key? key,required this.singleData, this.title}) : super(key: key);

  final MessageSingle singleData;
  final String? title;
  @override
  State<MessageDetails> createState() => _MessageDetailsState();
}

class _MessageDetailsState extends State<MessageDetails> {
  TextEditingController sendTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: widget.title,
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: InkWell(
                  onTap: (){
                    // 跳转到更多的页面 分为群聊和单聊
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MessageInfo(),));
                  },
                  child: Icon(Icons.more_horiz_rounded,color: Colors.black,),
                ),
              ),
              onTap: () {
                // 清空信息
              },
            );
          }),
        ],
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

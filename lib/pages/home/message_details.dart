import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/manager/message_manager.dart';
import '../../utils/module_model/message/chat_message_info.dart';
import '../../utils/module_model/message/message_single.dart';
import '../../utils/utils.dart';
import '../../widgets/appbar/back_appbar.dart';
import '../../widgets/custom/category.dart';
import '../../widgets/message/send_message_widget.dart';
import 'message_info.dart';

// 默认的显示方式
Widget defaultWidget = Container();

class MessageDetails extends StatefulWidget {
  const MessageDetails({Key? key, required this.singleData, this.title})
      : super(key: key);

  final MessageSingle singleData;
  final String? title;

  @override
  State<MessageDetails> createState() => _MessageDetailsState();
}

class _MessageDetailsState extends State<MessageDetails> {
  // 消息的列表
  List<ChatMessageInfo> _messageList = [];

  TextEditingController sendTextController = TextEditingController();
  FocusNode _textFocusNode = FocusNode();
  int _textBaseOffset = 0;

  // 默认的配置处理
  bool _isVoice = false;
  bool _isMore = false;
  double keyBoardHeight = 270.0;


  ScrollController? chatController = ScrollController();

  @override
  void initState() {
    super.initState();
    _requestMessageInfo();
  }

  @override
  Widget build(BuildContext context) {
    if (keyBoardHeight == 270.0 &&
        MediaQuery.of(context).viewInsets.bottom != 0) {
      keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
    }
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: BackBar(
        color : Colors.white,
        titleName: widget.title,
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: InkWell(
                  onTap: () {
                    // 跳转到更多的页面 分为群聊和单聊
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MessageInfo(
                        titleString: widget.singleData.chatType == 1
                            ? "聊天信息"
                            : widget.title!,
                        messageType: widget.singleData.chatType == 1
                            ? MessageInfoType.user
                            : MessageInfoType.group,
                        singleData: widget.singleData,
                      ),
                    ));
                  },
                  child: Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.black,
                  ),
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
    return _buildChatBody();
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
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.white),
                constraints: BoxConstraints(minHeight: 40.0, maxHeight: 150.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    focusNode: _textFocusNode,
                    textAlignVertical: TextAlignVertical.top,
                    controller: sendTextController,
                    onChanged: (value) {
                      setState(() {
                        _textBaseOffset =
                            sendTextController.selection.baseOffset;
                      });
                    },
                    cursorColor: Colors.black26,
                    decoration: InputDecoration(
                        hintText: "说点什么吧...",
                        isDense: true,
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(fontSize: 15, color: Color(0xffD8D8D8))),
                  ),
                ),
              ),
            )),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                _scrollMessageBottom();
              },
              child: LocalIconWidget(
                iconName: "chat_smile",
                iconSize: 26,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                _openPhotoAction();
              },
              child: LocalIconWidget(
                iconName: "chat_add",
                iconSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 聊天的列表
  Widget _buildChatBody() {
    return Flexible(
        child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView.builder(
              itemBuilder: (context, int index) {
                // 根据不同数据进行
                bool showTime = MessageUtils.showTime(currentInfo: _messageList[index],preInfo:index - 1 < 0 ? ChatMessageInfo() : _messageList[index - 1],isFirst: index ==0);
                // 当前时间转化
                String timeStr = MessageUtils.getMessageTime(_messageList[index]);

                return SendMessageItem(index: index, showTime: showTime, chatMessage: _messageList[index],timeStr: timeStr,);
              },
              controller: chatController,
              padding: EdgeInsets.symmetric(horizontal: 12),
              dragStartBehavior: DragStartBehavior.down,
              reverse: false,
              itemCount: _messageList.length,
              scrollDirection: Axis.vertical,
            ))
    );
  }

  // request

  Future _requestMessageInfo() async {
    final value = await MessageManager.getMessageBySessionList(
        chatType: widget.singleData.chatType == 1
            ? ChatType.ChatUserType
            : ChatType.ChatGroupType,
        lastMsgId: 0,
        page: "1",
        perPage: false,
        to:widget.singleData.chatType == 1 ? widget.singleData.userInfo!.accountId! : widget.singleData.groupInfo!.gid!);

    if (value["state"] != 1) {
      throw Exception('Failed to load message list.');
    }

    List responseJson = value["data"];
    List<ChatMessageInfo> msgList =
        responseJson.map((m) => new ChatMessageInfo.fromJson(m)).toList();

    // 进行反转
    _messageList = msgList.reversed.toList();
    if (mounted) {
      setState(() {

      });
    }
  }

  // action 滑动到底部
  void _scrollMessageBottom() {
    Timer(Duration(milliseconds: 100), () {
      chatController!.jumpTo(chatController!.position.maxScrollExtent);
    });
  }

  // 打开相册
  void _openPhotoAction() {}

  // 发送文字
  _insertText(String text) {}
}

class MyBehavior extends ScrollBehavior {
  @override
  TargetPlatform getPlatform(BuildContext context) {
    return Theme.of(context).platform;
  }

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          child: child,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
        );
      default:
        return child;
    }
  }
}



// 消息的扩展
class MessageUtils {
  static bool showTime({required ChatMessageInfo currentInfo, required bool isFirst, ChatMessageInfo? preInfo,}) {
    if (isFirst) {
      return true;
    } else {
      return int.parse(currentInfo.created!) - int.parse(preInfo!.created!) > 3 * 60 * 1000;
    }
  }

  // 当前的时间戳转化
  static String getMessageTime(ChatMessageInfo currentInfo) {
    // 计算时间
    int time = (new DateTime.now().millisecondsSinceEpoch).round() ~/ 1000;
    int timeStamp = int.parse(currentInfo.created!)~/ 1000;
    int _distance = time - timeStamp;

    if(_distance <= 60){
      return '刚刚';
    } else if(DateTime.fromMicrosecondsSinceEpoch(time).year == DateTime.fromMillisecondsSinceEpoch(timeStamp).year){
      return '${Utils.customStampStr(timestamp: timeStamp, date: 'MM-DD hh:mm', toInt: false)}';
    } else if (DateTime.fromMillisecondsSinceEpoch(time).day == DateTime.fromMillisecondsSinceEpoch(timeStamp).day) {
      return '${Utils.customStampStr(timestamp: timeStamp, date: 'hh:mm', toInt: false)}';
    } else{
      return '${Utils.customStampStr(timestamp: timeStamp, date: 'YY-MM-DD hh:mm', toInt: false)}';
    }
  }
}
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/config/app_color.dart';
import 'package:flutter_im/utils/other/AdapUtil.dart';

import '../../utils/global/global_params.dart';
import '../../utils/module_model/message/chat_message_info.dart';
import '../custom/space.dart';
import 'message_time_widget.dart';

const double defaultChatSpace = 6;

class SendMessageItem extends StatefulWidget {
  final ChatMessageInfo chatMessage;
  final int index;
  final bool showTime;
  final String timeStr;

  const SendMessageItem(
      {Key? key,
      required this.chatMessage,
      required this.index,
      required this.showTime,
      required this.timeStr})
      : super(key: key);

  @override
  State<SendMessageItem> createState() => _SendMessageItemState();
}

class _SendMessageItemState extends State<SendMessageItem> {
  @override
  Widget build(BuildContext context) {
    // 判断是不是拿个属性  来处理 显示方式
    var contentOrigin =
        JsonDecoder().convert(widget.chatMessage.contentOrigin!);
    switch (contentOrigin["type"]) {
      case "txt":
        return TextMessage(
          chatMessage: widget.chatMessage,
          avatar: "https://s2-cdn.oneitfarm.com/FpVycNkmE9dOnXyiHpIGdgqAb8zO",
          contentOrigin: contentOrigin,
          showTime: widget.showTime,
          timeStr: widget.timeStr,
        );
      case "file":
        return FileMessage(
          chatMessage: widget.chatMessage,
          avatar: "https://s2-cdn.oneitfarm.com/FpVycNkmE9dOnXyiHpIGdgqAb8zO",
          contentOrigin: contentOrigin,
          showTime: widget.showTime,
          timeStr: widget.timeStr,
        );
      default:
        return Text("1111");
    }
  }
}

// 基础的类 包含这些
class BaseMessage extends StatelessWidget {
  final Widget currentWidget;

  final ChatMessageInfo chatMessage;
  final String? avatar;
  final bool showTime;
  final String? timeStr;
  final bool isSelf;

  const BaseMessage(
      {Key? key,
      required this.currentWidget,
      required this.chatMessage,
      this.avatar,
      required this.showTime,
      this.timeStr,
      required this.isSelf})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = [
      HeaderContainer(
        avatar: avatar!,
      ),
      SpaceHorizontalWidget(
        space: defaultChatSpace,
      ),
      currentWidget,
      Spacer(),
    ];

    if (isSelf) {
      body = body.reversed.toList();
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Visibility(
            child: MessageTimeWidget(
              messageText: timeStr!,
            ),
            visible: showTime,
          ),
          SpaceVerticalWidget(
            space: defaultChatSpace,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: body,
          )
        ],
      ),
    );
  }
}

/// 文字
class TextMessage extends StatelessWidget {
  final ChatMessageInfo chatMessage;
  final String? avatar;
  final Map contentOrigin;
  final bool showTime;
  final String? timeStr;

  const TextMessage(
      {Key? key,
      required this.chatMessage,
      this.avatar,
      required this.contentOrigin,
      required this.showTime,
      this.timeStr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelf = chatMessage.fromAccountId == GlobalParams().accountId;
    String text = contentOrigin["msg"];

    return BaseMessage(
      currentWidget: TextContainer(
        text: text,
        isSelf: isSelf,
      ),
      chatMessage: chatMessage,
      showTime: showTime,
      isSelf: isSelf,
      avatar: avatar,
      timeStr: timeStr,
    );
  }
}

// 头像
class HeaderContainer extends StatelessWidget {
  final String avatar;

  const HeaderContainer({Key? key, required this.avatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: CachedNetworkImage(
        imageUrl: avatar,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  final String text;
  final bool isSelf;

  const TextContainer({Key? key, required this.text, required this.isSelf})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: text.length > 22 ? screenWidth - 66 - 55 : null,
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isSelf ? Color(0xff4CA1F6) : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: ExtendedText(
        text,
        maxLines: 100,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          color: isSelf ? Colors.white : color333,
        ),
      ),
    );
  }
}

// 图片

// 文件
class FileMessage extends StatelessWidget {
  final ChatMessageInfo chatMessage;
  final String? avatar;
  final Map contentOrigin;
  final bool showTime;
  final String? timeStr;

  const FileMessage(
      {Key? key,
        required this.chatMessage,
        this.avatar,
        required this.contentOrigin,
        required this.showTime,
        this.timeStr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelf = chatMessage.fromAccountId == GlobalParams().accountId;

    var _fileContainer = [
      SizedBox(
        width: 20,
      ),
      Container(
        color: Colors.red,
        width: 41,
        height: 46,
      ),
      Spacer(),
      Column(
        crossAxisAlignment: isSelf ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          SizedBox(height: 12,),
          Text("文件名字",style: TextStyle(color: color333,fontSize: 16),),
          Text("文件大小",style: TextStyle(color: color999,fontSize: 12))
        ],
      ),
      SizedBox(
        width: 12,
      ),
    ];

    return BaseMessage(
      currentWidget: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white
        ),
        height: 70,
        width: 240,
        child: Row(
          children: !isSelf ? _fileContainer : _fileContainer.reversed.toList(),
        ),
      ),
      chatMessage: chatMessage,
      showTime: showTime,
      isSelf: isSelf,
      avatar: avatar,
      timeStr: timeStr,
    );
  }
}

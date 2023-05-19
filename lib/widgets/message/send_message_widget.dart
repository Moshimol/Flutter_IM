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
  final bool showTimeMessage;

  const SendMessageItem({Key? key, required this.chatMessage, required this.index, required this.showTimeMessage}) : super(key: key);
  @override
  State<SendMessageItem> createState() => _SendMessageItemState();
}

class _SendMessageItemState extends State<SendMessageItem> {
  @override
  Widget build(BuildContext context) {
    // 判断是不是拿个属性  来处理 显示方式
    var contentOrigin = JsonDecoder().convert(widget.chatMessage.contentOrigin!);
    print(contentOrigin);

    switch(contentOrigin["type"]) {
      case "txt":
        return TextMessage(chatMessage: widget.chatMessage, showTimeMessage: widget.showTimeMessage,avatar: "https://s2-cdn.oneitfarm.com/FpVycNkmE9dOnXyiHpIGdgqAb8zO",text: contentOrigin["msg"],);
      default:
        return Text("1111");
    }


  }
}

/// 文字
class TextMessage extends StatelessWidget {

  final ChatMessageInfo chatMessage;
  final bool showTimeMessage;
  final String? avatar;
  final String text;

  const TextMessage({Key? key, required this.chatMessage, required this.showTimeMessage, this.avatar, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isSelf = chatMessage.fromAccountId == GlobalParams().accountId;

    var body = [
      HeaderContainer(avatar: avatar!,),
      SpaceHorizontalWidget(space: defaultChatSpace,),
      TextContainer(text: text,isSelf: isSelf,),
      Spacer(),
    ];

    if (isSelf) {
      body = body.reversed.toList();
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          MessageTimeWidget(messageText: "星期一 12:32",),
          SpaceVerticalWidget(space: defaultChatSpace,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: body,
          )
        ],
      ),
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
        fit: BoxFit.cover,),
    );
  }
}


class TextContainer extends StatelessWidget {
  final String text;
  final bool isSelf;
  const TextContainer({Key? key, required this.text, required this.isSelf}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: text.length > 22 ? screenWidth - 66 - 55 : null,
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: isSelf ? Color(0xff4CA1F6) : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: ExtendedText(
        text,
        maxLines: 100,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16,color: isSelf ? Colors.white : color333,),
      ),
    );
  }
}


// 图片


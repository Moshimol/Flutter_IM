import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter_im/config/app_color.dart';
import 'package:flutter_im/utils/other/AdapUtil.dart';

import '../../utils/global/global_params.dart';
import '../../utils/module_model/message/chat_message_info.dart';
import '../custom/space.dart';
import 'messag_helper_widget.dart';
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
      case "img":
      case "image":
        return ImageMessage(
          chatMessage: widget.chatMessage,
          avatar: "https://s2-cdn.oneitfarm.com/FpVycNkmE9dOnXyiHpIGdgqAb8zO",
          contentOrigin: contentOrigin,
          showTime: widget.showTime,
          timeStr: widget.timeStr,
        );
      case "audio":
        return VoiceMessage(
          chatMessage: widget.chatMessage,
          avatar: "https://s2-cdn.oneitfarm.com/FpVycNkmE9dOnXyiHpIGdgqAb8zO",
          contentOrigin: contentOrigin,
          showTime: widget.showTime,
          timeStr: widget.timeStr,
        );
      case "video":
        return VideoMessage(
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
      case "merge":
        return Text("merge");
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
  final bool? isArrow;

  const BaseMessage(
      {Key? key,
      required this.currentWidget,
      required this.chatMessage,
      this.avatar,
      required this.showTime,
      this.timeStr,
      required this.isSelf,
      this.isArrow = false})
      : super(key: key);

  Widget otherArrow({required bool isSelf}) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.only(top: 4),
        // color: Colors.red,
        height: 10,
        width: 4,
        child: CustomPaint(
          painter: ChatArrowPainter(isSelf: isSelf),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var body = [
      HeaderContainer(
        avatar: avatar!,
      ),
      SpaceHorizontalWidget(
        space: defaultChatSpace,
      ),
      (currentWidget.runtimeType == TextContainer || isArrow!)
          ? otherArrow(isSelf: isSelf)
          : SpaceHorizontalWidget(),
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
      margin: EdgeInsets.only(right: isSelf ? 0 : 5),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelf ? appChatSelfColor : Colors.white,
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

class ImageMessage extends StatelessWidget {
  final ChatMessageInfo chatMessage;
  final String? avatar;
  final Map contentOrigin;
  final bool showTime;
  final String? timeStr;

  const ImageMessage(
      {Key? key,
      required this.chatMessage,
      this.avatar,
      required this.contentOrigin,
      required this.showTime,
      this.timeStr})
      : super(key: key);

  Widget imageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: CachedNetworkImage(
        imageUrl:
            "https://p3-passport.byteimg.com/img/user-avatar/391dcd0276451aabb45d49700e55bb90~100x100.awebp",
        width: 100,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isSelf = chatMessage.fromAccountId == GlobalParams().accountId;
    return BaseMessage(
      currentWidget: imageWidget(),
      chatMessage: chatMessage,
      showTime: showTime,
      isSelf: isSelf,
      avatar: avatar,
      timeStr: timeStr,
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
    var fileType =
        MessageUtil.getFileTypeForFileName(chatMessage.content!.fileName!);
    var _fileContainer = [
      SizedBox(
        width: 15,
      ),
      //getFileTypeForFileName
      Image.asset(
        "assets/images/${MessageUtil.getFileNameType(fileType)}.png",
        width: 41,
        height: 46,
      ),
      Spacer(),
      Container(
        width: 240 - 80,
        child: Column(
          crossAxisAlignment:
              isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "${contentOrigin["file_name"]}",
              style: TextStyle(color: color333, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text("${double.parse(contentOrigin["size"]) / 1000} KB",
                style: TextStyle(color: color999, fontSize: 12))
          ],
        ),
      ),
      SizedBox(
        width: 12,
      ),
    ];

    return BaseMessage(
      currentWidget: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white),
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

// 声音
class VoiceMessage extends StatelessWidget {
  final ChatMessageInfo chatMessage;
  final String? avatar;
  final Map contentOrigin;
  final bool showTime;
  final String? timeStr;

  const VoiceMessage(
      {Key? key,
      required this.chatMessage,
      this.avatar,
      required this.contentOrigin,
      required this.showTime,
      this.timeStr})
      : super(key: key);

  Widget voiceWidget() {
    bool isSelf = chatMessage.fromAccountId == GlobalParams().accountId;
    return Container(
      height: 40,
      // 根据声音长度来计算
      width: max(80, ((screenWidth - 160) / 60) * contentOrigin["length"]!),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Colors.white),
      child: Row(
        children: [
          SpaceHorizontalWidget(),
          Transform.rotate(
            angle: isSelf ? -pi / 2 : pi / 2,
            child: Icon(Icons.wifi),
          ),
          SpaceHorizontalWidget(),
          Text(
            "${contentOrigin["length"]} ”",
            style: TextStyle(
                color: isSelf ? Colors.white : color333, fontSize: 14),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isSelf = chatMessage.fromAccountId == GlobalParams().accountId;
    return BaseMessage(
      currentWidget: voiceWidget(),
      chatMessage: chatMessage,
      showTime: showTime,
      isSelf: isSelf,
      avatar: avatar,
      timeStr: timeStr,
      isArrow: true,
    );
  }
}

// 视频
class VideoMessage extends StatelessWidget {
  final ChatMessageInfo chatMessage;
  final String? avatar;
  final Map contentOrigin;
  final bool showTime;
  final String? timeStr;

  const VideoMessage(
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
    return BaseMessage(
        currentWidget: Container(),
        chatMessage: chatMessage,
        showTime: showTime,
        isSelf: isSelf);
  }
}

// 文件相关处理部分
class MessageUtil {
  // 从文件名拿到文件类型
  static String getFileTypeForFileName(String fileName) {
    var fileArr = fileName.split(".");
    return fileArr.last;
  }

  static String getFileNameType(String type) {
    String defaultName = "file_unknow";
    if (type == "doc" || type == "doxc") {
      defaultName = "file_doc";
    } else if (type == "ppt" || type == "pptx") {
      defaultName = "file_ppt";
    } else if (type == "xls" || type == "xlsx") {
      defaultName = "file_xls";
    } else if (type == "pdf") {
      defaultName = "file_pdf";
    } else if (type == "zip") {
      defaultName = "file_zip";
    } else if (type == "txt") {
      defaultName = "file_txt";
    }
    return defaultName;
  }
}

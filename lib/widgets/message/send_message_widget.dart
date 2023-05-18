import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/config/app_color.dart';

import 'message_time_widget.dart';


class SendMessageItem extends StatefulWidget {
  const SendMessageItem({Key? key}) : super(key: key);

  @override
  State<SendMessageItem> createState() => _SendMessageItemState();
}

class _SendMessageItemState extends State<SendMessageItem> {
  @override
  Widget build(BuildContext context) {
    // 判断是不是拿个属性  来处理
    return TextMessage();
  }
}


/// 文字
class TextMessage extends StatelessWidget {

  const TextMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = [
      HeaderContainer(avatar: "https://p3-passport.byteimg.com/img/user-avatar/d4e4ff8f64d24fa24208deb7b926f4ca~180x180.awebp",),
      TextContainer(),
      Spacer(),
    ];

    body = body.reversed.toList();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          MessageTimeWidget(messageText: "星期一 12:32",),
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
  const TextContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("1"),
    );
  }
}


// 图片


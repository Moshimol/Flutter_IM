import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class SendMessageItem extends StatefulWidget {
  const SendMessageItem({Key? key}) : super(key: key);

  @override
  State<SendMessageItem> createState() => _SendMessageItemState();
}

class _SendMessageItemState extends State<SendMessageItem> {
  @override
  Widget build(BuildContext context) {
    return TextMessage();
  }
}


// 文字
class TextMessage extends StatelessWidget {

  const TextMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = [
    ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: CachedNetworkImage(
        imageUrl: "https://p3-passport.byteimg.com/img/user-avatar/d4e4ff8f64d24fa24208deb7b926f4ca~180x180.awebp",
        width: 40,
        height: 40,
        fit: BoxFit.cover,),
    ),

      Spacer(),
    ];

    body = body.reversed.toList();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: body,
      ),
    );
  }
}


// 图片


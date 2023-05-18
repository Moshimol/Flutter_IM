import 'package:flutter/material.dart';
import 'package:flutter_im/config/app_color.dart';
import 'package:flutter_im/utils/other/AdapUtil.dart';

const TextStyle style = TextStyle(color: color999,fontSize: 14);

class MessageTimeWidget extends StatefulWidget {
  final String messageText;

  const MessageTimeWidget({Key? key, required this.messageText}) : super(key: key);

  @override
  State<MessageTimeWidget> createState() => _MessageTimeWidgetState();
}

class _MessageTimeWidgetState extends State<MessageTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(widget.messageText,style: style,),
    );
  }
}

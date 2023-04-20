import 'package:flutter/material.dart';

import '../../widgets/appbar/back_appbar.dart';

class MessageDetails extends StatefulWidget {
  const MessageDetails({Key? key}) : super(key: key);

  @override
  State<MessageDetails> createState() => _MessageDetailsState();
}

class _MessageDetailsState extends State<MessageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "聊天框",
      ),
    );
  }
}

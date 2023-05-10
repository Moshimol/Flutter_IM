import 'package:flutter/material.dart';

import '../../../widgets/appbar/back_appbar.dart';

class MomentMessage extends StatefulWidget {
  const MomentMessage({Key? key}) : super(key: key);

  @override
  State<MomentMessage> createState() => _MomentMessageState();
}

class _MomentMessageState extends State<MomentMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "消息",
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Text("清空",style: TextStyle(color: Color(0xFF333333),fontSize: 16),),
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


  Widget _mainView(){
    return Container(
      height: 1,
    );
  }
  Widget _messageList(){
    return Container(
      height: 1,
    );
  }

  // request  清除消息
  Future _clearMessage() async{
  }
}

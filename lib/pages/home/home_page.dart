import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle labelStyle = TextStyle(color: Color(0xff333333),fontSize: 17);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 138),
          Container(
            child: Text(
              "手机号登录",
              style: TextStyle(
                color: Color(0xff333333),
                fontSize: 27,
                fontWeight: FontWeight.w200
              ),),
          ),
          SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            color: Color(0xffD8D8D8),
            height: 0.5,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text("手机号",style: labelStyle)
            ],
          )
        ],
      ),
    );
  }
}

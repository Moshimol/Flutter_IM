import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle labelStyle = TextStyle(color: Color(0xff333333),fontSize: 17);
    bool isCanLogin = false;

    return Scaffold(
      backgroundColor: Colors.white,
      body:
      ListView(
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
              Text("手机号",style: labelStyle),
              SizedBox(width: 20),
              Expanded(child: TextField(
                decoration: InputDecoration(
                    hintText: "请输入手机号",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 16,color: Color(0xffD8D8D8))
                ),
              ))
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            color: Color(0xffD8D8D8),
            height: 0.5,
          ),
          Row(
            children: [
              Text("密码",style: labelStyle),
              SizedBox(width: 36),
              Expanded(child: TextField(
                decoration: InputDecoration(
                    hintText: "请输入密码",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 16,color: Color(0xffD8D8D8))
                ),
              ))
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            color: Color(0xffD8D8D8),
            height: 0.5,
          ),
          SizedBox(height: 60),
          Container(
            height: 47,
            decoration: BoxDecoration(
              color: isCanLogin ? Color(0xff108EE9) : Color(0xff108EE9).withAlpha(100),
              borderRadius: BorderRadius.all(Radius.circular(2))
            ),
            alignment: Alignment.center,
            child: Text("登录",style: TextStyle(fontSize: 18.0,color: Colors.white)),
          )
        ],
      ),
    );
  }
}

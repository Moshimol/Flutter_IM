import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 69 - 18),
          Center(
            child: Text("手机号登录",style: TextStyle(fontSize: 21),),
          )
        ],
      ),
    );
  }
}

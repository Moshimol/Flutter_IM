import 'package:flutter/material.dart';
import 'package:flutter_im/main.dart';

class BackBar extends AppBar {
  BackBar({Key? key, required titleName})
      : super(
          title: Text(
            titleName,
            style: TextStyle(
                color: Color(0xff333333),
                fontSize: 18,
                fontWeight: FontWeight.w300),
          ),
          backgroundColor: Color(0xFFF5F5F5),
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.of(navigatorKey.currentState!.context).pop();
            },
            child: UnconstrainedBox(
              child: Image.asset(
                "assets/images/left_arrow_back.png",
                width: 11,
                height: 18,
              ),
            ),
          ),
        );
}

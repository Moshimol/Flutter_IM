import 'package:flutter/material.dart';
import 'package:flutter_im/main.dart';

class CloseBar extends AppBar {
  CloseBar({Key? key})
      : super(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.of(navigatorKey.currentState!.context).pop();
            },
            child: UnconstrainedBox(
              child: Image.asset(
                "assets/images/app_close.png",
                width: 17,
                height: 17,
              ),
            ),
          ),
        );
}

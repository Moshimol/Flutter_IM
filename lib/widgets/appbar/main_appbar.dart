import 'package:flutter/material.dart';


class MainAppBar extends AppBar {

  MainAppBar({Key? key, required titleName,String? rightIconName, void Function()? onClickTap})
      : super(
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0,
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Visibility(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Image.asset(
                rightIconName??"",
                width: 21,
                height: 21,
              ),
            ),
            visible: (rightIconName != null && rightIconName.length > 0) ? true : false,
          ),
          onTap: () {
            onClickTap!();
          },
        ),
      ],
      title: Text(
        titleName,
        style: TextStyle(
            color: Color(0xff333333),
            fontSize: 18,
            fontWeight: FontWeight.w200),
      )
  );

}
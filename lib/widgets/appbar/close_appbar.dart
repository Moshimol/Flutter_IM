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

class CloseTitleBar extends AppBar {

  CloseTitleBar({Key? key,required closeName,String? rightText,void Function(BuildContext)? onClickTap})
      : super(
    backgroundColor: Color(0xFFF5F5F5),
    elevation: 0,
    actions: [
      Builder(builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Visibility(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Text(rightText!,style: TextStyle(color: Color(0xFF333333),fontSize: 16),),
            ),
            visible: (rightText != null && rightText.length > 0)
                ? true
                : false,
          ),
          onTap: () {
            onClickTap!(context);
          },
        );
      }),
    ],
    leading: InkWell(
      onTap: () {
        Navigator.of(navigatorKey.currentState!.context).pop();
      },
      child: UnconstrainedBox(
        child: Text(closeName,style: TextStyle(color: Color(0xFF333333),fontSize: 16),),
      ),
    ),
  );
}

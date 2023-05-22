import 'package:flutter/material.dart';

import '../../config/app_color.dart';

class ChatArrowPainter extends CustomPainter {
  final bool isSelf;

  const ChatArrowPainter({required this.isSelf}) : super();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = isSelf ? appChatSelfColor : Colors.white
      ..style = PaintingStyle.fill;

    // 分为左边和右边的区别
    Path path = Path();
    if (isSelf) {
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height / 2 + 1);
      path.lineTo(size.width, size.height / 2 - 1);
    } else {
      path.moveTo(0, size.width / 2 - 1);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.width);
      path.lineTo(0, size.width / 2 + 1);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

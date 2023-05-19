import 'package:flutter/material.dart';

class ChatArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.width / 2 - 1);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.width);
    path.lineTo(0, size.width / 2 + 1);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

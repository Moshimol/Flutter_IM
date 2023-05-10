import 'package:flutter/material.dart';

class LocalIconWidget extends StatelessWidget {
  const LocalIconWidget({Key? key, this.iconSize, required this.iconName})
      : super(key: key);

  final double? iconSize;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/${iconName}.png",
      width: iconSize,
      height: iconSize,
    );
  }
}

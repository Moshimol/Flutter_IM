import 'package:flutter/material.dart';

const double defaultSpace = 10;

class SpaceHorizontalWidget extends StatelessWidget {
  const SpaceHorizontalWidget({Key? key, this.space}) : super(key: key);

  final double? space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space ?? defaultSpace,);
  }
}

class SpaceVerticalWidget extends StatelessWidget {
  const SpaceVerticalWidget({Key? key, this.space}) : super(key: key);

  final double? space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space ?? defaultSpace,);
  }
}
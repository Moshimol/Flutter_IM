import 'package:cached_network_image/cached_network_image.dart';
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


class NetWorkImageWidget extends StatelessWidget {
  const NetWorkImageWidget({Key? key, this.iconSize, required this.url, this.fit})
      : super(key: key);

  final double? iconSize;
  final String url;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: iconSize,
      width: iconSize,
      fit: fit!,
    );
  }
}

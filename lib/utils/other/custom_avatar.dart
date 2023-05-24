import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../config/app_color.dart';

// 名字和默认背景生成的头像
class CustomAvatar extends StatelessWidget {
  final String name;
  final double size;
  const CustomAvatar({Key? key, required this.name, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String showName = name.length > 2 ? name.substring(0, 2) : name;
    return Container(
      color: appChatAvatarBackColor,
      width: size,
      height: size,
      child: Text(showName),
    );
  }
}


/// 有URL地址的进行生成
class CustomCacheAvatar extends StatelessWidget {
  final String name;
  final double size;
  final String? url;
  const CustomCacheAvatar({Key? key, required this.name, required this.size, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String showName = name.length > 2 ? name.substring(0, 2) : name;
    if (url!.length > 0) {
      return CachedNetworkImage(
        imageUrl: url!,
        width: size,
        height: size,
      );
    } else {
      return Container(
        color: appChatAvatarBackColor,
        width: size,
        height: size,
        child: Center(
          child: Text(showName, style: TextStyle(fontSize: 12,color: Colors.white),),
        ),
      );
    }
  }
}

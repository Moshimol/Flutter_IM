
import 'package:flutter/material.dart';

class AppStyle {
  static redBadge(int count,{Color color = Colors.red,bool isDot= false,double height = 18.0, double width = 18.0}) {

    final _num = count > 99 ? "..." : count;

    return Container(
      alignment: Alignment.center,
      height: !isDot ? height : height /2,
      width: !isDot ? width : width /2,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100.0)),
      child: !isDot ? Text('$_num', style: TextStyle(color: Colors.white, fontSize: 12.0)) : null,
    );
  }

  // 如果使用自定义字体 ttf的图标类型的话

  static iconFont(int codePoint, { required Color color, double size = 16}){
    return Icon(
      IconData(codePoint, fontFamily: "iconfont",matchTextDirection: true),
      size: size,
      color: color,
    );
  }

}
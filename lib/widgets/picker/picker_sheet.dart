import 'package:flutter/material.dart';

const double radius = 10;
const double sheetSingleHeight = 65;

class PickSheet {
  static Future<T?> showModelSheet<T>(
      {required BuildContext context, Widget? child}) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        // 每个角度数
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          child: child,
        );
      },
    );
  }

  static InkWell buildButton(Widget children, double buildHeight,
      {Function()? onClickTap}) {
    return InkWell(
      onTap: () {
        // 然后消失
        onClickTap!();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        height: buildHeight,
        child: children,
      ),
    );
  }
}

/// 底部弹出的操作 朋友圈底部弹出
class MomentBottomSheet {
  /// 选择拍摄或者是相机的相关资源
  static Future<T?> showBottomPicker<T>({required BuildContext context, Function(int index)? onClickTap}) {
    return PickSheet.showModelSheet(
        context: context,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton(
                Column(
                  children: [
                    Text(
                      "拍摄",
                      style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                    ),
                    Text("照片或视频",
                        style:
                        TextStyle(fontSize: 12, color: Color(0xff999999))),
                  ],
                ),
                sheetSingleHeight, onClickTap: () {
              Navigator.pop(context);
              onClickTap!(0);
            }),
            Divider(
              height: 1,
            ),
            _buildButton(
                Text(
                  "从手机相册选择",
                  style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                ),
                49, onClickTap: () {
              Navigator.pop(context);
              onClickTap!(1);
            }),
            Container(
              height: 7,
              color: Color(0xffF5F5F5),
            ),
            _buildButton(
                Text(
                  "取消",
                  style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                ),
                49, onClickTap: () {
              Navigator.pop(context);
            }),
          ],
        ));
  }

  static InkWell _buildButton(Widget children, double buildHeight,
      {Function()? onClickTap}) {
    return InkWell(
      onTap: () {
        // 然后消失
        onClickTap!();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        height: buildHeight,
        child: children,
      ),
    );
  }
}

// 个人页面修改照片
class MeHeadBottomSheet{
  static Future<T?> showBottomPicker<T>({required BuildContext context, Function(int index)? onClickTap}) {
    return PickSheet.showModelSheet(
        context: context,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PickSheet.buildButton(
                Column(
                  children: [
                    Text(
                      "拍照",
                      style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                    )
                  ],
                ),
                sheetSingleHeight, onClickTap: () {
              Navigator.pop(context);
              onClickTap!(0);
            }),
            Divider(
              height: 1,
            ),
            PickSheet.buildButton(
                Text(
                  "从手机相册选择",
                  style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                ),
                49, onClickTap: () {
              Navigator.pop(context);
              onClickTap!(1);
            }),
            Divider(
              height: 1,
            ),
            PickSheet.buildButton(
                Text(
                  "保存照片",
                  style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                ),
                49, onClickTap: () {
              Navigator.pop(context);
              onClickTap!(2);
            }),
            Container(
              height: 7,
              color: Color(0xffF5F5F5),
            ),
            PickSheet.buildButton(
                Text(
                  "取消",
                  style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                ),
                49, onClickTap: () {
              Navigator.pop(context);
            }),
          ],
        ));
  }
}
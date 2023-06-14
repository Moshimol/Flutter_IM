import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/module_model/momet/time_line_info.dart';
// 朋友圈各种类型的Widget

class MomentWidget {
  Widget momentDetails({required TimeLineInfo info}) {
    // type:string, 类型：1-文本 ，2-图片(文本)， 3-视频(文本)， 4-转载(文本)

    switch(int.parse(info.type!)) {
      case 1:
        return Container();
      case 2:
        return momentPic(info: info);
      default:
        return Container();
    }
  }

  // 图片
  // 视频
  // 转发
  Widget momentPic({required TimeLineInfo info}) {
    int imageCount = info.resources!.length;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double width = (constraints.maxWidth - 4 * 2) / 3;
          if (imageCount == 1) {
            width = constraints.maxWidth * 0.7;
          } else if (imageCount == 2) {
            width = (constraints.maxWidth - 4) / 2;
          }
          return Wrap(
            spacing: 4,
            runSpacing: 4,
            children: info.resources!.map((e) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: e.url!,
                  width: width,
                  height: width,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          );
        });
  }

  Widget momentVideo() {
    return Container();
  }

  Widget momentReply() {
    return Container(
      height: 20,
      color: Colors.red,
    );
  }

  Widget momentTopInfo({Function()? onClickTap, required Map<String, dynamic> promptInfo}) {
    return Visibility(child: Padding(
      padding: EdgeInsets.only(top: 30, bottom: 16),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              onClickTap!();
            },
            child: Container(
              height: 40,
              width: 180,
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: promptInfo["new_notify_creator"] != null ? promptInfo["new_notify_creator"] : "",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        "${promptInfo["new_notify_num"]}条消息",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                  Transform.scale(
                    scaleX: -1,
                    child: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  // Image.asset("")

                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          )
        ],
      ),
    ),visible: promptInfo["new_notify_num"] > 0,);
  }

  Widget likeMenuView(){
    return Container(
      color: Colors.red,
      width: 80,
      height: 20,
    );
  }
}

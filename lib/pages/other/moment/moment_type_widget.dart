import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// 朋友圈各种类型的Widget

class MomentWidget {
  Widget momentDetails() {
    return Container();
  }

  // 图片
  // 视频
  // 转发
  Widget momentPic() {
    return Container();
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
}

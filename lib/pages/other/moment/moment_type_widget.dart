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

  Widget momentTopInfo({Function()? onClickTap}) {
    return Padding(
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
                      imageUrl: "https://p3-passport.byteimg.com/img/user-avatar/d4e4ff8f64d24fa24208deb7b926f4ca~180x180.awebp",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      child: Text(
                        "2条消息",
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
    );
  }
}

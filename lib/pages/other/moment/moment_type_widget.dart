import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/config/app_color.dart';
import 'package:flutter_im/utils/other/custom_avatar.dart';
import 'package:flutter_im/widgets/custom/space.dart';

import '../../../utils/module_model/momet/time_line_info.dart';
import '../../../widgets/custom/category.dart';
// 朋友圈各种类型的Widget

const double spacing = 10.0;
const double radius = 2;

// 评论的字体类型
var textStyleCommentMain = TextStyle(
    fontSize: 16,
    color: color333,
);

var textStyleComment = TextStyle(
    fontSize: 16.0,
    color: Color(0xff576B95),
    fontWeight: FontWeight.bold
);

var textStylePopMenu = const TextStyle(
  color: Colors.white,
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
);

class MomentWidget {
  Widget momentDetails({required TimeLineInfo info}) {
    // type:string, 类型：1-文本 ，2-图片(文本)， 3-视频(文本)， 4-转载(文本)

    Widget topWidget = Container();
    switch (int.parse(info.type!)) {
      case 1:
        topWidget = Container(
          height: 1,
        );
        break;
      case 2:
        topWidget = momentPic(info: info);
        break;
    }

    // 如果是有评论或者是有点赞 则显示评论 整体
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topWidget,
        Visibility(
          child: likeListView(info: info),
          visible: int.parse(info.likeNum!) > 0,
        ),
        Visibility(
          child: momentReply(info: info),
          visible: int.parse(info.commentNum!) > 0,
        )
      ],
    );
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

  Widget momentReply({required TimeLineInfo info}) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            color: Colors.red,
          ),
          SpaceHorizontalWidget(
            space: 4,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (TimeComment comment in info.comments ?? [])
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Text(
                        comment.fromUser!.nickname! + ":",
                        style: textStyleComment,
                      ),
                      SpaceHorizontalWidget(space: 4,),
                      Text(
                        comment.content ?? "",
                        style: textStyleComment,
                      )
                    ],
                  ),
                )
            ],
          ))
        ],
      ),
    );
  }

  Widget momentTopInfo(
      {Function()? onClickTap, required Map<String, dynamic> promptInfo}) {
    return Visibility(
      child: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
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
                        imageUrl: promptInfo["new_notify_creator"] != null
                            ? promptInfo["new_notify_creator"]
                            : "",
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
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                      ),
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
      ),
      visible: promptInfo["new_notify_num"] > 0,
    );
  }

  Widget likeListView({Function()? onClickTap, required TimeLineInfo info}) {
    return Column(
      children: [
        SpaceVerticalWidget(),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(radius)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: LocalIconWidget(
                  iconName: "moment_like",
                  iconSize: 22,
                ),
              ),
              SpaceHorizontalWidget(),
              Expanded(
                  child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (TimeLineUser like in info.likes ?? [])
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: CustomCacheAvatar(
                          name: like.nickname!, size: 22, url: like.avatar),
                    )
                ],
              ))
            ],
          ),
        )
      ],
    );
  }

  Widget likeMenuView({Function()? onClickTap, required GlobalKey buttonKey}) {
    return GestureDetector(
      child: Container(
        key: buttonKey,
        child: Image.asset("assets/images/moment_more_action.png",
            width: 32, height: 20, fit: BoxFit.fill),
        width: 32,
        height: 20,
      ),
      onTap: () {
        onClickTap!();
      },
    );
  }
}

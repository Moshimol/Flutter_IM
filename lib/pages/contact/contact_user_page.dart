import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_im/config/index.dart';
import 'package:flutter_im/widgets/appbar/back_appbar.dart';
import 'package:flutter_im/widgets/custom/space.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/module_model/contact/contact_data.dart';
import '../../utils/other/custom_avatar.dart';
import '../../widgets/custom/category.dart';

class ContactUserPage extends StatefulWidget {
  const ContactUserPage({Key? key}) : super(key: key);

  @override
  State<ContactUserPage> createState() => _ContactUserPageState();
}

class _ContactUserPageState extends State<ContactUserPage> {
  String? chatId;

  ContactData? useData;

  @override
  void initState() {
    super.initState();
    // singleData = Get.arguments!;
    chatId = Get.parameters['chat_id'];
    useData = ContactData.fromJson(Get.arguments['user_data']!);

    if (mounted) {
      setState(() {});
    }
  }

  Widget _mainView() {
    return ListView(
      children: [
        Column(
          children: [
            _topInfoView(),
            _userInfoView(),
            _bottomInfoView(),
          ],
        )
      ],
    );
  }

  Widget _topInfoView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      height: 120,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CustomCacheAvatar(
              name: useData!.name!,
              size: 64,
              url: useData!.avatar!,
            ),
          ),
          SpaceHorizontalWidget(
            space: 15,
          ),
          Column(
            children: [
              SpaceVerticalWidget(
                space: 29,
              ),
              Text(
                useData!.name!,
                style: TextStyle(fontSize: 18, color: color333),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _userInfoView() {
    return Column(
      children: [
        ContactItem(
          leftText: "标签和备注",
          children: Container(),
          showBottomLine: true,
        ),
        SpaceVerticalWidget(
          space: 10,
        ),
        ContactItem(
          height: 100,
          leftText: "朋友圈",
          children: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CustomCacheAvatar(
              name: useData!.name!,
              size: 64,
              url: useData!.avatar!,
            ),
          ),
          showBottomLine: true,
        ),
        ContactItem(
          leftText: "更多信息",
          children: Container(),
          showBottomLine: false,
        ),
        SpaceVerticalWidget(
          space: 10,
        ),
        /*
        ContactItem(
          leftText: "手机号",
          children: Text("暂无",style: TextStyle(fontSize: 16, color: color333)),
          showBottomLine: true,
        ),
        ContactItem(
          leftText: "邮箱",
          children: Text("暂无",style: TextStyle(fontSize: 16, color: color333)),
          showBottomLine: false,
        ),*/
      ],
    );
  }

  Widget _bottomInfoView() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 47,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LocalIconWidget(
                        iconName: "user_chat_message",
                        iconSize: 18,
                      ),
                      SpaceHorizontalWidget(
                        space: 5,
                      ),
                      Text(
                        "发消息",
                        style: TextStyle(fontSize: 17, color: color576B95),
                      )
                    ],
                  ),
                  height: 46,
                ),
                onTap: (){
                  // 点击聊天 跳转到聊天界面
                },
              ),
              GestureDetector(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xffEEEEEE),
                          ),
                        ))),
                onTap: (){
                  // 点击音视频通话

                },
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 47,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LocalIconWidget(
                iconName: "user_chat_video",
                iconSize: 18,
              ),
              SpaceHorizontalWidget(
                space: 5,
              ),
              Text("音视频通话", style: TextStyle(fontSize: 17, color: color576B95))
            ],
          ),
        )
      ],
    );
  }

  // 封装细腻

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "",
      ),
      body: _mainView(),
    );
  }
}

class ContactItem extends StatefulWidget {
  final bool showBottomLine;
  final String leftText;
  final Widget children;
  final double? height;
  final void Function(BuildContext)? onClickTap;

  const ContactItem(
      {Key? key,
      required this.showBottomLine,
      required this.leftText,
      required this.children,
      this.onClickTap,
      this.height = 56})
      : super(key: key);

  @override
  State<ContactItem> createState() => _ContactItem();
}

class _ContactItem extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          widget.onClickTap!(context);
        },
        child: Column(
          children: [
            Container(
              height: widget.height! - 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(widget.leftText,
                        style: TextStyle(fontSize: 17, color: color333)),
                    width: 104,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          widget.children,
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/dis_arrow.png",
                    width: 8,
                    height: 12.5,
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            Visibility(
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                bottom: BorderSide(
                  color: Color(0xffEEEEEE),
                ),
              ))),
              visible: widget.showBottomLine,
            )
          ],
        ),
      ),
    );
  }
}

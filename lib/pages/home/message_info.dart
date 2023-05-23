import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/manager/account_manager.dart';
import '../../utils/module_model/message/message_single.dart';
import '../../utils/other/AdapUtil.dart';
import '../../widgets/appbar/back_appbar.dart';
import '../../widgets/custom/category.dart';
import '../../widgets/custom/space.dart';
import '../../widgets/picker/picker_sheet.dart';
import '../../config/index.dart';

enum MessageInfoType { user, group }
// 邀请群聊的方式
enum GroupInviteType {add, delete}

class MessageInfo extends StatefulWidget {
  const MessageInfo(
      {Key? key,
      required this.titleString,
      required this.messageType,
      this.singleData})
      : super(key: key);

  final String titleString;

  final MessageInfoType messageType;

  final MessageSingle? singleData;

  @override
  State<MessageInfo> createState() => _MessageInfoState();
}

class _MessageInfoState extends State<MessageInfo> {

  bool isSwitched = false;
  bool isTop = false;
  bool isDisturb = false;
  bool isBlock = false;
  List<dynamic> groupUserList = [
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1",
    "1"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.messageType == MessageInfoType.user) {
      isTop = widget.singleData!.top! == "1" ? true : false;
      isDisturb = widget.singleData!.disturb! == "1" ? true : false;
      _requestUserInfo();
    } else {

    }
    if (mounted) {
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: BackBar(titleName: widget.titleString),
      body: widget.messageType == MessageInfoType.user
          ? _mainUserView()
          : _mainGroupView(),
    );
  }

  // request 网络请求 请求个人或者是群组的信息
  Future _requestUserInfo() async {
    print(widget.singleData!.userInfo!.chatId);
    var res = AccountManager.getUserInfoByChatId(widget.singleData!.userInfo!.chatId!);
    if (res["state"] != 1) {
      throw Exception('Failed to load message list.');
    }
    var data = res["data"];
    isBlock = data["is_block"];
  }

  // 置顶聊天
  // 免打扰
  // 黑名单

  Future _requestGroupInfo() async {

  }

  // view
  Widget _mainGroupView() {
    double headSize = (screenWidth - (15 * 2 + 4 * 23)) / 5;
    return ListView(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              // 顶部
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Wrap(
                  spacing: 23,
                  runSpacing: 10,
                  children: [
                    for (final user in groupUserList) _buildUserItem(headSize: headSize),
                    // 根绝权限来判断 有管理员 普通成员 拥有者
                    InkWell(
                      onTap: (){
                        // 删除群聊
                        _inviteGroup(type: GroupInviteType.add);
                      },
                      child: LocalIconWidget(
                        iconName: "chat_user_add",
                        iconSize: headSize,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        // 点击邀请加入群聊
                        _inviteGroup(type: GroupInviteType.add);
                      },
                      child: LocalIconWidget(
                        iconName: "chat_user_delete",
                        iconSize: headSize,
                      ),
                    )
                  ]
                ),
              ),
              Column(
                children: [
                  // 个人信息
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "查看更多群成员",
                            style: TextStyle(
                                color: Color(0xff999999), fontSize: 15),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff999999),
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              // 中间相关信息
              Container(
                color: Color(0xffEEEEEE),
                height: 8.5,
              ),
              _singleItemView(
                  children: Row(
                    children: [
                      Text(
                        "XXX",
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 17),
                      ),
                      SpaceHorizontalWidget(
                        space: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Color(0xffCCCCCC),
                      )
                    ],
                  ),
                  leftText: "群聊名称",
                  showBottomLine: true),
              _singleItemView(
                  children: Row(
                    children: [
                      Text(
                        "公告公告",
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 17),
                      ),
                      SpaceHorizontalWidget(
                        space: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Color(0xffCCCCCC),
                      )
                    ],
                  ),
                  leftText: "群公告",
                  showBottomLine: true),
              _singleItemView(
                  children: Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Color(0xffCCCCCC),
                      )
                    ],
                  ),
                  leftText: "群管理",
                  showBottomLine: true),
              _singleItemView(
                  children: Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Color(0xffCCCCCC),
                      )
                    ],
                  ),
                  leftText: "群聊头像",
                  showBottomLine: false),
              Container(
                color: Color(0xffEEEEEE),
                height: 8.5,
              ),
              _singleItemView(
                  children: CupertinoSwitch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeColor: CupertinoColors.activeBlue,
                    trackColor: CupertinoColors.inactiveGray,
                    thumbColor: CupertinoColors.white,
                  ),
                  leftText: "置顶聊天",
                  showBottomLine: false),
              _singleItemView(
                  children: CupertinoSwitch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeColor: CupertinoColors.activeBlue,
                    trackColor: CupertinoColors.inactiveGray,
                    thumbColor: CupertinoColors.white,
                  ),
                  leftText: "消息免打扰",
                  showBottomLine: false),
              Container(
                color: Color(0xffEEEEEE),
                height: 8.5,
              ),
              _singleItemView(
                  children: Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Color(0xffCCCCCC),
                      )
                    ],
                  ),
                  leftText: "查找聊天内容",
                  showBottomLine: false),
              // 最后显示删除并且退出
              Container(
                color: Color(0xffEEEEEE),
                height: 8.5,
              ),
              InkWell(
                onTap: (){
                  MessageClearSheet.showDeleteMessagePicker(
                      textAlertString: "退出群聊,并且删除聊天记录",
                      context: context,
                      onClickTap: () {
                        // 点击删除的操作
                        _deleteMessageWithRecord();
                      });
                },
                child: Container(
                  color: Colors.white,
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("删除并且退出",style: TextStyle(color: Colors.redAccent,fontSize: 16),)],
                  ),
                ),
              ),
              Container(
                color: Color(0xffEEEEEE),
                height: 60,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildUserItem({required double headSize}){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            imageUrl:
            "https://p3-passport.byteimg.com/img/user-avatar/391dcd0276451aabb45d49700e55bb90~100x100.awebp",
            width: headSize,
            height: headSize,
            fit: BoxFit.cover,
          ),
        ),
        SpaceVerticalWidget(
          space: 5,
        ),
        Text(
          "名字",
          style:
          TextStyle(color: color333, fontSize: 12),
        )
      ],
    );
  }

  Widget _mainUserView() {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: CachedNetworkImage(
                            imageUrl: widget.singleData!.userInfo!.avatar!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SpaceVerticalWidget(
                          space: 5,
                        ),
                        Text(
                          "${widget.singleData!.userInfo!.nickname}",
                          style:
                              TextStyle(color: color333, fontSize: 12),
                        )
                      ],
                    ),
                    SpaceHorizontalWidget(
                      space: 16,
                    ),
                    InkWell(
                      onTap: () {
                        print("object");
                      },
                      child: LocalIconWidget(
                        iconName: "message_add_user",
                        iconSize: 50,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 8,
              color: appBackColor,
            ),
          ],
        ),
        _singleItemView(
            children: CupertinoSwitch(
              value: isTop,
              onChanged: (value) {
                setState(() {
                  isTop = value;
                });
              },
              activeColor: CupertinoColors.activeBlue,
              trackColor: CupertinoColors.inactiveGray,
              thumbColor: CupertinoColors.white,
            ),
            leftText: "置顶聊天",
            showBottomLine: true),
        _singleItemView(
            children: CupertinoSwitch(
              value: isDisturb,
              onChanged: (value) {
                setState(() {
                  isDisturb = value;
                });
              },
              activeColor: CupertinoColors.activeBlue,
              trackColor: CupertinoColors.inactiveGray,
              thumbColor: CupertinoColors.white,
            ),
            leftText: "消息免打扰",
            showBottomLine: true),
        _singleItemView(
            children: CupertinoSwitch(
              value: isBlock,
              onChanged: (value) {
                setState(() {
                  isBlock = value;
                });
              },
              activeColor: CupertinoColors.activeBlue,
              trackColor: CupertinoColors.inactiveGray,
              thumbColor: CupertinoColors.white,
            ),
            leftText: "黑名单",
            showBottomLine: false),
        Container(
          height: 8,
          color: appBackColor,
        ),
        _singleItemView(
            children: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Color(0xffCCCCCC),
            ),
            leftText: "查找聊天记录",
            showBottomLine: true),
        InkWell(
          onTap: () {
            MessageClearSheet.showDeleteMessagePicker(
                textAlertString: "删除聊天记录",
                context: context,
                onClickTap: () {
                  // 点击删除的操作
                  _deleteMessageWithRecord();
                });
          },
          child: _singleItemView(
              children: Container(), leftText: "清空聊天记录", showBottomLine: false),
        )
      ],
    );
  }

  Widget _singleItemView(
      {Widget? children,
      required String leftText,
      required bool showBottomLine}) {
    return Container(
      color: Colors.white,
      height: 50,
      child: Column(
        children: [
          Container(
            height: 49.5,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      leftText,
                      style: TextStyle(fontSize: 17, color: color333),
                    ),
                    Spacer(),
                    children!,
                  ],
                )),
          ),
          Visibility(
            child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Divider(
                  height: 0.5,
                )),
            visible: showBottomLine,
          )
        ],
      ),
    );
  }

  /// 删除聊天记录 个人/群组的聊天记录
  _deleteMessageWithRecord() {
    // 删除并且退出相关
  }

  /// 邀请加入群聊 退出群聊
  _inviteGroup({required GroupInviteType type}) {
    if (type == GroupInviteType.add) {

    } else {

    }
  }


}

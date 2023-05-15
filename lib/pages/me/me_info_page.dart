import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/pages/me/me_avatar_page.dart';
import 'package:get/get.dart';
import '../../utils/module_model/user/user_data.dart';
import '../../widgets/appbar/back_appbar.dart';

// 枚举类型
enum MeItem {
  avatar,
  name,
  account,
  qrcode,
}

class MeInfoPage extends StatefulWidget {
  final UserData data;

  const MeInfoPage({Key? key, required this.data}) : super(key: key);

  @override
  State<MeInfoPage> createState() => _MeInfoPageState();
}

class _MeInfoPageState extends State<MeInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  // 点击处理的跳转问题
  void clickPush(MeItem item, BuildContext context){
    if (item == MeItem.avatar) {
      // 点击头像 更换照片
      changeUrl(context);
    } else if (item == MeItem.name) {
      // 跳转到修改名字界面
      pushChangeName(context);
    } else if (item == MeItem.account) {
      showAccount(context);
    } else if (item == MeItem.qrcode) {
      showQrCode(context);
    }
  }


  void changeUrl(BuildContext context){
    Get.to(MeAvatarPage(data: widget.data,));
  }

  void pushChangeName(BuildContext context) {

  }

  /// 显示账号
  void showAccount(BuildContext context) {

  }

  // 去展示二维码界面
  void showQrCode(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "个人信息",
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                MeInfoItem(
                  needBorder: true,
                  leftText: "头像",
                  children: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl:
                          widget.data.avatar!,
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onClickTap: (context){
                    clickPush(MeItem.avatar,context);
                  },
                ),
                MeInfoItem(
                  needBorder: true,
                  leftText: "名字",
                  children: Text(
                    widget.data.name!,
                    style: TextStyle(fontSize: 17, color: Color(0xFF999999)),
                  ),
                  onClickTap: (context){
                    clickPush(MeItem.name,context);
                  },
                ),
                MeInfoItem(
                  needBorder: true,
                  leftText: "账号",
                  children: Container(
                    padding: EdgeInsets.only(left: 80),
                    child: Text(
                      widget.data.accountId!.substring(0,widget.data.accountId!.length - 15) + "...",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17, color: Color(0xFF999999)),
                    ),
                  ),
                  onClickTap: (context){
                    print("点击了账号");
                  },
                ),
                MeInfoItem(
                  needBorder: true,
                  leftText: "我的二维码",
                  children: Image.asset(
                    "assets/images/me_id.png",
                    width: 22,
                    height: 22,
                  ),
                  onClickTap: (context){
                    print("点击我的二维码");
                  },
                ),
                MeInfoItem(
                  needBorder: true,
                  leftText: "更多",
                  children: SizedBox(),
                  onClickTap: (context){
                    print("点击更多");
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                MeInfoItem(
                  needBorder: true,
                  leftText: "我的地址",
                  children: SizedBox(),
                  onClickTap: (context){
                    print("点击我的地址");
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class MeInfoItem extends StatefulWidget {
  final bool needBorder;
  final String leftText;
  final Widget children;
  final void Function(BuildContext)? onClickTap;

  const MeInfoItem(
      {Key? key,
      required this.needBorder,
      required this.leftText,
      required this.children, this.onClickTap})
      : super(key: key);

  @override
  State<MeInfoItem> createState() => _MeInfoItemState();
}

class _MeInfoItemState extends State<MeInfoItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: (){
          widget.onClickTap!(context);
        },
        child: Column(
          children: [
            Container(
              height: 55,
              child: Row(
                children: [
                  Text(widget.leftText,
                      style: TextStyle(fontSize: 17, color: Color(0xFF333333))),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
            Container(
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffEEEEEE),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/global/global_params.dart';
import '../../utils/module_model/user/user_data.dart';
import '../../widgets/appbar/close_appbar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<UserData> accountItems = [
    GlobalParams().currentUser,
    GlobalParams().currentUser
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: CloseTitleBar(
        closeName: "取消",
        rightText: "管理",
        onClickTap: (context) {
          print("点击管理");
        },
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Column(
                children: [
                  Text(
                    "清除登录痕迹",
                    style: TextStyle(color: Color(0xff333333), fontSize: 27),
                  ),
                  Text("仅清除本地登录记录，不清除聊天记录",
                      style: TextStyle(color: Color(0xff333333), fontSize: 15))
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(children: [
                Column(
                  children: accountItems.map((e) {
                    return AccountDetailsItem(
                      user: e,
                    );
                  }).toList(),
                )
              ]),
            ))
          ],
        ),
      ),
    );
  }
}

// 列表的信息
class AccountDetailsItem extends StatefulWidget {
  final UserData user;

  const AccountDetailsItem({required this.user, Key? key}) : super(key: key);

  @override
  State<AccountDetailsItem> createState() => _AccountDetailsItemState();
}

class _AccountDetailsItemState extends State<AccountDetailsItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 81,
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(
                    imageUrl: widget.user.avatar!,
                    width: 50,
                    height: 50,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.user.name}",
                          style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: Text("组织名",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 12,
                            )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: Color(0xffB5EBE6),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.white,
            )),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

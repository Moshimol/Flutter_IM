import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_im/config/app_color.dart';
import 'package:flutter_im/utils/manager/contact_manager.dart';
import 'package:flutter_im/widgets/appbar/main_appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/module_model/contact/contact_data.dart';
import 'package:lpinyin/lpinyin.dart';

import '../../utils/other/custom_avatar.dart';

final double height = 36;

List<String> alphabetsList =
    List.generate(26, (index) => String.fromCharCode(index + 65));

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<List<String>> topItems = [
    ["新的朋友", "new"],
    ["群聊", "group"],
    ["标签", "tag"],
    ["公众号", "message"],
  ];

  Map<String, List<ContactData>> contactDic = {};
  List<ContactData> contactList = [];

  Future<List<ContactData>> _getContactListFuture() async {
    final value = await ContactManager.getContactList();
    if (value["state"] != 1) {
      // Data fetching failed.
      throw Exception('Failed to load message list.');
    }
    List responseJson = value["data"];
    List<ContactData> contactList =
        responseJson.map((m) => new ContactData.fromJson(m)).toList();
    return contactList;
  }

  @override
  void initState() {
    super.initState();
    _getContactListFuture().then((value) {
      // 对value进行处理
      contactList = value;
      _sortContact();
    });
  }

  _sortContact() {
    for (int i = 0; i < contactList.length; i++) {
      ContactData data = contactList[i];
      var firstChr = PinyinHelper.getFirstWordPinyin(data.name!)
          .toUpperCase()
          .substring(0, 1);
      if (contactDic.keys.contains(firstChr)) {
        List<ContactData>? list = contactDic[firstChr];
        list?.add(data);
        contactDic.putIfAbsent(firstChr, () => list!);
      } else {
        contactDic.putIfAbsent(firstChr, () => [data]);
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
          titleName: "通讯录",
          rightIconName: "assets/images/message_add.png",
          onClickTap: (context) {
            _sortContact();
          }),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Color(0xFFF5F5F5),
                width: double.infinity,
                height: 46,
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 12),
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        "assets/images/search_black.webp",
                        width: 15,
                        height: 15,
                      ),
                      SizedBox(width: 10),
                      Text("搜索",
                          style: TextStyle(fontSize: 12, color: color999)),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Column(
                    children: topItems.map((e) {
                      bool needBorder = e != topItems.last;
                      return ContactTopItem(e: e, needBorder: needBorder);
                    }).toList(),
                  ),
                  _contactList(),
                  // ),
                  SizedBox(height: 80)
                ],
              ))
            ],
          ),
          Positioned(
              right: 6,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: alphabetsList.map((e) {
                  var firstKey = e;
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                    child: Text(firstKey,
                        style:
                            TextStyle(fontSize: 9, color: Color(0xFF666666))),
                  );
                }).toList(),
              )),
        ],
      ),
    );
  }

  Widget _contactList() {
    List<dynamic> list = [];
    List<String> keyList = contactDic.keys.toList()..sort();

    return Column(
      children: keyList.map((key) {
        List<ContactData>? listData = contactDic[key];
        // 一般定义只有一个key
        return Column(
          children: [
            Container(
              color: Color(0xFFF5F5F5),
              child: Text(key),
              alignment: Alignment.centerLeft,
              height: 33,
              padding: EdgeInsets.only(left: 16),
            ),
            Column(
              children: listData!.map((current) {
                return FriendItem(
                  needBottom: current != listData.last,
                  singleData: current,
                );
              }).toList(),
            )
            // FriendItem(e: e)
          ],
        );
      }).toList(),
    );
  }
}

class FriendItem extends StatelessWidget {
  final ContactData singleData;
  final bool needBottom;

  const FriendItem(
      {required this.singleData, this.needBottom = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          SizedBox(
            width: 16,
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CustomCacheAvatar(
                name: singleData.name!,
                size: 36,
                url: singleData.avatar!,
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 10),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: Container(
                height: 54,
                child: Text(singleData.name!,
                    style: TextStyle(fontSize: 17, color: Color(0xFF333333))),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: needBottom ? Color(0xffEEEEEE) : Colors.transparent),
                  ),
                ),
                alignment: Alignment.centerLeft,
              ))
        ],
      ),
      onTap: (){
        Get.toNamed("/user_page/${singleData.chatId}",arguments: {"user_data":singleData.toJson()});
      },
    );
  }
}

class ContactTopItem extends StatelessWidget {
  final bool needBorder;
  final List<String> e;

  const ContactTopItem({this.needBorder = false, required this.e, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
        ),
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              "assets/images/contact_${e[1]}.png",
              width: height,
              height: height,
            ),
          ),
          margin: EdgeInsets.symmetric(vertical: 10),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: Container(
          height: 54,
          child: Text(e[0],
              style: TextStyle(fontSize: 17, color: Color(0xFF333333))),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: needBorder ? Color(0xffEEEEEE) : Colors.transparent),
            ),
          ),
          alignment: Alignment.centerLeft,
        ))
      ],
    );
  }
}

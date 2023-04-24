import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../utils/module_model/user/user_data.dart';
import '../../widgets/appbar/back_appbar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "个人信息",
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        child: Row(
                          children: [
                            Text("头像",
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xFF333333))),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.data.avatar ??
                                            "https://p3-passport.byteimg.com/img/user-avatar/d4e4ff8f64d24fa24208deb7b926f4ca~180x180.awebp",
                                        width: 36,
                                        height: 36,
                                        fit: BoxFit.cover,
                                      ),
                                    )
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
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        child: Row(
                          children: [
                            Text("名字",
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xFF333333))),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("名字",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF999999)))
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
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        child: Row(
                          children: [
                            Text("账号",
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xFF333333))),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.data.avatar ??
                                            "https://p3-passport.byteimg.com/img/user-avatar/d4e4ff8f64d24fa24208deb7b926f4ca~180x180.awebp",
                                        width: 36,
                                        height: 36,
                                        fit: BoxFit.cover,
                                      ),
                                    )
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
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        child: Row(
                          children: [
                            Text("我的二维码",
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xFF333333))),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.data.avatar ??
                                            "https://p3-passport.byteimg.com/img/user-avatar/d4e4ff8f64d24fa24208deb7b926f4ca~180x180.awebp",
                                        width: 36,
                                        height: 36,
                                        fit: BoxFit.cover,
                                      ),
                                    )
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
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        child: Row(
                          children: [
                            Text("更多",
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xFF333333))),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: CachedNetworkImage(
                                        imageUrl: widget.data.avatar ??
                                            "https://p3-passport.byteimg.com/img/user-avatar/d4e4ff8f64d24fa24208deb7b926f4ca~180x180.awebp",
                                        width: 36,
                                        height: 36,
                                        fit: BoxFit.cover,
                                      ),
                                    )
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
                      )
                    ],
                  ),
                ),
                Container(
                  color: Color(0xFFEEEEEE),
                  child: SizedBox(
                    height: 19,
                  ),
                ),
                Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        child: Row(
                          children: [
                            Text("更多",
                                style: TextStyle(
                                    fontSize: 17, color: Color(0xFF333333))),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [],
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
                      )
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_im/pages/me/setting_page.dart';
import '../../utils/global/global_params.dart';
import '../../utils/module_model/user/user_data.dart';
import '../../widgets/appbar/main_appbar.dart';
import 'me_info_page.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          titleName: "我",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // 顶部和中间部分
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MeInfoPage(data: GlobalParams().currentUser,)),
                    );
                  },
                  child: MeTopWidget(),
                ),
                Container(
                  color: Color(0xFFEEEEEE),
                  height: 8.5,
                ),
                InkWell(
                  onTap: () {
                    print("点击了设置页面");

                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SettingPage()),
                    );
                  },
                  child: MeBottomList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MeTopWidget extends StatefulWidget {
  const MeTopWidget({Key? key}) : super(key: key);

  @override
  State<MeTopWidget> createState() => _MeTopWidgetState();
}

class _MeTopWidgetState extends State<MeTopWidget> {

  UserData data = GlobalParams().currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl:
                data.avatar ?? "https://p3-passport.byteimg.com/img/user-avatar/d4e4ff8f64d24fa24208deb7b926f4ca~180x180.awebp",
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 18,
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 106 - 76,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name ?? "1",
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  "账号: ${data.accountId}",
                  style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 7),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/me_id.png",
                        width: 16,
                        height: 16,
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 16),
                        child: Image.asset(
                          "assets/images/dis_arrow.png",
                          width: 16,
                          height: 16,
                        ),
                      ))
                    ],
                  )))
        ],
      ),
    );
  }
}

class MeBottomList extends StatefulWidget {
  const MeBottomList({Key? key}) : super(key: key);

  @override
  State<MeBottomList> createState() => _MeBottomListState();
}

class _MeBottomListState extends State<MeBottomList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, top: 8, bottom: 6, right: 16),
            alignment: Alignment.centerLeft,
            child: Image.asset(
              "assets/images/me_setting.png",
              width: 22,
              height: 22,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 46,
            child: Text(
              "设置",
              style: TextStyle(fontSize: 17, color: Color(0xFF333333)),
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16),
            child: Image.asset(
              "assets/images/dis_arrow.png",
              width: 8,
              height: 12.5,
            ),
          )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_im/pages/other/abount_im_page.dart';
import '../../widgets/appbar/back_appbar.dart';
import 'package:flutter_im/utils/manager/account_manager.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<String> setList = ["帮助与反馈", "关于IM", "网络检测"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "设置",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(children:
                // 顶部和中间部分
                [
              Column(
                children: setList.map((e) {
                  return MeSettingSingleList(
                      leftTitle: e, showBottomLine: e != setList.last,index: setList.indexOf(e),onClickTap: (context, index){
                        if (index == 1) {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => AboutImPage()),
                          );
                        }
                  },);
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  print("管理账号页面");

                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  height: 44,
                  child: Text(
                    "管理账号",
                    style: TextStyle(color: Color(0xFF333333), fontSize: 17),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  AccountManager.logOutAction(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  height: 44,
                  child: Text(
                    "退出登录",
                    style: TextStyle(color: Color(0xFF333333), fontSize: 17),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}

class MeSettingSingleList extends StatefulWidget {
  final String leftTitle;
  final bool showBottomLine;
  final int index;
  final void Function(BuildContext,int index)? onClickTap;

  const MeSettingSingleList(
      {Key? key, required this.leftTitle, required this.showBottomLine,required this.index,this.onClickTap})
      : super(key: key);

  @override
  State<MeSettingSingleList> createState() => _MeSettingSingleList();
}

class _MeSettingSingleList extends State<MeSettingSingleList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: (){
          widget.onClickTap!(context,widget.index);
        },
        child: Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Container(
              alignment: Alignment.center,
              height: 46,
              child: Text(
                widget.leftTitle,
                style: TextStyle(fontSize: 17, color: Color(0xFF333333)),
              ),
            ),
            Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: widget.showBottomLine
                                ? Color(0xffEEEEEE)
                                : Colors.transparent,
                          ))),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_im/pages/home/home_page.dart';
import 'package:flutter_im/pages/contact/contact_page.dart';
import 'package:flutter_im/pages/discovery/discovery_page.dart';
import 'package:flutter_im/pages/me/me_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class BottomModel {
  final String iconName;
  final String labelName;

  BottomModel(this.iconName, this.labelName);
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;
  double iconWidthAndHeight = 22;

  PageController pageController = PageController();

  List<BottomModel> items = [
    BottomModel("message", "消息"),
    BottomModel("contant", "通讯录"),
    BottomModel("con", "办公"),
    BottomModel("me", "我"),
  ];

  List<Widget> pages = [HomePage(), ContactPage(), DisPage(), MePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            backgroundColor: Color(0xFFF9F9F9),
            currentIndex: currentIndex,
            iconSize: 44,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF108EE9),
            unselectedItemColor: Color(0xFF999999),
            onTap: (index) {
              currentIndex = index;
              pageController.jumpToPage(currentIndex);
              setState(() {});
            },
            items: items.map((e) {
              BottomModel model = e;
              return BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/tab_${model.iconName}.png',
                    width: iconWidthAndHeight,
                    height: iconWidthAndHeight,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/tab_${model.iconName}_select.png',
                    width: iconWidthAndHeight,
                    height: iconWidthAndHeight,
                  ),
                  label: model.labelName);
            }).toList(),
          ),
          Positioned(
              left: (MediaQuery.of(context).size.width / 4 / 2) + 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                child: Text(
                  "2",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Color(0xFFF15A4A),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
              ))
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          currentIndex = index;
          setState(() {});
        },
        children: pages,
      ),
    );
  }
}

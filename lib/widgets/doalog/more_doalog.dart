import 'package:flutter/material.dart';

void moreDialog(BuildContext context) {
  RenderBox renderBox = context.findRenderObject()! as RenderBox;

  OverlayEntry? entry = null;

  entry = OverlayEntry(builder: (context) {
    return Material(
      color: Color(0x000000).withOpacity(0.6),
      child: MoreDialog(
        dy: renderBox.localToGlobal(Offset.zero).dy,
        dissmissHander: () {
          entry!.remove();
        },
      ),
    );
  });
  Overlay.of(context).insert(entry!);
}

class MoreDialog extends StatefulWidget {
  final VoidCallback dissmissHander;
  final double dy;

  const MoreDialog({required this.dissmissHander, required this.dy, Key? key})
      : super(key: key);

  @override
  State<MoreDialog> createState() => _MoreDialogState();
}

class _MoreDialogState extends State<MoreDialog> {
  List<List<String>> items = [
    ["person.png", "创建群聊"],
    ["scan.png", "扫一扫"],
    ["pay.png", "收付款"],
  ];

  @override
  Widget build(BuildContext context) {
    final double itemHeight = 40;
    final double itemWidth = 120;
    return InkWell(
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
          ),
          margin:
              EdgeInsets.only(top: widget.dy + kToolbarHeight - 5, right: 7),
          width: itemWidth,
          height: itemHeight * 3,
          child: Column(
            children: items.map((e) {
              return Row(
                children: [
                  SizedBox(width: 12),
                  Image.asset(
                    "assets/images/home_more_${e[0]}",
                    width: 21,
                    height: 21,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: itemHeight -1,
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: e != items.last ? Color(0xFFEEEEEE) : Colors.transparent,width: 1)),
                          ),
                          child: Text(
                            e[1],
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF333333)),
                          )))
                ],
              );
            }).toList(),
          ),
        ),
      ),
      onTap: () {
        widget.dissmissHander();
      },
    );
  }
}

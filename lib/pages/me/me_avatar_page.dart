import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/module_model/user/user_data.dart';
import '../../utils/other/AdapUtil.dart';
import '../../widgets/appbar/back_appbar.dart';
import '../../widgets/picker/picker_sheet.dart';

class MeAvatarPage extends StatefulWidget {
  const MeAvatarPage({Key? key, required this.data}) : super(key: key);

  final UserData data;
  @override
  State<MeAvatarPage> createState() => _MeAvatarPageState();
}

class _MeAvatarPageState extends State<MeAvatarPage> {

  changeAvatar() {
    MeHeadBottomSheet.showBottomPicker(
        context: context,
        onClickTap: (index) {
          print(index);
        });
  }

  // 从相册选择照片 然后进行上传

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackBar(
        titleName: "头像",
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: InkWell(
                  onTap: () {
                    changeAvatar();
                  },
                  child: Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
              onTap: () {
                // 清空信息
              },
            );
          }),
        ],
      ),
      body:  Container(
        height: screenHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl:
                widget.data.avatar!,
                width: screenWidth,
                height: screenWidth,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}

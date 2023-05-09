import 'package:flutter/material.dart';

import 'package:flutter_im/main.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import '../../../utils/global/global_params.dart';
import '../../../utils/module_model/user/user_data.dart';
import '../../../widgets/picker/picker_sheet.dart';
import 'create_moment_page.dart';

class MomentPage extends StatefulWidget {
  const MomentPage({Key? key}) : super(key: key);

  @override
  State<MomentPage> createState() => _MomentPageState();
}

class _MomentPageState extends State<MomentPage> {
  UserData? _user;

  @override
  void initState() {
    super.initState();
    _user = GlobalParams().currentUser;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(navigatorKey.currentState!.context).pop();
          },
          child: UnconstrainedBox(
            child: Image.asset(
              "assets/images/white_back.png",
              width: 11,
              height: 18,
            ),
          ),
        ),
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Image.asset(
                  "assets/images/moment_photo.png",
                  width: 21,
                  height: 21,
                ),
              ),
              // 点击和长按的处理方式不一样
              onTap: () {
                _onPublish();
              },
              onLongPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateMomentPage(type: PostMomentType.momentText),
                      fullscreenDialog: true),
                );
              },
            );
          })
        ],
      ),
      body: _mainView(),
    );
  }

  Widget _mainView() {
    return Column(
      children: [_momentHeader()],
    );
  }

  Widget _momentHeader() {
    // 获取屏幕的宽高
    final width = MediaQuery.of(context).size.width;

    return _user == null
        ? Image.asset(
            "assets/images/moment_bg.png",
            height: width * 0.75,
          )
        : Stack(
            children: [
              // 背景
              SizedBox(
                width: width,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Image.network(
                    _user?.friendCirclePic ?? "",
                    height: width * 0.75,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 昵称 头像
              Positioned(
                  right: 15,
                  bottom: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${_user?.name}",style: TextStyle(color: Colors.white,fontSize: 18,letterSpacing: 2,height: 2.0,shadows: [Shadow(
                        color: Colors.black,
                        offset: Offset(1,1),
                        blurRadius: 1
                      )])),
                      SizedBox(
                        width: 5,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          _user?.avatar ?? "",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ))
            ],
          );
  }

  //action
  _onPublish() {
    MomentBottomSheet.showBottomPicker(
        context: context,
        onClickTap: (index) {
          Future.delayed(Duration(milliseconds: 300), () async {
            if (index == 0) {
              // 调用拍摄相关处理
              final AssetEntity? result = await CameraPicker.pickFromCamera(
                context,
                pickerConfig: CameraPickerConfig(
                  enableRecording: true,
                  enableAudio: true,
                ),
              );

              if (result == null) {
                return;
              }

              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => CreateMomentPage(
                          type: PostMomentType.momentVideo,
                        ),
                    fullscreenDialog: true),
              );
            } else {
              //跳转到相册后 然后展示相册内容 选择相册内容后进入发布朋友圈界面
              final List<AssetEntity>? result = await AssetPicker.pickAssets(
                context,
                pickerConfig: AssetPickerConfig(
                    textDelegate: AssetPickerTextDelegate(),
                    requestType: RequestType(1),
                    selectedAssets: [],
                    maxAssets: maxSelectCount),
              );

              if (result == null || result.isEmpty) {
                return;
              }

              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => CreateMomentPage(
                          type: PostMomentType.momentImage,
                          selectAddress: result,
                        ),
                    fullscreenDialog: true),
              );
            }
          });
        });
  }
}

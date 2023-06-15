import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_im/main.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import '../../../utils/global/global_params.dart';
import '../../../utils/manager/moment_manager.dart';
import '../../../utils/module_model/momet/time_line_info.dart';
import '../../../utils/module_model/user/user_data.dart';
import '../../../utils/other/custom_avatar.dart';
import '../../../widgets/picker/picker_sheet.dart';
import '../../../widgets/custom/space.dart';
import 'create_moment_page.dart';
import 'moment_message.dart';
import 'moment_type_widget.dart';

class MomentPage extends StatefulWidget {
  const MomentPage({Key? key}) : super(key: key);

  @override
  State<MomentPage> createState() => _MomentPageState();
}

class _MomentPageState extends State<MomentPage>
    with SingleTickerProviderStateMixin {
  UserData? _user;

  // 标题
  Text? _title;

  OverlayState? _overlayState;

  // 遮罩层:
  OverlayEntry? _overlayEntry;

  // 更多按钮位置 offset:
  Offset _buttonOffset = Offset.zero;

  // 动画控制器:
  late final AnimationController _animationController;

  // 动画本身: (监听的操作放到了动画的`builder`方法里了~)
  late Animation<double> _sizeTween;

  Color _appBarColor = Colors.transparent;
  double _elevation = 0;

  // 朋友圈列表
  List<TimeLineInfo> _timeLineItems = [];
  Map<String, dynamic> _prompt = {"new_notify_num": 0};

  // 滚动控制器
  final ScrollController _scrollController = ScrollController();

  // appbar 背景色
  TimeLineInfo? _currentItem;

  final double _keyboardHeight = 100;

  @override
  void initState() {
    super.initState();

    //  监听  scrollController 动滚动高度 来处理顶部的高度
    _scrollController.addListener(() {
      double pixels = _scrollController.position.pixels;
      if (pixels < 0) pixels = 0;
      if (pixels > 200) {
        double opacity = (pixels - 200) / 100;
        if (opacity < 0.95) {
          _appBarColor = Colors.black.withOpacity(opacity);
        }
        _elevation = 1;
        _title = Text("工作圈");
      } else {
        _appBarColor = Colors.transparent;
        if (pixels > 150) {
          _elevation = pixels / 200;
        } else {
          _elevation = 0;
        }
        _title = null;
      }
      setState(() {});
    });

    _user = GlobalParams().currentUser;

    _loadMomentRequest();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: _title,
        backgroundColor: _appBarColor,
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
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: _momentHeader(),
        ),
        SliverPadding(padding: EdgeInsets.only(bottom: 10)),
        _momentMessage(),
        _momentList()
      ],
    );
  }

  Widget _momentMessage() {
    return SliverToBoxAdapter(
      child: MomentWidget().momentTopInfo(
          promptInfo: _prompt,
          onClickTap: () {
            // 点击了个人提示的信息
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MomentMessage()),
            );
          }),
    );
  }

  // list的一个列表
  Widget _momentList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        TimeLineInfo item = _timeLineItems[index];
        return Column(
          children: [
            _momentListItem(info: item),
            Divider(
              color: Color(0xffEEEEEE),
              height: 1,
            )
          ],
        );
      }, childCount: _timeLineItems.length),
    );
  }

  Widget _momentListItem({required TimeLineInfo info}) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CustomCacheAvatar(
              name: info.creator!.nickname!,
              size: 44,
              url: info.creator!.avatar ?? "",
            ),
          ),
          SpaceHorizontalWidget(),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 昵称
              Text(
                info.creator!.nickname!,
                style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff576B95),
                    fontWeight: FontWeight.bold),
              ),
              Visibility(
                child: SpaceVerticalWidget(),
                visible: info.content!.length > 0,
              ),
              // 正文
              Text(
                info.content!,
                style: TextStyle(fontSize: 17, color: Color(0xff333333)),
              ),
              // 图片
              // 九宫格图片列表 GridView 性能比较差点
              MomentWidget().momentDetails(info: info),
              // 时间
              SpaceVerticalWidget(),
              Row(
                children: [
                  Text("1分钟前",
                      style: TextStyle(fontSize: 14, color: Color(0xff999999))),
                  Spacer(),
                  MomentWidget().likeMenuView(onClickTap: () {
                    //点击的事件  出现点赞或者是其他的
                    setState(() {
                      _currentItem = info;
                    });
                    _showMoreMomentAction();
                  })
                ],
              ),
            ],
          )),
        ],
      ),
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
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Image.asset(
                      "assets/images/moment_bg.png",
                      height: width * 0.75,
                      fit: BoxFit.cover,
                    ),
                    imageUrl: _user!.friendCirclePic!,
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
                      Text("${_user?.name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 2,
                              height: 2.0,
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    offset: Offset(1, 1),
                                    blurRadius: 1)
                              ])),
                      SizedBox(
                        width: 5,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: CachedNetworkImage(
                          imageUrl: _user?.avatar ?? "",
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

  _showMoreMomentAction({Function()? onTap}) {
    // 会展示评论和点赞操作
  }

  _closeMenu() async {}

  _onLike() {
    if (_currentItem == null) return;

    setState(() {
      _currentItem?.isLike = !(_currentItem?.isLike ?? false);
    });

    // 关闭菜单
    _closeMenu();

    // 执行点赞操作
    _likeRequest();
  }

  /// 加载朋友圈数据
  Future<dynamic> _loadData() async {
    final value = await MomentManager.getFriendList(requestId: "0");
    if (value["state"] != 1) {
      // Data fetching failed.
      throw Exception('Failed to load message list.');
    }

    List<TimeLineInfo> items = [];

    for (var item in value["data"]) {
      items.add(TimeLineInfo.fromJson(item));
    }

    return items;
  }

  /// 请求prompt
  Future<dynamic> _loadPrompt() async {
    final value = await MomentManager.getFriendCirclePrompt();
    if (value["state"] != 1) {
      // Data fetching failed.
      throw Exception('Failed to load message list.');
    }
    return value["data"];
  }

  Future<dynamic> _likeRequest() async {
    final value = await MomentManager.priseMoment(
        circleID: _currentItem!.id!, isLike: _currentItem!.isLike!);
    if (value["state"] != 1) {
      // Data fetching failed.
      throw Exception('Failed to load message list.');
    }
    return value["data"];
  }

  // 多个网络请求  initState不允许加上async 所以需要单独提出来进行处理
  Future _loadMomentRequest() async {
    _prompt = await _loadPrompt();
    // 数据请求
    _timeLineItems = await _loadData();

    if (mounted) {
      setState(() {});
    }
  }
}

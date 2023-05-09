import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../../widgets/appbar/custom_appbar.dart';
import '../../../widgets/moment/photo_widget.dart';

const double space = 5.0;
const int maxSelectCount = 9;
const double pagePadding = 15.0;
const int maxContentLength = 140;

enum PostMomentType {
  momentText,
  momentImage,
  momentVideo,
}

class CreateMomentPage extends StatefulWidget {
  final PostMomentType type;
  final List<AssetEntity>? selectAddress;
  const CreateMomentPage({Key? key, required this.type, this.selectAddress}) : super(key: key);

  @override
  State<CreateMomentPage> createState() => _CreateMomentPageState();
}

class _CreateMomentPageState extends State<CreateMomentPage> {
  List<AssetEntity> selectAsset = [];

  // 是否开始拖拽
  bool isDragNow = false;

  // 是否将要删除
  bool isWillRemove = false;

  // 是不是要排序
  bool isWillOrder = false;

  // 被拖动的ID
  String targetAssetId = "";

  // 文本编辑器
  TextEditingController _contentController = TextEditingController();

  // 菜单项
  List<MenuItemModel> _menus = [];

  // 发送朋友圈页面
  @override
  void initState() {
    super.initState();
    _menus = [
      MenuItemModel(
          icon: Icons.local_convenience_store_outlined, title: "所在位置"),
      MenuItemModel(icon: Icons.alternate_email_outlined, title: "提醒谁看"),
      MenuItemModel(icon: Icons.person_outline, title: "谁可以看", right: "公开"),
    ];
    selectAsset = widget.selectAddress!;
  }

  // 主视图
  Widget _mainView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContentInput(),
            Visibility(
              child: _photoList(),
              visible: widget.type != PostMomentType.momentText,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: _buildMenus(),
            )
          ],
        ),
      ),
    );
  }

  // 底部相关列表
  Widget _buildMenus() {
    List<Widget> ws = [];
    for (var menu in _menus) {
      ws.add(ListTile(
        leading: Icon(menu.icon),
        title: Row(
          children: [
            Text(menu.title ?? ""),
            if (menu.right != null) Spacer(),
            if (menu.right != null) Text(menu.right!),
          ],
        ),
        trailing: const Icon(Icons.navigate_next_rounded),
        horizontalTitleGap: -5, // 标题与图标间距
      ));
    }
    return Column(
      children: ws,
    );
  }

  // 图片列表
  Widget _buildPhotoItem(AssetEntity asset, double width) {
    return Draggable(
        data: asset,
        // 事件处理
        onDragStarted: () {
          setState(() {
            isDragNow = true;
          });
        },
        onDragEnd: (details) {
          setState(() {
            isWillOrder = false;
            isDragNow = false;
          });
        },
        onDragCompleted: () {},
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            isWillOrder = false;
            isDragNow = false;
          });
        },
        childWhenDragging: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4))),
          child: AssetEntityImage(
            asset,
            isOriginal: false,
            width: width,
            height: width,
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(0.5),
          ),
          width: width,
          height: width,
        ),
        child: DragTarget<AssetEntity>(
          builder: (context, candidateData, rejectedData) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PhotoGalleryWidget(
                    photoIndex: selectAsset.indexOf(asset),
                    items: selectAsset,
                  );
                }));
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: AssetEntityImage(
                    asset,
                    isOriginal: false,
                    width: width,
                    height: width,
                    fit: BoxFit.cover,
                  )),
            );
          },
          onWillAccept: (data) {
            // 排除自己
            if (data?.id == asset.id) {
              return false;
            }
            setState(() {
              isWillOrder = true;
              targetAssetId = asset.id;
            });
            return true;
          },
          onAccept: (data) {
            // 0 当前元素位置
            int targetIndex = selectAsset.indexWhere((element) {
              return element.id == asset.id;
            });

            // 1 删除原来的
            selectAsset.removeWhere((element) {
              return element.id == data.id;
            });

            // 2 插入到目标前面
            selectAsset.insert(targetIndex, data);

            setState(() {
              isWillOrder = false;
              targetAssetId = "";
            });
          },
          onLeave: (data) {
            setState(() {
              isWillOrder = false;
              targetAssetId = "";
            });
          },
        ),
        feedback: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4))),
          child: AssetEntityImage(
            asset,
            isOriginal: false,
            width: width,
            height: width,
            fit: BoxFit.cover,
          ),
          width: width,
          height: width,
        ));
  }

  // 图片的列表
  Widget _photoList() {
    return LayoutBuilder(
        builder: (contextFromLayoutBuilder, BoxConstraints constraints) {
      final double width = (constraints.maxWidth - space * 2 - 30) / 3;
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Wrap(
          spacing: space,
          runSpacing: space,
          children: [
            for (final asset in selectAsset) _buildPhotoItem(asset, width),
            if (selectAsset.length < maxSelectCount)
              GestureDetector(
                onTap: () async {
                  final List<AssetEntity>? result =
                      await AssetPicker.pickAssets(
                    context,
                    pickerConfig: AssetPickerConfig(
                        textDelegate: AssetPickerTextDelegate(),
                        requestType: RequestType(1),
                        selectedAssets: selectAsset,
                        maxAssets: maxSelectCount),
                  );
                  setState(() {
                    selectAsset = result ?? [];
                  });
                },
                child: Container(
                  width: width,
                  height: width,
                  child: Image.asset(
                    "assets/images/moment_add.png",
                    fit: BoxFit.cover,
                  ),
                ),
              )
          ],
        ),
      );
    });
  }

  // 移除的显示界面
  Widget _deleteRemove() {
    return DragTarget<AssetEntity>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          height: 60,
          width: double.infinity,
          color: isWillRemove ? Color(0xFFF15A4A) : Colors.red[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/moment_post_delete.png",
                width: 22,
                height: 22,
                fit: BoxFit.cover,
              ),
              Text(
                "拖动到此处删除",
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          ),
        );
      },
      onWillAccept: (data) {
        setState(() {
          isWillRemove = true;
        });
        return true;
      },
      onAccept: (data) {
        setState(() {
          selectAsset.remove(data);
          isWillRemove = false;
        });
      },
      onLeave: (data) {
        setState(() {
          isWillRemove = false;
        });
      },
    );
  }

  // 内容输入相关
  Widget _buildContentInput() {
    return LimitedBox(
      maxHeight: 200,
      child: TextField(
        controller: _contentController,
        style: TextStyle(
            color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w400),
        maxLength: maxContentLength,
        maxLines: null,
        decoration: InputDecoration(
          hintText: "输入这一刻的想法",
          hintStyle: TextStyle(
              color: Colors.black12, fontSize: 18, fontWeight: FontWeight.w500),
          border: InputBorder.none,
          counterText: _contentController.text.isEmpty ? "" : null,
        ),
        onChanged: (textValue) {},
      ),
    );
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        style: SystemUiOverlayStyle(statusBarColor: Colors.black),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: pagePadding),
            child: ElevatedButton(
              onPressed: () {
                print("点击发布按钮");
              },
              child: Text("发布"),
            ),
          ),
        ],
      ),
      body: _mainView(context),
      bottomSheet: isDragNow ? _deleteRemove() : null,
    );
  }
}

// 底部的数据模型
class MenuItemModel {
  MenuItemModel({this.icon, this.title, this.right, this.onTap});

  final IconData? icon;
  final String? title;
  final Function()? onTap;
  final String? right;
}

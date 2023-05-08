import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../../../widgets/moment/photo_widget.dart';

const double space = 5.0;
const int maxSelectCount = 9;

class CreateMomentPage extends StatefulWidget {
  const CreateMomentPage({Key? key}) : super(key: key);

  @override
  State<CreateMomentPage> createState() => _CreateMomentPageState();
}

class _CreateMomentPageState extends State<CreateMomentPage> {
  List<AssetEntity> selectAsset = [];

  // 是否开始拖拽
  bool isDragNow = false;

  // 是否将要删除
  bool isWillRemove = false;

  // 主视图
  Widget _mainView(BuildContext context) {
    return Column(
      children: [
        _photoList(),
        Spacer(),
        Visibility(
          child: _deleteRemove(),
          visible: isDragNow,
        )
      ],
    );
  }

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
            isDragNow = false;
          });
        },
        onDragCompleted: () {},
        onDraggableCanceled: (velocity, offset) {
          setState(() {
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
        child: GestureDetector(
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
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
              Text("拖动到此处删除",style: TextStyle(fontSize: 14,color: Colors.white),)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发布"),
      ),
      body: _mainView(context),
      bottomSheet: isDragNow ? _deleteRemove() : null,
    );
  }
}

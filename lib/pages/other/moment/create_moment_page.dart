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

  // 主视图
  Widget _mainView(BuildContext context) {
    return Column(
      children: [
        _photoList()
      ],
    );
  }

  // 图片的列表
  Widget _photoList() {
    return LayoutBuilder(builder: (contextFromLayoutBuilder, BoxConstraints constraints) {
      final double width = (constraints.maxWidth - space * 2 - 30) / 3;
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Wrap(
            spacing:space,
          runSpacing: space,
          children: [
            for (final asset in selectAsset)
              GestureDetector(onTap: () {
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
                    )
                ),
              )
              ,

            if (selectAsset.length < maxSelectCount)
              GestureDetector(
                onTap: () async {
                  final List<AssetEntity>? result = await AssetPicker.pickAssets(
                    context,
                    pickerConfig: AssetPickerConfig(
                        textDelegate: AssetPickerTextDelegate(),
                      requestType: RequestType(1),
                      selectedAssets: selectAsset,
                      maxAssets: maxSelectCount
                    ),
                  );
                  setState(() {
                    selectAsset = result ?? [];
                  });
                },
                child: Container(
                  width: width,
                  height: width,
                  child: Image.asset("assets/images/moment_add.png",fit: BoxFit.cover,),
                ),
              )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发布"),
      ),
      body: _mainView(context),
    );
  }
}

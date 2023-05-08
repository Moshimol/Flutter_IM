import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';


const double space = 10.0;

class CreateMomentPage extends StatefulWidget {
  const CreateMomentPage({Key? key}) : super(key: key);

  @override
  State<CreateMomentPage> createState() => _CreateMomentPageState();
}

class _CreateMomentPageState extends State<CreateMomentPage> {
  List<AssetEntity> _selectAsset = [];

  // 主视图
  Widget _mainView(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              final List<AssetEntity>? result = await AssetPicker.pickAssets(
                context,
                pickerConfig: const AssetPickerConfig(
                    textDelegate: AssetPickerTextDelegate()),
              );
              print(result);

              setState(() {
                _selectAsset = result ?? [];
              });
            },
            child: Text("选取照片")),
        _photoList()
      ],
    );
  }

  // 图片的列表
  Widget _photoList() {
    return LayoutBuilder(builder: (contextFromLayoutBuilder, BoxConstraints constraints) {
      final double width = (constraints.maxWidth - space * 2 - 30) / 3;
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Wrap(
            spacing:space,
          runSpacing: space,
          children: [
            for (final asset in _selectAsset)
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: AssetEntityImage(
                  asset,
                  width: width,
                  height: width,
                  fit: BoxFit.cover,
                )
              ),

            if (_selectAsset.length < 9)
              Container(
                width: width,
                height: width,
                child: Icon(Icons.add,size: 48,),
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

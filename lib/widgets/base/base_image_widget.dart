import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'base_widget.dart';

class BaseImage extends BaseWidget {
  final String? placeholderImage; //占位图
  final String? errorImage; //错误图
  final String? imagePath; //图片地址
  final BoxFit? imageBoxFit; //图片拉伸方式
  final int? imageLoadType; //图片加载类型
  final bool? isClipOval; //是否是圆形
  final double? imageRadius; //设置图片圆角

  const BaseImage(this.imagePath,
      {super.key,
      this.placeholderImage,
      this.errorImage,
      this.imageBoxFit,
      this.imageLoadType,
      this.isClipOval,
      this.imageRadius,
      super.width,
      super.height,
      super.margin,
      super.marginLeft,
      super.marginTop,
      super.marginRight,
      super.marginBottom,
      super.padding,
      super.paddingLeft,
      super.paddingTop,
      super.paddingRight,
      super.paddingBottom,
      super.backgroundColor,
      super.strokeWidth,
      super.strokeColor,
      super.solidColor,
      super.radius,
      super.isCircle,
      super.leftTopRadius,
      super.rightTopRadius,
      super.leftBottomRadius,
      super.rightBottomRadius,
      super.childWidget,
      super.alignment,
      super.gradient,
      super.gradientBegin,
      super.gradientEnd,
      super.gradientColorList,
      super.gradientColorStops,
      super.onClick,
      super.onDoubleClick,
      super.onLongPress});

  @override
  Widget getWidget(BuildContext context) {
    //不需要占位图
    if (placeholderImage == null) {
      return getEndWidget(getImage());
    } else {
      return getEndWidget(getFadeInImage());
    }
  }

  /*
  * 返回最终的Widget
  * */
  Widget getEndWidget(widget) {
    //设置图片为圆形
    if (isClipOval == true) {
      return ClipOval(child: widget);
    }
    //设置图片圆角
    if (imageRadius != null) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(imageRadius!), child: widget);
    }
    return widget;
  }

  /*
  * 有无占位图组件
  * */
  Widget getFadeInImage() {
    return FadeInImage(
        fit: imageBoxFit ?? BoxFit.contain,
        placeholderFit: imageBoxFit ?? BoxFit.contain,
        placeholder: getPlaceholder(),
        image: getImageProvider(),
        placeholderErrorBuilder: (ctx, err, stackTrace) => _imagePlaceholder(),
        imageErrorBuilder: (ctx, err, stackTrace) => _imageError());
  }

  /*
  * 无占位图组件
  * */
  Widget getImage() {
    return Image(
        image: getImageProvider(),
        fit: imageBoxFit ?? BoxFit.contain,
        errorBuilder: (ctx, err, stackTrace) => _imageError());
  }

  /*
  * 占位图错误组件
  * */
  Widget _imagePlaceholder() {
    return Image.asset("", fit: imageBoxFit ?? BoxFit.contain);
  }

  /*
  * 错误组件
  * */
  Widget _imageError() {
    var imagePath = "";
    if (errorImage != null) {
      imagePath = errorImage!;
    }
    return Image.asset(imagePath, fit: imageBoxFit ?? BoxFit.contain);
  }

  /*
  * 判断图片是网络还是本地还是应用内
  * */
  ImageProvider getImageProvider() {
    if (imageLoadType == null) {
      return NetworkImage(imagePath!);
    } else if (imageLoadType == 0) {
      return FileImage(File(imagePath!));
    } else {
      return AssetImage(imagePath!);
    }
  }

  /*
  * 占位图
  * */
  ImageProvider getPlaceholder() {
    return AssetImage(placeholderImage!);
  }

  // 默认的图片拼接的地址
  String getAllLocalImage(String imageName) {
    return "assets/images/" + imageName;
  }
}
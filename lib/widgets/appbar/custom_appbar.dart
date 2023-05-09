import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.elevation,
    this.style
  });

  /// 此属性控制应用栏下方阴影的大小 [shadowColor] 不为空。
  final double? elevation;

  /// 用于应用栏 [材质] 的填充颜色。
  final Color? backgroundColor;

  /// 在工具栏的 [title] 之前显示的小部件。
  final Widget? leading;

  /// 在 [title] 小部件之后显示在一行中的小部件列表。
  final List<Widget>? actions;

  final SystemUiOverlayStyle? style;

  @override
  Size get preferredSize => const Size.fromHeight(30);

  Widget _mainView() {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? 0,
      leading: leading,
      actions: actions,
      systemOverlayStyle: style ?? null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _mainView();
  }
}
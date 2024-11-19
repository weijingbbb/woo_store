import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

/// 功能栏项
class BarItemWidget extends StatelessWidget {
  final String title;
  final String svgPath;

  const BarItemWidget({
    super.key,
    required this.title,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图标
      IconWidget.svg(
        svgPath,
        size: 24.sp,
        color: context.colors.scheme.primary,
      ).paddingBottom(AppSpace.iconTextSmail),

      // 标题
      TextWidget.label(
        title,
      ),
    ].toColumn();
  }
}

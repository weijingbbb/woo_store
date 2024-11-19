import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:woo_store/widgets/index.dart';

// 页面标题 组件
class PageTitleWidget extends StatelessWidget {
  /// 标题
  final String title;

  /// 说明
  final String? desc;

  const PageTitleWidget({
    super.key,
    required this.title,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextWidget.h2(title),
      if (desc != null) TextWidget.label(desc!),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(
          left: 10,
          top: 10,
          bottom: 30,
        );
  }
}
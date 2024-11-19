import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:woo_store/widgets/index.dart';

/// 按钮列表项
class ButtonItemWidget extends StatelessWidget {
  final String title;
  final String svgPath;
  final Color? color;
  final Function()? onTap;

  const ButtonItemWidget({
    super.key,
    required this.title,
    required this.svgPath,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? context.colors.scheme.primary;
    return ListTileWidget(
      // 头部图标
      leading: <Widget>[
        // 底部圆形
        Container().tightSize(30.w).decorated(
              // 按主色 0.2 的透明度
              color: color.withOpacity(0.2),
              // 圆形边框
              borderRadius: BorderRadius.circular(30.w / 2),
            ),

        // 叠加图标
        IconWidget.svg(
          svgPath,
          color: color,
          size: 14.w,
        ),
      ].toStack(
        alignment: Alignment.center,
      ),

      // 背景色
      backgroundColor: context.colors.scheme.surface,

      // 间距
      leadingSpace: 20.w,

      // 标题
      title: TextWidget.label(
        title,
        size: 15.sp,
        weight: FontWeight.w400,
      ),

      // 右侧箭头
      trailing: <Widget>[
        IconWidget.icon(
          Icons.arrow_forward_ios,
          size: 14.w,
          color: context.colors.scheme.outline,
        ),
      ],
    ).inkWell(
      onTap: onTap,
    );
  }
}

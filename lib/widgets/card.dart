import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

/// 卡片组件
class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    this.title,
    this.description,
    this.content,
    this.footer,
    this.titleString,
    this.descriptionString,
    this.padding,
    this.backgroundColor,
    this.radius,
    this.border,
    this.width,
    this.height,
    this.elevation,
  });

  final Widget? title;
  final Widget? description;
  final Widget? content;
  final Widget? footer;

  final String? titleString;
  final String? descriptionString;

  final double? padding;
  final Color? backgroundColor;
  final double? radius;
  final double? border;
  final double? width;
  final double? height;
  final double? elevation;

  Widget _buildView(BuildContext context) {
    List<Widget> ws = [];

    // 标题
    if (title != null) {
      ws.add(title!);
    } else if (titleString != null) {
      ws.add(TextWidget.h4(titleString!));
    }

    // 描述
    if (description != null) {
      ws.add(description!);
    } else if (descriptionString != null) {
      ws.add(TextWidget.muted(descriptionString!));
    }

    // 内容
    if (content != null) {
      ws.add(content!);
    }

    // 底部
    if (footer != null) {
      ws.add(footer!);
    }

    // 组件
    Widget child = ws.toColumnSpace(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
    );

    // 内边距
    child = child.padding(
      horizontal: padding ?? AppPadding.card.horizontal,
      vertical: padding ?? AppPadding.card.vertical,
    );

    // 背景、圆角、边框
    child = child.decorated(
      color: backgroundColor ?? context.colors.scheme.surface,
      borderRadius: BorderRadius.circular(
        radius ?? AppRadius.card,
      ),
      border: Border.all(
        color: context.colors.scheme.outline,
        width: border ?? AppBorder.card,
      ),
    );

    // 阴影
    child = child.elevation(
      elevation ?? AppElevation.card,
      borderRadius: BorderRadius.circular(
        radius ?? AppRadius.card,
      ),
      shadowColor: context.colors.shadow,
    );

    // 约束
    if (width != null || height != null) {
      child = child.tight(
        height: height,
        width: width,
      );
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return _buildView(context);
  }
}

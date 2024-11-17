import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

/// 底部弹出框
class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.content,
    this.title,
    this.cancel,
    this.confirm,
    this.onCancel,
    this.onConfirm,
    this.minimum,
    this.titleString,
    this.padding,
    this.backgroundColor,
    this.radius,
    this.border,
    this.width,
    this.height,
    this.elevation,
  });

  final Widget content;
  final Widget? title;
  final Widget? cancel;
  final Widget? confirm;

  final String? titleString;
  final double? padding;
  final Color? backgroundColor;
  final double? radius;
  final double? border;
  final double? width;
  final double? height;
  final double? elevation;

  final void Function()? onCancel;
  final void Function()? onConfirm;
  final EdgeInsets? minimum;

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget content,
    Widget? title,
    Widget? confirm,
    Widget? cancel,
    String? titleString,

    // 样式
    double? padding,
    Color? backgroundColor,
    double? radius,
    double? border,
    double? width,
    double? height,
    double? elevation,

    // 回调
    void Function()? onConfirm,
    void Function()? onCancel,
    EdgeInsets? minimum,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      barrierColor: const Color(0xFF09101D).withOpacity(0.7),
      builder: (BuildContext context) {
        return BottomSheetWidget(
          title: title,
          confirm: confirm,
          cancel: cancel,
          titleString: titleString,
          padding: padding,
          backgroundColor: backgroundColor,
          radius: radius,
          border: border,
          width: width,
          height: height,
          elevation: elevation,
          onConfirm: onConfirm,
          onCancel: onCancel,
          minimum: minimum,
          content: content,
        );
      },
    );
  }

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildView(BuildContext context) {
    List<Widget> ws = [];

    // 标题
    if (widget.title != null) {
      ws.add(widget.title!);
    } else if (widget.titleString != null) {
      ws.add(TextWidget.h4(
        widget.titleString!,
        size: 16, // 字体和 body 一致小些
      ));
    }

    // 内容
    ws.add(widget.content);

    // 组件
    Widget child = ws.toColumnSpace(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
    );

    // 内边距
    child = child.padding(
      horizontal: widget.padding ?? AppPadding.bottomSheet.horizontal,
      vertical: widget.padding ?? AppPadding.bottomSheet.vertical,
    );

    // 背景、圆角、边框
    child = child.decorated(
      color: widget.backgroundColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(
        widget.radius ?? AppRadius.card,
      ),
      // border: Border.all(
      //   color: context.colors.scheme.outline,
      //   width: widget.border ?? AppBorder.card,
      // ),
    );

    // 阴影
    // child = child.elevation(
    //   widget.elevation ?? AppElevation.card,
    //   borderRadius: BorderRadius.circular(
    //     widget.radius ?? AppRadius.card,
    //   ),
    //   shadowColor: context.colors.shadow,
    // );

    // 约束
    if (widget.width != null || widget.height != null) {
      child = child.tight(
        height: widget.height,
        width: widget.width,
      );
    }

    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return child.scrollable();
      },
      animationController: _animationController,
      showDragHandle: false,
      enableDrag: false, // false 才有拖动效果
      backgroundColor: widget.backgroundColor ?? context.colors.scheme.surface,
      elevation: widget.elevation,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView(context);
  }
}
